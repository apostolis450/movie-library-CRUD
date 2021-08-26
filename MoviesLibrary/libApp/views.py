from django.shortcuts import render,redirect
from django.http import HttpResponse,JsonResponse
import json, datetime

from .oauth_fiware import OAuth2 #external file
auth_app = OAuth2()

# login portal from keyrock
auth_uri = auth_app.authorize_url()
signout_uri = auth_app.signout_user_uri()
# Create your views here.

# def index(request):

def home(request):
    logged_in = request.session.get('uid',False)
    context = {
        'logged_in' : logged_in,
        'auth_uri' : auth_uri,
        'signout_uri' : signout_uri,
    }
    # print(logged_in)
    return render(request, 'libApp/base.html', context)

# after USER login -> localhost:8000/app
def main(request):
    logged_in = request.session.get('uid',False)
    uname = request.session.get('uname',None)
    role = request.session.get('role',None)
    tk = request.session.get('token',None)
    context = {
        'logged_in' : logged_in,
        'auth_uri' : auth_uri,
        'signout_uri' : signout_uri,
        'uname' : uname,
        'role' : role,
        'token' : tk,
    }
    if not logged_in:
        redirect('home')
    else:
        if role == 'user':
            res = auth_app.get_movies_user(request.session.get('token', None))
            context['movies'] = res
        elif role == 'cinemaowner':
            print(logged_in)
            res = auth_app.get_movies_owner(request.session.get('token', None))
            context['movies'] = res
            context['cinema_name'] = res[0]['cinema']
    # print(logged_in)
    return render(request, 'libApp/main.html', context)

# redirect from main/button[favorites]
def favorites(request):
    logged_in = request.session.get('uid',False)
    uname = request.session.get('uname',None)
    role = request.session.get('role',None)
    tk = request.session.get('token',None)
    context = {
        'logged_in' : logged_in,
        'auth_uri' : auth_uri,
        'signout_uri' : signout_uri,
        'uname' : uname,
        'role' : role,
        'token' : tk,
    }
    if not logged_in:
        redirect('home')
    else:
        if role == 'user':
            res = auth_app.get_fav_movies_user(request.session.get('token', None))
            context['movies'] = res
            # print(res)
        else:
            pass
    
    return render(request, 'libApp/favorites.html', context)

def manageMovies(request):
     return render(request, 'libApp/cinema.html', context)


#grab token after authorization and get user info from Keyrock
#store useful info as session variables
def auth(request):
    token = auth_app.get_token(request.GET['code'])
    response = HttpResponse(
                json.dumps(token),
                content_type="application/json"
            )
    tk = token['access_token']
    user = auth_app.get_user_info(tk)
    # set session variables
    request.session['uid'] = user['id']
    request.session['token'] = tk
    request.session['uname'] = user['username']
    if user['id'] == 'admin':
        request.session['role'] = 'admin'
    else:
        request.session['role'] = user['roles'][0]['name']
    # print(request.session['uid'])
    # print(request.session['token'])
    # print(request.session['role']['name'])
    #return response
    return redirect('main')

#idm logout is done by DELETE /auth/external_logout..
#and finaly here session is deleted
def logout(request):
    request.session.flush()
    return redirect('home')