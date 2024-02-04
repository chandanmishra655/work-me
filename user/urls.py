from user import views
from django.urls import path, include, re_path
from django.contrib import admin

app_name = 'user'

urlpatterns = [
    path('login/', views.login_user, name='login_user'),
    path('register/', views.register, name='register'),
    path('logout/', views.logout_user, name='logout'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('membership/', views.membership, name='membership'),
    path('transaction/', views.transaction, name='transaction'),
    path('individual/', views.individual, name='individual'),
    path('get_individual_list/', views.get_individual_list, name='get_individual_list'),
    path('organizational/', views.organizational, name='organizational'),
    path('get_organizational_list/', views.get_organizational_list, name='get_organizational_list'),
    path('accredited/', views.accredited, name='accredited'),
    path('get_accredited_list/', views.get_accredited_list, name='get_accredited_list'),
    path('update_profile/<int:id>/', views.update_profile, name='update_profile'),
    path('change_password_popup/', views.change_password_popup, name='change_password_popup'),
    path('checkout/', views.checkout, name='checkout'),
    path('get_state/', views.get_state, name='get_state'),
    # path('reset_password_confirm/(?P<id>[0-9A-Za-z]+)-(?P<token>.+)/', views.PasswordResetConfirmView.as_view(), name='reset_password_confirm'),
    path('reset_password/', views.ResetPasswordRequestView.as_view(), name="reset_password"),
    path('get_transaction_list/', views.get_transaction_list, name="get_transaction_list"),
    path('admin_transaction/', views.admin_transaction, name="admin_transaction"),
    path('get_admin_transaction_list/', views.get_admin_transaction_list, name="get_admin_transaction_list"),
    path('multi_part/', views.multi_part, name="multi_part"),
    path('applied_update/<int:id>/', views.applied_update, name="applied_update"),
    path('user_list/', views.user_list, name="user_list"),
    path('certificate/', views.certificate, name="certificate"),
    path('user_suspend_delete/', views.user_suspend_delete, name="user_suspend_delete"),
    path('add_user/', views.add_user, name="add_user"),
    path('edit_user/', views.edit_user, name="edit_user"),
    path('get_user_list/', views.get_user_list, name="get_user_list"),
    path('check_email_exist/', views.check_email_exist, name="check_email_exist"),
    path('invoice_generate/<str:download_id>/', views.invoice_generate, name="invoice_generate"),
]
