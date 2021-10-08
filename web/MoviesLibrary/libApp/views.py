from django.shortcuts import render,redirect
from django.http import HttpResponse,JsonResponse,HttpResponseRedirect
from django.contrib import messages
import json, datetime, time
import sys, logging

from .oauth_fiware import OAuth2 #external file
auth_app = OAuth2()

# login portal from keyrock
auth_uri = auth_app.authorize_url()
signout_uri = auth_app.signout_user_uri()
orion_notf_api = auth_app.orion_notf_api
# Create your views here.


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
    logged_in = request.session.get('uid',False) #USER KEYROCK ID
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
            context['orion_notf'] = orion_notf_api
        elif role == 'cinemaowner':
            # request only owner's cinema movies
            res = auth_app.get_movies_owner(request.session.get('token', None),logged_in)
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
            return render(request, 'libApp/favorites.html', context)        
        else:
            return render(request,'libApp/403.html',context={})
    
def subscriptions(request):
    logged_in = request.session.get('uid',False)
    uname = request.session.get('uname',None)
    role = request.session.get('role',None)
    tk = request.session.get('token',None)
    wilma_url = auth_app.wilma_url
    context = {
        'logged_in' : logged_in,
        'auth_uri' : auth_uri,
        'signout_uri' : signout_uri,
        'uname' : uname,
        'role' : role,
        'token' : tk,
        'wilma_url':wilma_url,
    }
    if not logged_in:
        redirect('home')
    else:
        if role == 'user':
            return render(request, 'libApp/subscriptions.html', context)        
        else:
            return render(request,'libApp/403.html',context={})

#This functionality is done here, not with ajax call
def add_movie(request):
    logged_in = request.session.get('uid',False)
    uname = request.session.get('uname',None)
    role = request.session.get('role',None)
    tk = request.session.get('token',None)
    wilma_url = auth_app.wilma_url
    context = {
        'logged_in' : logged_in,
        'auth_uri' : auth_uri,
        'signout_uri' : signout_uri,
        'uname' : uname,
        'role' : role,
        'token' : tk,
        # 'url_id': id,
        'wilma_url': wilma_url,
    }
    if not logged_in:
        redirect('home')
    else:
        if role == 'cinemaowner':
            context.pop('response_message',None)
            if request.method == 'POST':
                #form return a queryset and gets tricky, this way I have the needed dict(as JSON)
                content = json.loads(json.dumps(request.POST))
                content.pop('csrfmiddlewaretoken',None)
                content['uid'] = logged_in
                # Pass data to auth file, then send the request to db API from there
                res = auth_app.register_movie_owner(request.session.get('token', None),content)
                # -------------------to take info about the cinema owner
                # sleep(0.1)
                res_cin = auth_app.get_movies_owner(request.session.get('token', None),logged_in)
                content['cinema_name'] = res_cin[0]['cinema']
                # -------------------create entity at orion's DB (TODO: add title as attribute-ommited it)
                # sleep(0.1)
                orion_res = auth_app.create_entity_orion(request.session.get('token', None),content)
                messages.success(request, 'Successfully added!')
                return HttpResponseRedirect("/app/add-movies")
            return render(request, 'libApp/add_movie.html',context)
        else:
            return render(request,'libApp/403.html')

def manage_movie(request,id):
    logged_in = request.session.get('uid',False)
    uname = request.session.get('uname',None)
    role = request.session.get('role',None)
    tk = request.session.get('token',None)
    wilma_url = auth_app.wilma_url
    context = {
        'logged_in' : logged_in,
        'auth_uri' : auth_uri,
        'signout_uri' : signout_uri,
        'uname' : uname,
        'role' : role,
        'token' : tk,
        'url_id': id,
        'wilma_url': wilma_url,
    }
    if not logged_in:
        redirect('home')
    else:
        if role == 'cinemaowner':
            return render(request, 'libApp/edit_movie.html',context)
        else:
            return render(request,'libApp/403.html')

def ajax_create_entity(request):
    if request.is_ajax():
        orion_res = auth_app.create_entity_orion(request.session.get('token', None),request)
        return JsonResponse(orion_res,safe=False)
    pass

# get chosen movie only for edit 
def ajax_manage_movie(request,id):
    if request.method == 'GET':
        res = auth_app.get_movie_owner_edit(request.session.get('token', None),id)
        return JsonResponse(res,safe=False)
    
def ajax_owner_movies(request,uid):
    if request.is_ajax():
        res=auth_app.get_movies_owner(request.session.get('token', None), uid)
        return JsonResponse(json.dumps(res),safe=False)

def ajax_favorites(request):
    if request.is_ajax():
        res = auth_app.get_fav_movies_user(request.session.get('token', None))
        return JsonResponse(json.dumps(res),safe=False)


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
#and session variables get deleted
def logout(request):
    request.session.flush()
    logged_in = True #if not logged_in -> returns False -> forbidden
    return redirect('home')