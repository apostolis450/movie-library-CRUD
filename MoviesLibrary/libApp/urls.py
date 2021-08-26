from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('app', views.main, name='main'),
    path('app/favorites', views.favorites, name='favorites'),
    path('app/manage-movies', views.manageMovies, name='manage-movies'),
    path('signout', views.logout, name='signout')
]