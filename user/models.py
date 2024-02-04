from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.
from django.utils.text import slugify


class OmPrefix(models.Model):
    op_id = models.BigAutoField(primary_key=True)
    op_code = models.CharField(max_length=25, null=True)
    op_name = models.CharField(max_length=100, null=True)

    def __str__(self):
        return self.op_code

    class Meta:
        db_table = 'om_prefix'


class OmSuffix(models.Model):
    os_id = models.BigAutoField(primary_key=True)
    os_code = models.CharField(max_length=25, null=True)
    os_name = models.CharField(max_length=100, null=True)

    def __str__(self):
        return self.os_code

    class Meta:
        db_table = 'om_suffix'


class Country(models.Model):
    id = models.BigAutoField(primary_key=True)
    sortname = models.CharField(max_length=25, null=True)
    name = models.CharField(max_length=100, null=True)
    phonecode = models.IntegerField(null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'countries'


class State(models.Model):
    id = models.BigAutoField(primary_key=True)
    country = models.ForeignKey(Country, null=True, on_delete=models.CASCADE)
    name = models.CharField(max_length=100, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'states'


class OmMembershipPlan(models.Model):
    CHOICES = [
        ('1', 'Individual'),
        ('2', 'Organizational'),
        ('3', 'Accreditation')
    ]
    omp_id = models.BigAutoField(primary_key=True)
    omp_code = models.CharField(max_length=25, null=True)
    omp_name = models.CharField(max_length=100, null=True)
    omp_desc = models.CharField(max_length=250, default='', null=True, help_text='Subscription description')
    # omp_desc2 = models.CharField(max_length=250, default='', null=True)
    # omp_desc3 = models.CharField(max_length=250, default='', null=True)
    # omp_desc4 = models.CharField(max_length=250, default='', null=True)
    omp_price = models.CharField(max_length=10, default=0, null=True)
    omp_duration = models.PositiveSmallIntegerField(null=True)
    omp_plan_type = models.CharField(default='1', max_length=100, choices=CHOICES, help_text='1=>Individual, '
                                                                                             '2=>Organizational, '
                                                                                             '3=>Accreditation')
    omp_order_by = models.PositiveSmallIntegerField(null=True)
    omp_is_display = models.BooleanField(default=True)

    def __str__(self):
        return self.omp_code

    class Meta:
        db_table = 'om_membership_plan'


class CustomUser(AbstractUser):
    user_op = models.ForeignKey(OmPrefix, null=True, on_delete=models.PROTECT)
    first_name = models.CharField(max_length=100, null=True)
    middle_name = models.CharField(max_length=100, null=True)
    last_name = models.CharField(max_length=100, null=True)
    phone_number = models.BigIntegerField(null=True)
    user_os = models.ForeignKey(OmSuffix, null=True, on_delete=models.PROTECT)
    organization = models.CharField(max_length=500, null=True)
    title = models.CharField(max_length=100, null=True)
    address1 = models.CharField(max_length=500, null=True)
    address2 = models.CharField(max_length=500, null=True)
    city = models.CharField(max_length=100, null=True)
    user_oc = models.ForeignKey(Country, null=True, on_delete=models.PROTECT)
    user_ost = models.ForeignKey(State, null=True, on_delete=models.PROTECT)
    zip_code = models.CharField(max_length=10, null=True)
    image = models.FileField(upload_to='profile/', null=True)
    certificate = models.FileField(upload_to='certification_documents/', null=True)
    int_province = models.CharField(max_length=500, null=True)
    store_exception = models.CharField(max_length=500, null=True)
    membership = models.ForeignKey(OmMembershipPlan, null=True, on_delete=models.PROTECT)
    start_date = models.DateTimeField(null=True, help_text='Subscription start date')
    end_date = models.DateTimeField(null=True, help_text='Subscription end date')
    is_subscribe = models.IntegerField(default=0, null=True, help_text='1=>subscribe, 0=>not subscribe')
    user_type = models.IntegerField(default=0, null=True,
                                    help_text='1=>admin, 2=>Individual, 3=>Organizational, 4=>Accredited, 5=> super '
                                              'admin')
    created_dt = models.DateTimeField(auto_now_add=True)
    admin_user = models.BooleanField(default=False)
    is_delete = models.IntegerField(default=0)
    is_suspend = models.IntegerField(default=0)
    created_by_id = models.IntegerField(default=0)
    mode_of_payment_id = models.IntegerField(default=0, help_text='0=>online, 1=>Offline , 2> By Accrediated Member')
    payment_status_id = models.IntegerField(default=0, help_text='2=>Pending, 1=>Done, 0=> Cancel')

    def __str__(self):
        return self.username

    class Meta:
        db_table = 'user_master'
