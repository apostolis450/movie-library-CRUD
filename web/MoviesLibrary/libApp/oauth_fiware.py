import base64
import requests.auth
import requests
import sys

try:
    from urllib import urlencode
except ImportError:
    from urllib.parse import urlencode

try:
    import simplejson as json
except ImportError:
    import json


class OAuth2(object):
    def __init__(self):
        # Should make these secrets env variables
        self.client_id = '47d89a60-79f3-423a-8898-1bfe823c3769'  # IDM APP CLIENT ID
        self.client_secret = '2bbd6ede-b454-4e64-8009-377a7a4c29df'  # IDM APP CLIENT SECRET

        raw_auth_code = '{}:{}'.format(self.client_id, self.client_secret)
        self.base_64_auth_code = base64.b64encode(raw_auth_code.encode('utf-8')).decode('utf-8')

        self.redirect_uri = 'http://127.0.0.1:8000/auth'  # CALLBACK URL REGISTERED ON IDM (UI APP AUTH ADDRESS)

        self.idm_address = 'http://10.10.1.5:3000/'  # IDM ADDRESS
        self.authorization_url = self.idm_address + 'oauth2/authorize' # AUTHORIZATION URL
        self.token_url = self.idm_address + 'oauth2/token' # TOKEN URL
        self.signout_url = self.idm_address + 'auth/external_logout?_method=DELETE' 

        self.wilma_url = 'http://10.10.1.3:1027/'
        self.orion_wilma_url = 'http://10.10.1.10:1027/'
        self.orion_notf_api = 'http://10.10.1.2:5000/'

    def authorize_url(self, **kwargs):
        oauth_params = {'response_type': 'code','scope': 'token,permanent','state':'xyz', 'redirect_uri': self.redirect_uri, 'client_id': self.client_id}
        oauth_params.update(kwargs)
        return '{}?{}'.format(self.authorization_url, urlencode(oauth_params))

    def get_token(self,code):
        #headers = {
         #   'Authorization': 'Basic {}'.format(self.base_64_auth_code),
         #   'Content-Type': 'application/x-www-form-urlencoded'
          #      }
        data = {
            "grant_type":"authorization_code",
            "code": code,
            "redirect_uri": self.redirect_uri
            }
        response = requests.post(self.token_url, data=data, verify=False, allow_redirects=False, auth=(self.client_id, self.client_secret))
        str_response_content = response.content.decode('utf-8')
        token_dict = json.loads(str_response_content)
        return token_dict


    def get_user_info(self, token):
        response = requests.get(self.idm_address + 'user?access_token=' + token)
        me_json = response.json()
        return me_json

    def signout_user_uri(self):
        uri = self.signout_url + '&client_id=' + self.client_id
        return uri
        
    # --------------> Calling api through pep proxy with token to get data from mongodb
    def get_movies_user(self,token):
        headers = {
            'X-Auth-Token' : token
        }
        uri = self.wilma_url + 'api/movies'
        response = requests.get(uri, headers=headers)
        # str_res = response.content.decode('utf-8')
        # dict_res = json.loads(str_res)
        return response.json() 
    
    def get_fav_movies_user(self,token):
        headers = {
            'X-Auth-Token' : token
        }
        uri = self.wilma_url + 'api/favorites'
        response = requests.get(uri, headers=headers)
        return response.json() 

    def get_movies_owner(self,token,uid):
        headers = {
            'X-Auth-Token' : token
        }
        uri = self.wilma_url + 'api/movies/owner/' + uid
        response = requests.get(uri, headers=headers)
        return response.json() 
    
    def get_movie_owner_edit(self,token,mvid):
        headers = {
            'X-Auth-Token' : token
        }
        uri = self.wilma_url + 'api/movie-owner/' + mvid
        response = requests.get(uri, headers=headers)
        return response.json() 
    
    def register_movie_owner(self,token,data):
        headers = {
            'X-Auth-Token' : token,
            'dataType' : 'json'
        }
        uri = self.wilma_url + 'api/movie-owner/1' #passing 1 randomly cause api just because waits for something there
        response = requests.post(uri,headers=headers,data=json.dumps(data))
        return response

    def movie_subscribe(self,token,mvid):
        headers = {
            'X-Auth-Token' : token,
            'Content-Type' : 'application/json'
        }
        body = {
          "description": "A subscription to a movie",
          "subject": {
            "entities": [
              {
                "id": mvid,
                "type": "Movie"
              }
            ],
            "condition": {
              "attrs": [ #these are the triggers for notification
                "title",
                "cinema",
                "category",
                "start_date",
                "end_date"
              ]
            }
          },
          "notification": {
            "http": {
              "url": self.orion_notf_api + "api/orion"
            },
            "attrs": [
                "title",
                "cinema",
                "category",
                "start_date",
                "end_date"
            ]
          },
          "expires": "2040-01-01T14:00:00.00Z",
          "throttling": 5
        }
        uri = self.orion_wilma_url + '/v2/subscriptions'
        # response = request.post(uri,headers=headers,body=body)
        # return response.json
        pass

    def create_entity_orion(self,token,data):
        headers = {
            'X-Auth-Token' : token,
            'Content-Type' : 'application/json'
        }
        body = {
            # Orion doesnt accept spaces in id's, so replaced it with dash
            "id" : data['movie-title'].replace(' ','-'),
            "type" : "movie",
            "category" : {
                "value": data['category'],
                "type": "String"
            },
            "cinema" : {
                "value" : data['cinema_name'],
                "type" : "String"
            },
            "start_date" : {
                "value" : data['sdate'],
                "type"  : "Date"
            },
            "end_date" : {     
                "value" : data['edate'],
                "type"  : "Date"
            }        
        }
        uri = self.orion_wilma_url + 'v2/entities'
        res = requests.post(uri,headers=headers, data=json.dumps(body)) 
        return res