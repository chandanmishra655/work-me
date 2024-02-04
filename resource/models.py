from django.db import models
from user.models import OmMembershipPlan, CustomUser

# Create your models here.
from user.models import CustomUser


class UploadDocuments(models.Model):
    doc_name = models.CharField(max_length=100, null=True)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True)
    file = models.FileField(upload_to='documents/', null=True)
    status = models.CharField(max_length=10, null=True)
    member_type = models.CharField(max_length=10, null=True, help_text='0=>all, 1=>individual, 2=>organizational , '
                                                                       '3=>accredited ')
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(null=True)

    def __str__(self):
        return self.doc_name

    class Meta:
        db_table = 'upload_documents'


class UploadVideo(models.Model):
    video_name = models.CharField(max_length=100, null=True)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True)
    file = models.FileField(upload_to='videos/', null=True)
    status = models.CharField(max_length=10, null=True)
    member_type = models.CharField(max_length=10, null=True, help_text='0=>all, 1=>individual, 2=>organizational , '
                                                                       '3=>accredited ')
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(null=True)

    def __str__(self):
        return self.video_name

    class Meta:
        db_table = 'upload_videos'


class UploadImage(models.Model):
    image_name = models.CharField(max_length=100, null=True)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True)
    file = models.FileField(upload_to='images/', null=True)
    status = models.CharField(max_length=10, null=True)
    member_type = models.CharField(max_length=10, null=True, help_text='0=>all, 1=>individual, 2=>organizational , '
                                                                       '3=>accredited ')
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(null=True)

    def __str__(self):
        return self.image_name

    class Meta:
        db_table = 'upload_image'


class UploadDocumentsMembershipMapping(models.Model):
    udmm_document = models.ForeignKey(UploadDocuments, null=True, on_delete=models.CASCADE)
    udmm_membership = models.ForeignKey(OmMembershipPlan, null=True, on_delete=models.PROTECT)

    def __str__(self):
        return str(self.udmm_document)

    class Meta:
        db_table = 'upload_documents_membership_mapping'


class UploadVideoMembershipMapping(models.Model):
    uvmm_video = models.ForeignKey(UploadVideo, null=True, on_delete=models.CASCADE)
    uvmm_membership = models.ForeignKey(OmMembershipPlan, null=True, on_delete=models.PROTECT)

    def __str__(self):
        return str(self.uvmm_video)

    class Meta:
        db_table = 'upload_video_membership_mapping'


class UploadImageMembershipMapping(models.Model):
    uimm_image = models.ForeignKey(UploadImage, null=True, on_delete=models.CASCADE)
    uimm_membership = models.ForeignKey(OmMembershipPlan, null=True, on_delete=models.PROTECT)

    def __str__(self):
        return str(self.uimm_image)

    class Meta:
        db_table = 'upload_image_membership_mapping'


class CertificationUploadDocuments(models.Model):
    doc_name = models.CharField(max_length=100, null=True)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True)
    file = models.FileField(upload_to='certification_documents/', null=True)
    status = models.CharField(max_length=10, null=True)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(null=True)

    def __str__(self):
        return self.doc_name

    class Meta:
        db_table = 'certification_upload_documents'


class CertificationUploadDocumentsMapping(models.Model):
    cerdoc_document = models.ForeignKey(CertificationUploadDocuments, null=True, on_delete=models.CASCADE)
    cerdoc_user = models.ForeignKey(CustomUser, null=True, on_delete=models.PROTECT)

    def __str__(self):
        return str(self.cerdoc_document)

    class Meta:
        db_table = 'certification_upload_doc_mapping'

