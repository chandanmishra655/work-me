from django.db import models
from user.models import CustomUser

# Create your models here.


class PaperList(models.Model):
    paper_id = models.AutoField(primary_key=True)
    paper_title = models.TextField(null=True)
    paper_desc = models.TextField(null=True)
    paper_file = models.FileField(upload_to='paper', blank=True, null=True)
    paper_user = models.ForeignKey(CustomUser, null=True, on_delete=models.PROTECT)
    paper_cr_dt = models.DateTimeField(auto_now=True, null=True)
    paper_upd_dt = models.DateTimeField(null=True)
    paper_marks = models.IntegerField(default=0)
    paper_rank = models.IntegerField(default=0)
    paper_submit_tf = models.BooleanField(default=False, null=True)

    def __str__(self):
        return self.paper_title

    class Meta:
        db_table = 'paper_list'


class VerifiedPaper(models.Model):
    vp_id = models.AutoField(primary_key=True)
    vp_user = models.ForeignKey(CustomUser, null=True, on_delete=models.PROTECT)
    vp_paper1 = models.ForeignKey(PaperList, null=True, related_name='vp_paper1', on_delete=models.PROTECT)
    vp_paper2 = models.ForeignKey(PaperList, null=True, related_name='vp_paper2', on_delete=models.PROTECT)
    vp_selected_paper = models.ForeignKey(PaperList, null=True, related_name='vp_selected_paper', on_delete=models.PROTECT)
    vp_cr_dt = models.DateTimeField(auto_now=True)
    vp_upd_dt = models.DateTimeField(null=True)

    class Meta:
        db_table = 'verified_paper'


