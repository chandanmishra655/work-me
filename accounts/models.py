from django.db import models

# Create your models here.
from user.models import CustomUser, OmMembershipPlan


class UserInfo(models.Model):
    user = models.ForeignKey(CustomUser, null=True, on_delete=models.PROTECT)
    # facility info
    facility_ceo_name = models.CharField(max_length=100, null=True)
    facility_ceo_phone = models.BigIntegerField(null=True)
    facility_ceo_email = models.CharField(max_length=100, null=True)
    # Medical/Clinical
    medical_director_name = models.CharField(max_length=100, null=True)
    medical_director_phone = models.BigIntegerField(null=True)
    medical_director_email = models.CharField(max_length=100, null=True)
    # Contact for AAQF
    cnt_aaqf_name = models.CharField(max_length=100, null=True)
    cnt_aaqf_phone = models.BigIntegerField(null=True)
    cnt_aaqf_email = models.CharField(max_length=100, null=True)
    # Accounting Contact
    acnt_name = models.CharField(max_length=100, null=True)
    acnt_phone = models.BigIntegerField(null=True)
    acnt_email = models.CharField(max_length=100, null=True)
    web_facility_type = models.CharField(max_length=100, null=True, help_text='Facility Website')
    providers = models.CharField(max_length=100, null=True, help_text='Service Providers')
    tax_identification_no = models.CharField(max_length=100, null=True)
    others = models.CharField(max_length=100, null=True)
    accreditation = models.ForeignKey(OmMembershipPlan, null=True, on_delete=models.CASCADE, help_text='accreditation plans')
    survey_dt = models.DateTimeField(auto_now_add=True)
    save_as = models.CharField(default='2', max_length=100, null=True, help_text='1=>submit, 2=>draft')
    created_dt = models.DateTimeField(auto_now_add=True)
    admin_user = models.BooleanField(default=False)

    def __str__(self):
        return self.user

    class Meta:
        db_table = 'user_info'


class UserInfoMapping(models.Model):
    user_info = models.ForeignKey(UserInfo, null=True, on_delete=models.PROTECT)
    trf_owner_name = models.CharField(max_length=200, null=True, help_text='Transfer Business Owner Name')
    trf_personal_address = models.CharField(max_length=200, null=True, help_text='Transfer Personal Address')
    trf_phone = models.BigIntegerField(null=True, help_text='Transfer Phone')
    trf_email = models.CharField(max_length=100, null=True, help_text='Transfer Phone')

    def __str__(self):
        return self.trf_owner_name

    class Meta:
        db_table = 'user_info_mapping'
