import base64
import requests.auth
import requests

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
        
    def get_movies_user(self,token):
        headers = {
            'X-Auth-Token' : token
        }
        uri = self.wilma_url + 'api/movies'
        response = requests.get(uri, headers=headers)
        # str_res = response.content.decode('utf-8')
        # dict_res = json.loads(str_res)
        return response.json() 




"""
response from  /user?access_token=
{
    "organizations":[],"displayName":"",
    "roles":[{"id":"e088940d-463e-48ab-9215-e597990ec5f6","name":"test"}],
    "app_id":"9f45b53d-f67e-4733-87bc-85810b160637",
    "trusted_apps":[],
    "isGravatarEnabled":false,
    "id":"d23ec977-add4-456d-a367-adf77f2adaa3",
    "authorization_decision":"",
    "app_azf_domain":"",
    "eidas_profile":{},
    "attributes":{},
    "shared_attributes":"",
    "username":"nikolakis",
    "email":"nikolakis@mpampinos.com",
    "given_name":"nikolakis",
    "family_name":"nikolakis",
    "image":"","gravatar":"",
    "extra":"",
    "sub":"d23ec977-add4-456d-a367-adf77f2adaa3"
    }
"""