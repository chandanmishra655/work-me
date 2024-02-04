from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from .models import *
from django.contrib.auth import get_user_model
# from currency.models import *
# from address.models import *


User = get_user_model()


class CustomUserCreationForm(UserCreationForm):

    class Meta(UserCreationForm.Meta):
        model = CustomUser
        fields = ('username', 'email')


class CustomUserChangeForm(UserChangeForm):

    class Meta:
        model = CustomUser
        fields = ('username', 'email')


class LoginForm(forms.Form):
    username = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control formtextbox', 'placeholder': 'Enter Username'}
    ), required=True, max_length=50)
    password = forms.CharField(widget=forms.PasswordInput(
        attrs={'class': 'form-control formtextbox', 'placeholder': 'Enter password'}
    ), required=True, max_length=50)


class PasswordResetRequestForm(forms.Form):
    email_or_username = forms.CharField(label=("Email Or Username"), max_length=254)


class UsersRegistrationForm(forms.ModelForm):

    current_company = forms.CharField(required=True, label=('Pre Processing'), max_length=50 )

    username = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control name', 'placeholder': ''}
    ), required=True, max_length=50)
    email = forms.CharField(widget=forms.EmailInput(
        attrs={'class': 'form-control email', 'placeholder': ''}
    ), required=True, max_length=50)
    fullname = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control name', 'placeholder': ''}
    ), required=True, max_length=50)
    mobile = forms.IntegerField(widget=forms.NumberInput(
        attrs={'class': 'form-control mobile', 'placeholder': ''}
    ), required=True, )
    address = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control address', 'placeholder': ''}
    ), required=True, max_length=250)
    password = forms.CharField(widget=forms.PasswordInput(
        attrs={'class': 'form-control password', 'placeholder': ''}
    ), required=True, max_length=50)
    confirm_password = forms.CharField(widget=forms.PasswordInput(
        attrs={'class': 'form-control password', 'placeholder': ''}
    ), required=True, max_length=50)

    class Meta:
        model = CustomUser
        fields = ['username', 'email', 'fullname', 'mobile', 'address', 'password', 'current_company']

#
# def get_list():
#     currency_list = [('None', 'None')]
#     for i in CurrencyMaster.objects.values_list('id', 'currency_name'):
#         currency_list.append(i)
#     return currency_list

## Start of new changes in currency............


# def get_list():
#     currency_list = [('None', 'None')]
#     for i in Fm_currency.objects.values_list('currency_id', 'currency_description'):
#         currency_list.append(i)
#     return currency_list

## End of new changes in currency..............


# def get_address():
#     address_code = []
#     for i in Address_Master.objects.values_list('id', 'address_code'):
#         address_code.append(i)
#     return address_code

## Start of new changes in get_address..


# def get_address():
#     address_code = [('None', 'None')]
#     for i in Om_address.objects.values_list('add_id', 'add_code'):
#         address_code.append(i)
#     return address_code

## End of new changes in get_address..

# class Company_forms(forms.ModelForm):
#
#     company_code = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control code item_required','style':"text-transform:uppercase",'placeholder': '', 'id': "c_code",'autocomplete':'off'}
#     ), required=True, max_length=25)
#     name = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control name', 'placeholder': '','autocomplete':'off'}
#     ), required=False, max_length=250)
#     long_name = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control name ', 'placeholder': '','autocomplete':'off'}
#     ), required=False, max_length=40)
#     company_address1 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control address', 'placeholder': '', 'autocomplete':'off'}
#     ), required=False, max_length=40)
#     company_address2 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control address', 'placeholder': '','autocomplete':'off'}
#     ), required=False, max_length=40)
#     company_address3 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control address', 'placeholder': '','autocomplete':'off'}
#     ), required=False, max_length=40)
#     logo_file_name = forms.FileField(widget=forms.FileInput(
#         attrs={'data-table-id':'header_table','class': 'form-control name item_required ', 'placeholder': '', 'id':'logo_file_name'}
#     ), required=True)
#     address_code = forms.ChoiceField(choices=get_address,widget=forms.Select(
#         attrs={'data-table-id':'header_table','class': 'form-control code  selectpicker cus-dropdown-search item_required','id':'address_code', 'data-live-search': 'true'}
#     ))
#     base_currency = forms.ChoiceField(choices=get_list, widget=forms.Select(attrs={
#         'data-table-id':'header_table','class': 'form-control currency selectpicker cus-dropdown-search item_required','id':'base_currency', 'data-live-search': 'true'
#     }))
#     currency1 = forms.ChoiceField(choices=get_list, widget=forms.Select(
#         attrs={'data-table-id':'header_table','class': 'form-control currency selectpicker cus-dropdown-search ', 'data-live-search': 'true'}
#     ))
#     currency2 = forms.ChoiceField(choices=get_list, widget=forms.Select(
#         attrs={'data-table-id':'header_table','class': 'form-control currency selectpicker cus-dropdown-search', 'data-live-search': 'true'}
#     ))
#
#     start_date = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control','name':'start_date', 'id': 'start_date_picker',
#                                                              'autocomplete': 'off', 'placeholder': ''}),
#                                required=True)
#
#     end_date = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control','name':'end_date', 'id': 'date_picker',
#                                                              'autocomplete': 'off', 'placeholder': ''}),
#                                required=True)
#     class Meta:
#         model = Company_master
#         fields = ['company_code', 'name', 'long_name', 'company_address1', 'company_address2', 'company_address3',
#                   'logo_file_name', 'address_code', 'base_currency', 'currency1', 'currency2','start_date','end_date']



## Start of new changes in company form...............

# class Company_forms(forms.ModelForm):
#
#     comp_code = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control code item_required','style':"text-transform:uppercase",'placeholder': '', 'id': "c_code",'autocomplete':'off'}
#     ), required=True, max_length=25)
#     comp_description = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control name item_required' ,'id':'desc', 'placeholder': '','autocomplete':'off'}
#     ), required=False, max_length=250)
#     comp_short_description = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control  item_required name ', 'placeholder': '','autocomplete':'off'}
#     ), required=False, max_length=40)
#     comp_address1 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control item_required address', 'placeholder': '', 'autocomplete':'off'}
#     ), required=False, max_length=40)
#     comp_address2 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control address item_required', 'placeholder': '','autocomplete':'off'}
#     ), required=False, max_length=40)
#     comp_address3 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control address', 'placeholder': '','autocomplete':'off'}
#     ), required=False, max_length=40)
#     comp_logo_file_name = forms.FileField(widget=forms.FileInput(
#         attrs={'data-table-id':'header_table','class': 'form-control name item_required ', 'placeholder': '', 'id':'logo_file_name'}
#     ),required=False)
#     comp_address_code = forms.ChoiceField(choices=get_address,widget=forms.Select(
#         attrs={'data-table-id':'header_table','class': 'form-control code  selectpicker cus-dropdown-search item_required','id':'address_code', 'data-live-search': 'true'}
#     ))
#     comp_base_currency = forms.ChoiceField(choices=get_list, widget=forms.Select(attrs={
#         'data-table-id':'header_table','class': 'form-control currency selectpicker cus-dropdown-search item_required','id':'base_currency', 'data-live-search': 'true'
#     }))
#     comp_currency1 = forms.ChoiceField(choices=get_list, widget=forms.Select(
#         attrs={'data-table-id':'header_table','class': 'form-control currency selectpicker cus-dropdown-search ', 'data-live-search': 'true'}
#     ))
#     comp_currency2 = forms.ChoiceField(choices=get_list, widget=forms.Select(
#         attrs={'data-table-id':'header_table','class': 'form-control currency selectpicker cus-dropdown-search', 'data-live-search': 'true'}
#     ))
#
#     comp_start_dt = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control item_required','name':'start_date', 'id': 'start_date_picker',
#                                                              'autocomplete':'off', 'placeholder': '','readonly': 'readonly'}),
#                                required=True)
#
#     comp_end_dt = forms.DateField(widget=forms.TextInput(attrs={'class': 'form-control','name':'end_date', 'id': 'date_picker',
#                                                              'autocomplete': 'off', 'placeholder': '','readonly': 'readonly'}),
#                                required=False)
#     class Meta:
#         model = Om_company
#         fields = ['comp_code', 'comp_description', 'comp_short_description', 'comp_address1', 'comp_address2', 'comp_address3',
#                   'comp_address_code', 'comp_base_currency', 'comp_logo_file_name','comp_currency1', 'comp_currency2','comp_start_dt','comp_end_dt']

## End of new changes in company form.............................

class SetPasswordForm(forms.Form):

    error_messages = {
        'password_mismatch': ("The two password fields didn't match."),
        }
    new_password1 = forms.CharField(label=("New password"),
                                    widget=forms.PasswordInput(attrs={'class': 'form-control '}))
    new_password2 = forms.CharField(label=("New password confirmation"),
                                    widget=forms.PasswordInput(attrs={'class': 'form-control '}))

    def clean_new_password2(self):
        password1 = self.cleaned_data.get('new_password1')
        password2 = self.cleaned_data.get('new_password2')
        print(password1)
        if password1 and password2:
            if password1 != password2:
                raise forms.ValidationError(
                    self.error_messages['password_mismatch'],
                    code='password_mismatch',
                    )
        return password2


class UsersEditForm(forms.ModelForm):

    current_company = forms.CharField(required=True, label=('Pre Processing'), max_length=50)

    username = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control name', 'placeholder': ''}
    ), required=True, max_length=50)
    email = forms.CharField(widget=forms.EmailInput(
        attrs={'class': 'form-control email', 'id': 'email', 'placeholder': ''}
    ), required=True, max_length=50)
    fullname = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control name', 'placeholder': ''}


    ), required=True, max_length=50)
    mobile = forms.IntegerField(widget=forms.NumberInput(
        attrs={'class': 'form-control mobile', 'placeholder': ''}
    ), required=True, )
    address = forms.CharField(widget=forms.TextInput(

        attrs={'class': 'form-control address', 'id': 'addre', 'placeholder': ''}
    ), required=True, max_length=250)

    class Meta:
        model = CustomUser
        fields = ['username', 'email', 'fullname', 'mobile', 'address', 'password', 'current_company']
        exclude = ('password',)


# class Company_forms_edit(forms.ModelForm):
#
#     company_code = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control code item_required','style':"text-transform:uppercase", 'style':"text-transform:uppercase",'placeholder': '', 'id': "c_code", 'readonly': 'readonly'}
#     ), required=True, max_length=100)
#     name = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control name', 'placeholder': '','autocomplete':'off'}
#     ), required=False, max_length=250)
#     long_name = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control name ', 'placeholder': '','autocomplete':'off'}
#     ), required=False, max_length=40)
#     company_address1 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control address', 'placeholder': '', }
#     ), required=False, max_length=500)
#     company_address2 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control address', 'placeholder': ''}
#     ), required=False, max_length=500)
#     company_address3 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id':'header_table','class': 'form-control address', 'placeholder': ''}
#     ), required=False, max_length=500)
#     logo_file_name = forms.FileField(widget=forms.FileInput(
#         attrs={'data-table-id':'header_table','class': 'form-control name item_required ','style':"padding:1px  5px", 'placeholder': '', 'id':'logo_file_name'}
#     ), required=True)
#     address_code = forms.ChoiceField(choices=get_address, widget=forms.Select(
#         attrs={'data-table-id': 'header_table',
#                'class': 'form-control code  selectpicker cus-dropdown-search item_required', 'id': 'address_code',
#                'data-live-search': 'true'}
#     ))
#     base_currency = forms.ChoiceField(choices=get_list, widget=forms.Select(attrs={
#         'data-table-id':'header_table','class': 'form-control currency selectpicker cus-dropdown-search item_required','id':'base_currency', 'data-live-search': 'true'
#     }))
#     currency1 = forms.ChoiceField(choices=get_list, widget=forms.Select(
#         attrs={'data-table-id':'header_table','class': 'form-control currency selectpicker cus-dropdown-search ', 'data-live-search': 'true'}
#     ))
#     currency2 = forms.ChoiceField(choices=get_list, widget=forms.Select(
#         attrs={'data-table-id':'header_table','class': 'form-control currency selectpicker cus-dropdown-search', 'data-live-search': 'true'}
#     ))
#
#     start_date = forms.DateField(
#         widget=forms.TextInput(attrs={'class': 'form-control', 'name': 'start_date', 'id': 'start_date_picker',
#                                       'autocomplete': 'off', 'placeholder': ''}),
#         required=True)
#
#     end_date = forms.DateField(
#         widget=forms.TextInput(attrs={'class': 'form-control', 'name': 'end_date', 'id': 'date_picker',
#                                       'autocomplete': 'off', 'placeholder': ''}),
#         required=True)
#
#
#
#     class Meta:
#         model = Company_master
#         fields = ['company_code', 'name', 'long_name', 'company_address1', 'company_address2', 'company_address3',
#                   'logo_file_name', 'address_code', 'base_currency', 'currency1', 'currency2','start_date','end_date']

## Start of new changes in comapny edit form .......................................

# class Company_forms_edit(forms.ModelForm):
#
#     comp_code = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id': 'header_table', 'class': 'form-control code item_required',
#                'style': "text-transform:uppercase", 'style': "text-transform:uppercase",
#                'placeholder': '', 'id': "c_code", 'readonly': 'readonly'}
#     ), required=True, max_length=100)
#     comp_description = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id': 'header_table', 'class': 'form-control  item_required name', 'placeholder': '',
#                'autocomplete': 'off'}
#     ), required=False, max_length=250)
#     comp_short_description = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id': 'header_table', 'class': 'form-control  item_required name ', 'placeholder': '',
#                'autocomplete':'off'}
#     ), required=False, max_length=40)
#     comp_address1 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id': 'header_table', 'class': 'form-control item_required address', 'placeholder': '', }
#     ), required=False, max_length=500)
#     comp_address2 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id': 'header_table', 'class': 'form-control address item_required', 'placeholder': ''}
#     ), required=False, max_length=500)
#     comp_address3 = forms.CharField(widget=forms.TextInput(
#         attrs={'data-table-id': 'header_table', 'class': 'form-control address', 'placeholder': ''}
#     ), required=False, max_length=500)
#     comp_logo_file_name = forms.FileField(widget=forms.FileInput(
#         attrs={'data-table-id': 'header_table', 'class': 'form-control name item_required ',
#                'style': "padding:1px  5px", 'placeholder': '', 'id': 'logo_file_name'}
#     ), required=False)
#     comp_address_code = forms.ChoiceField(choices=get_address, widget=forms.Select(
#         attrs={'data-table-id': 'header_table', 'class': 'form-control code  selectpicker cus-dropdown-search item_required',
#                'id': 'address_code', 'data-live-search': 'true'}
#     ))
#     comp_base_currency = forms.ChoiceField(choices=get_list, widget=forms.Select(attrs={
#         'data-table-id': 'header_table', 'class': 'form-control currency selectpicker cus-dropdown-search item_required',
#         'id': 'base_currency', 'data-live-search': 'true'
#     }))
#     comp_currency1 = forms.ChoiceField(choices=get_list, widget=forms.Select(
#         attrs={'data-table-id': 'header_table', 'class': 'form-control currency selectpicker cus-dropdown-search ',
#                'data-live-search': 'true', 'disabled': 'disabled'}
#     ))
#     comp_currency2 = forms.ChoiceField(choices=get_list, widget=forms.Select(
#         attrs={'data-table-id': 'header_table', 'class': 'form-control currency selectpicker cus-dropdown-search',
#                'data-live-search': 'true', 'disabled': 'disabled'}
#     ))
#     comp_start_dt = forms.DateField(
#         widget=forms.TextInput(attrs={'class': 'form-control', 'name': 'start_date', 'id': 'start_date_picker',
#                                       'autocomplete': 'off', 'placeholder': '', 'readonly': 'readonly'}),
#         required=True)
#     comp_end_dt = forms.DateField(
#         widget=forms.TextInput(attrs={'class': 'form-control', 'name': 'end_date', 'id': 'date_picker',
#                                       'autocomplete': 'off', 'placeholder': '', 'readonly': 'readonly'}),
#         required=False)
#
#     class Meta:
#         model = Om_company
#         fields = ['comp_code', 'comp_description', 'comp_short_description', 'comp_address1', 'comp_address2',
#                   'comp_address3', 'comp_logo_file_name', 'comp_address_code', 'comp_base_currency', 'comp_currency1',
#                   'comp_currency2', 'comp_start_dt', 'comp_end_dt']

# End of new changes in comapny edit form