from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('app', views.main, name='main'),
    path('favorites', views.favorites, name='favorites'),
    # path('cinema', views.cinema, name='cinema'),
    path('signout', views.logout, name='signout')
]