from accounts import views
from django.urls import path, include, re_path
from django.contrib import admin

app_name = 'accounts'

urlpatterns = [
    path('admin/', views.admin_login, name='admin_login'),
    path('logout/', views.logout_user, name='logout'),
    path('dashboard/', views.dashboard, name='dashboard'),
]
