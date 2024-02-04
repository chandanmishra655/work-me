from . import views
from django.urls import path

app_name = 'add_paper'

urlpatterns = [
    path('add_paper/', views.add_paper, name='add_paper'),
    path('view_paper/', views.view_paper, name='view_paper'),
    path('edit_paper/<int:id>/', views.edit_paper, name='edit_paper'),
    path('submit_paper/<int:id>/', views.submit_paper, name='submit_paper'),
    path('delete_paper/<int:id>/', views.delete_paper, name='delete_paper'),
    path('verify_paper/', views.verify_paper, name='verify_paper'),

]
