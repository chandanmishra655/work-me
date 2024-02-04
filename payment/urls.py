from payment import views
from django.urls import path, include, re_path
from django.contrib import admin

app_name = 'payment'

urlpatterns = [
    path('transaction/', views.transaction, name='transaction'),
    path('checkout_page/', views.checkout_page, name='checkout_page'),
    path('accreditation_checkout/', views.accreditation_checkout, name='accreditation_checkout'),
    path('config/', views.config, name='config'),
    path('checkout_session/', views.checkout_session, name='checkout_session'),
    path('success/', views.success, name='success'),
    path('canceled/', views.canceled, name='canceled'),
    path('renew/', views.renew, name='renew'),
    path('create_image/', views.create_image, name='create_image'),
]
