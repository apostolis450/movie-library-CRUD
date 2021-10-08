from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('app', views.main, name='main'),
    path('app/favorites', views.favorites, name='favorites'),
    path('app/subscriptions', views.subscriptions, name='subscriptions'),
    path('app/add-movies', views.add_movie, name='add-movies'),
    path('app/manage-movie/<str:id>', views.manage_movie, name='manage-movie'),

    path('ajax/favorites', views.ajax_favorites, name='ajax_favorites'),
    path('ajax/manage-movie/<str:id>', views.ajax_manage_movie, name='ajax-manage-movie'),
    path('ajax/owner-movies/<str:uid>',views.ajax_owner_movies,name='ajax-owner-movies'),
    path('ajax/create-entity',views.ajax_create_entity,name='ajax-create-entity'),

    path('signout', views.logout, name='signout'),

]