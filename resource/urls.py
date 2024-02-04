from django.urls import path, include, re_path
from django.contrib import admin
from resource import views

app_name = 'resource'

urlpatterns = [
    path('document/', views.document, name='document'),
    path('document_update/<int:id>/', views.document_update, name='document_update'),
    path('document_list/', views.document_list, name='document_list'),
    path('get_document_list/', views.get_document_list, name='get_document_list'),
    path('image/', views.image, name='image'),
    path('image_update/<int:id>/', views.image_update, name='image_update'),
    path('image_list/', views.image_list, name='image_list'),
    path('get_image_list/', views.get_image_list, name='get_image_list'),
    path('video/', views.video, name='video'),
    path('video_update/<int:id>/', views.video_update, name='video_update'),
    path('video_list/', views.video_list, name='video_list'),
    path('get_video_list/', views.get_video_list, name='get_video_list'),
    path('certification_document/', views.certification_document, name='certification_document'),
    path('certification_document_update/', views.certification_document_update, name='certification_document_update'),
    path('certification_document_list/', views.certification_document_list, name='certification_document_list'),
    path('get_certificate_list/', views.get_certificate_list, name='get_certificate_list'),
    path('show_certificate/', views.show_certificate, name='show_certificate'),
    path('show_resources/', views.show_resources, name='show_resources'),
    path('get_users/', views.get_users, name='get_users'),
    path('data_delete/', views.data_delete, name='data_delete')
]