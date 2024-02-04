from django.db import models

# Create your models here.
from user.models import CustomUser, OmMembershipPlan


class Payment(models.Model):
    user = models.ForeignKey(CustomUser, null=True, on_delete=models.PROTECT)
    plan = models.ForeignKey(OmMembershipPlan, null=True, on_delete=models.PROTECT)
    trans_id = models.CharField(max_length=200, null=True, help_text='Payment transaction id')
    order_id = models.CharField(max_length=200, null=True, help_text='Payment order id')
    user_email = models.CharField(max_length=200, null=True)
    customer_ref = models.CharField(max_length=200, null=True, help_text='payment customer reference')
    currency = models.CharField(max_length=200, null=True)
    payment_status = models.CharField(max_length=200, null=True, help_text='success, failed')
    payment_mode = models.CharField(max_length=100, null=True)
    payment_for = models.CharField(default='buy subscription', max_length=100, null=True)
    amount = models.DecimalField(default=0.00, max_digits=20, decimal_places=3, null=True)
    created_dt = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.trans_id

    class Meta:
        db_table = 'payment'


class UserCertificate(models.Model):
    user = models.ForeignKey(CustomUser, null=True, on_delete=models.PROTECT)
    certificate = models.FileField(upload_to='certification_documents/', null=True)
    membership = models.ForeignKey(OmMembershipPlan, null=True, on_delete=models.PROTECT)
    created_dt = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.membership

    class Meta:
        db_table = 'user_certificate'