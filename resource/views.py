from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from payment.models import UserCertificate
from resource.models import UploadDocuments, UploadImage, UploadVideo, UploadDocumentsMembershipMapping, \
    UploadVideoMembershipMapping, UploadImageMembershipMapping, CertificationUploadDocumentsMapping, \
    CertificationUploadDocuments
from user.models import OmMembershipPlan, CustomUser
from user.views import get_date_format


@login_required
def document(request):
    if request.method == 'POST':
        form = request.POST
        form1 = request.FILES
        doc_name = form.get('doc_name')
        doc_file = form1.get('doc_file')
        try:
            user_id = request.session['id']
        except KeyError:
            user_id = None

        if doc_name == '':
            messages.success(request, 'Document file is required')
            return redirect('/resource/document/')
        if doc_file == '':
            messages.success(request, 'Upload document file')
            return redirect('/resource/document/')

        visible_for = form.get('visible_for')
        # if visible_for == '':
        #     messages.success(request, 'Visible for is required')
        #     return redirect('/resource/document/')
        qs = UploadDocuments.objects.create(doc_name=doc_name,
                                            user_id=user_id,
                                            file=doc_file,
                                            member_type=visible_for,
                                            status=1)
        membership_mapping(request, qs.pk, 'DOC')
        if qs:
            messages.success(request, 'Document Uploaded Successfully')
            return redirect('/resource/document/')
        else:
            messages.success(request, 'Document not Uploaded')
            return redirect('/resource/document/')
    else:
        return render(request, 'upload_document.html')


@login_required
def document_update(request, id):
    if request.method == 'POST':
        form = request.POST
        form1 = request.FILES
        doc_name = form.get('doc_name')
        doc_file = form1.get('doc_file')
        try:
            user_id = request.session['id']
        except KeyError:
            user_id = None

        if doc_name == '':
            messages.success(request, 'Document file is required')
            return redirect('/resource/document_update/' + str(id) + '/')
        if doc_file == '':
            messages.success(request, 'Upload document file')
            return redirect('/resource/document_update/' + str(id) + '/')

        visible_for = form.get('visible_for')
        # if visible_for == '':
        #     messages.success(request, 'Visible for is required')
        #     return redirect('/resource/document_update/' + str(id) + '/')
        qs = UploadDocuments.objects.filter(pk=id).update(doc_name=doc_name,
                                                          user_id=user_id,
                                                          file=doc_file,
                                                          member_type=visible_for
                                                          )

        doc_file_path = form.get('doc_file_path')
        if doc_file_path and doc_file:
            upload_file = doc_file
        else:
            upload_file = doc_file_path

        qs_upd = UploadDocuments.objects.get(pk=id)
        qs_upd.file = upload_file
        qs_upd.save()
        membership_mapping(request, id, 'DOC')
        if qs:
            messages.success(request, 'Document Uploaded Successfully')
            return redirect('/resource/document_update/' + str(id) + '/')
        else:
            messages.success(request, 'Document not Uploaded')
            return redirect('/resource/document_update/' + str(id) + '/')
    else:
        header = UploadDocuments.objects.get(pk=id)

        member_list = list(
            UploadDocumentsMembershipMapping.objects.filter(udmm_document_id=id).values_list('udmm_membership_id',
                                                                                             flat=True))
        return render(request, 'upload_document_update.html', {
            'id': id,
            'header': header,
            'member_list': member_list,
        })


@login_required
def image(request):
    if request.method == 'POST':
        form = request.POST
        form1 = request.FILES
        image_name = form.get('image_name')
        image_file = form1.get('doc_file')
        try:
            user_id = request.session['id']
        except KeyError:
            user_id = None

        if image_name == '':
            messages.success(request, 'Image file is required')
            return redirect('/resource/image/')
        if image_file == '':
            messages.success(request, 'Upload image file')
            return redirect('/resource/image/')

        visible_for = form.get('visible_for')
        qs = UploadImage.objects.create(image_name=image_name,
                                        user_id=user_id,
                                        file=image_file,
                                        status=1,
                                        member_type=visible_for)
        membership_mapping(request, qs.pk, 'IMAGE')
        if qs:
            messages.success(request, 'Image Uploaded Successfully')
            return redirect('/resource/image/')
        else:
            messages.success(request, 'Image not Uploaded')
            return redirect('/resource/image/')
    else:
        return render(request, 'upload_image.html')


@login_required
def image_update(request, id):
    if request.method == 'POST':
        form = request.POST
        form1 = request.FILES
        image_name = form.get('image_name')
        image_file = form1.get('doc_file')
        try:
            user_id = request.session['id']
        except KeyError:
            user_id = None

        if image_name == '':
            messages.success(request, 'Image file is required')
            return redirect('/resource/image_update/' + str(id) + '/')
        if image_file == '':
            messages.success(request, 'Upload image file')
            return redirect('/resource/image_update/' + str(id) + '/')

        visible_for = form.get('visible_for')
        qs = UploadImage.objects.filter(pk=id).update(image_name=image_name,
                                                      user_id=user_id,
                                                      file=image_file,
                                                      member_type=visible_for)

        doc_file_path = form.get('doc_file_path')
        if doc_file_path and image_file:
            upload_file = image_file
        else:
            upload_file = doc_file_path

        qs_upd = UploadImage.objects.get(pk=id)
        qs_upd.file = upload_file
        qs_upd.save()
        membership_mapping(request, id, 'IMAGE')
        if qs:
            messages.success(request, 'Image Uploaded Successfully')
            return redirect('/resource/image_update/' + str(id) + '/')
        else:
            messages.success(request, 'Image not Uploaded')
            return redirect('/resource/image_update/' + str(id) + '/')
    else:
        header = UploadImage.objects.get(pk=id)
        member_list = list(
            UploadImageMembershipMapping.objects.filter(uimm_image_id=id).values_list('uimm_membership_id', flat=True))
        return render(request, 'upload_image_update.html', {'id': id, 'header': header, 'member_list': member_list})


@login_required
def video(request):
    if request.method == 'POST':
        form = request.POST
        form1 = request.FILES
        video_name = form.get('video_name')
        video_file = form1.get('doc_file')
        try:
            user_id = request.session['id']
        except KeyError:
            user_id = None

        if video_name == '':
            messages.success(request, 'Video file is required')
            return redirect('/resource/video/')

        if video_file == '':
            messages.success(request, 'Upload video file')
            return redirect('/resource/video/')

        visible_for = form.get('visible_for')

        qs = UploadVideo.objects.create(video_name=video_name,
                                        user_id=user_id,
                                        file=video_file,
                                        member_type=visible_for,
                                        status=1)
        membership_mapping(request, qs.pk, 'VIDEO')
        if qs:
            messages.success(request, 'Image Uploaded Successfully')
            return redirect('/resource/video/')
        else:
            messages.success(request, 'Image not Uploaded')
            return redirect('/resource/video/')
    else:
        return render(request, 'upload_video.html')


@login_required
def video_update(request, id):
    if request.method == 'POST':
        form = request.POST
        form1 = request.FILES
        video_name = form.get('video_name')
        video_file = form1.get('doc_file')
        try:
            user_id = request.session['id']
        except KeyError:
            user_id = None

        if video_name == '':
            messages.success(request, 'Video file is required')
            return redirect('/resource/video_update/' + str(id) + '/')

        if video_file == '':
            messages.success(request, 'Upload video file')
            return redirect('/resource/video_update/' + str(id) + '/')

        visible_for = form.get('visible_for')

        qs = UploadVideo.objects.filter(pk=id).update(video_name=video_name,
                                                      user_id=user_id,
                                                      file=video_file,
                                                      member_type=visible_for)

        doc_file_path = form.get('doc_file_path')
        if doc_file_path and video_file:
            upload_file = video_file
        else:
            upload_file = doc_file_path

        qs_upd = UploadVideo.objects.get(pk=id)
        qs_upd.file = upload_file
        qs_upd.save()
        membership_mapping(request, id, 'VIDEO')
        if qs:
            messages.success(request, 'Image Uploaded Successfully')
            return redirect('/resource/video_update/' + str(id) + '/')
        else:
            messages.success(request, 'Image not Uploaded')
            return redirect('/resource/video_update/' + str(id) + '/')
    else:

        header = UploadVideo.objects.get(pk=id)
        member_list = list(
            UploadVideoMembershipMapping.objects.filter(uvmm_video_id=id).values_list('uvmm_membership_id', flat=True))

        return render(request, 'upload_video_update.html', {'id': id, 'header': header, 'member_list': member_list})


def membership_mapping(request, pk_id, membership_flag):
    visible_for = request.POST.getlist('visible_for')
    model = []
    try:
        for x in visible_for:
            if membership_flag == 'DOC':
                model.append(UploadDocumentsMembershipMapping(udmm_document_id=pk_id, udmm_membership_id=x))
            elif membership_flag == 'VIDEO':
                model.append(UploadVideoMembershipMapping(uvmm_video_id=pk_id, uvmm_membership_id=x))
            elif membership_flag == 'IMAGE':
                model.append(UploadImageMembershipMapping(uimm_image_id=pk_id, uimm_membership_id=x))
        [x.save() for x in model]

        return True
    except Exception as e:
        print(e, '-------Exception------')
        return False


@login_required
def certification_document(request):
    if request.method == 'POST':
        form = request.POST
        form1 = request.FILES
        doc_name = form.get('doc_name')
        doc_file = form1.get('doc_file')
        user_id = form.get('user_id')

        if doc_name == '':
            messages.success(request, 'certificate name is required')
            return redirect('/resource/certification_document/')
        if doc_file == '':
            messages.success(request, 'Upload certificate file')
            return redirect('/resource/certification_document/')

        visible_for = form.getlist('visible_for')
        if visible_for == '':
            messages.success(request, 'Visible for is required')
            return redirect('/resource/certification_document/')
        qs = CertificationUploadDocuments.objects.create(doc_name=doc_name,
                                                         user_id=user_id,
                                                         file=doc_file,
                                                         status=1)
        user_mapping(request, qs.pk, 'DOC')
        if qs:
            messages.success(request, 'Document Uploaded Successfully')
            return redirect('/resource/certification_document/')
        else:
            messages.success(request, 'Document not Uploaded')
            return redirect('/resource/certification_document/')
    else:

        return render(request, 'certification_upload_document.html')


@login_required
def certification_document_update(request, id):
    if request.method == 'POST':
        form = request.POST
        form1 = request.FILES
        doc_name = form.get('doc_name')
        doc_file = form1.get('doc_file')
        try:
            user_id = request.session['id']
        except KeyError:
            user_id = None

        if doc_name == '':
            messages.success(request, 'certificate name is required')
            return redirect('/resource/certification_document_update/' + str(id) + '/')
        if doc_file == '':
            messages.success(request, 'Upload certificate file')
            return redirect('/resource/certification_document_update/' + str(id) + '/')

        visible_for = form.getlist('visible_for')
        if visible_for == '':
            messages.success(request, 'Visible for is required')
            return redirect('/resource/certification_document_update/' + str(id) + '/')
        qs = CertificationUploadDocuments.objects.filter(pk=id).update(doc_name=doc_name,
                                                                       user_id=user_id, file=doc_file, status=1)
        user_mapping(request, id, 'DOC')
        if qs:
            messages.success(request, 'Document Uploaded Successfully')
            return redirect('/resource/certification_document_update/' + str(id) + '/')
        else:
            messages.success(request, 'Document not Uploaded')
            return redirect('/resource/certification_document_update/' + str(id) + '/')
    else:
        return render(request, 'certification_upload_document.html', {'id', id})


def user_mapping(request, pk_id, membership_flag):
    visible_for = request.POST.getlist('visible_for')
    model = []
    try:
        for x in visible_for:
            if membership_flag == 'DOC':
                model.append(CertificationUploadDocumentsMapping(cerdoc_document_id=pk_id, cerdoc_user_id=x))
        [x.save() for x in model]
        return True
    except Exception as e:
        print(e, '-------Exception------')
        return False


@login_required
def document_list(request):
    return render(request, 'upload_document_list.html')


@login_required
def image_list(request):
    return render(request, 'upload_image_list.html')


@login_required
def video_list(request):
    return render(request, 'upload_video_list.html')


@login_required
def certification_document_list(request):
    return render(request, 'certification_upload_document_list.html')


@login_required
def get_document_list(request):
    start = request.GET.get('start')
    last = request.GET.get('length')
    search = request.GET.get('search')
    objects = Q()
    if search:
        search_str = search.split(' ')
        objects = (Q(doc_name__icontains=search_str[0]) |
                   Q(file__icontains=search_str[0]) |
                   Q(status__icontains=search_str[0]))
        for term in search_str[1:]:
            if term != '':
                objects.add((Q(doc_name__icontains=term) |
                             Q(file__icontains=term) |
                             Q(status__icontains=term)), Q.AND)

    query_set = Q()
    is_admin = request.user.admin_user
    if is_admin:
        query_set = Q(user_id=request.user.id)
    lst_stmt = UploadDocuments.objects.filter(objects, query_set).order_by('id')[int(start):(int(last) + int(start))]
    q = UploadDocuments.objects.filter(objects)
    lst_count = len(q)
    doc_list = []
    inc = int(start) + 1

    for i in lst_stmt:
        doc_list1 = []
        doc_list1.append(inc)
        doc_list1.append(i.doc_name if i.doc_name else '')
        doc_list1.append('<div class="avatar"><img src="/media/'+str(i.file)+'" alt="..." class="img-fluid" height="60" width="60"></div>')
        doc_list1.append(i.status if i.status else '')
        created_dt = ''
        if i.created_date:
            created_dt = get_date_format(i.created_date, '%Y-%m-%d')
        doc_list1.append(created_dt)

        doc_list1.append('<span onclick="delete_func(' + str(
            i.pk) + ')" class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-trash-o" aria-hidden="true"></i></span><a href="/resource/document_update/' + str(
            i.pk) + '" class="table-link text-info"><span class="fa-stack"><i class="fa fa-square '
                    'fa-stack-2x"></i><i class="fa fa-pencil fa-stack-1x fa-inverse"></i></span></a>')
        doc_list.append(doc_list1)
        inc += 1

    data = {'draw': request.GET.get('draw'), 'recordsTotal': lst_count, 'recordsFiltered': lst_count,
            'data': doc_list}
    return JsonResponse(data)


@login_required
def get_image_list(request):
    start = request.GET.get('start')
    last = request.GET.get('length')
    search = request.GET.get('search')
    objects = Q()
    if search:
        search_str = search.split(' ')
        objects = (Q(image_name__icontains=search_str[0]) |
                   Q(file__icontains=search_str[0]) |
                   Q(status__icontains=search_str[0]))
        for term in search_str[1:]:
            if term != '':
                objects.add((Q(image_name__icontains=term) |
                             Q(file__icontains=term) |
                             Q(status__icontains=term)), Q.AND)
    query_set = Q()
    is_admin = request.user.admin_user
    if is_admin:
        query_set = Q(user_id=request.user.id)

    lst_stmt = UploadImage.objects.filter(objects, query_set).order_by('id')[int(start):(int(last) + int(start))]
    q = UploadImage.objects.filter(objects)
    lst_count = len(q)
    doc_list = []
    inc = int(start) + 1

    for i in lst_stmt:
        doc_list1 = []
        doc_list1.append(inc)
        doc_list1.append(i.image_name if i.image_name else '')
        doc_list1.append('<div class="avatar"><img src="/media/'+str(i.file)+'" alt="..." class="img-fluid" height="60" width="60"></div>')
        doc_list1.append(i.status if i.status else '')
        created_dt = ''
        if i.created_date:
            created_dt = get_date_format(i.created_date, '%Y-%m-%d')
        doc_list1.append(created_dt)

        doc_list1.append('<span onclick="delete_func(' + str(
            i.pk) + ')" class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-trash-o" aria-hidden="true"></i></span><a href="/resource/image_update/' + str(
            i.pk) + '" class="table-link text-info"><span class="fa-stack"><i class="fa fa-square '
                    'fa-stack-2x"></i><i class="fa fa-pencil fa-stack-1x fa-inverse"></i></span></a>')
        doc_list.append(doc_list1)
        inc += 1

    data = {'draw': request.GET.get('draw'), 'recordsTotal': lst_count, 'recordsFiltered': lst_count,
            'data': doc_list}
    return JsonResponse(data)


@login_required
def get_video_list(request):
    start = request.GET.get('start')
    last = request.GET.get('length')
    search = request.GET.get('search')
    objects = Q()
    if search:
        search_str = search.split(' ')
        objects = (Q(video_name__icontains=search_str[0]) |
                   Q(file__icontains=search_str[0]) |
                   Q(status__icontains=search_str[0]))
        for term in search_str[1:]:
            if term != '':
                objects.add((Q(video_name__icontains=term) |
                             Q(file__icontains=term) |
                             Q(status__icontains=term)), Q.AND)

    query_set = Q()
    is_admin = request.user.admin_user
    if is_admin:
        query_set = Q(user_id=request.user.id)

    lst_stmt = UploadVideo.objects.filter(objects, query_set).order_by('id')[int(start):(int(last) + int(start))]
    q = UploadVideo.objects.filter(objects)
    lst_count = len(q)
    doc_list = []
    inc = int(start) + 1

    for i in lst_stmt:
        doc_list1 = []
        doc_list1.append(inc)
        doc_list1.append(i.video_name if i.video_name else '')
        doc_list1.append('<div class="avatar"><img src="/media/'+str(i.file)+'" alt="..." class="img-fluid" height="60" width="60"></div>')
        doc_list1.append(i.status if i.status else '')
        created_dt = ''
        if i.created_date:
            created_dt = get_date_format(i.created_date, '%Y-%m-%d')
        doc_list1.append(created_dt)

        doc_list1.append('<span onclick="delete_func(' + str(
            i.pk) + ')" class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-trash-o" aria-hidden="true"></i></span><a href="/resource/video_update/' + str(
            i.pk) + '" class="table-link text-info"><span class="fa-stack"><i class="fa fa-square '
                    'fa-stack-2x"></i><i class="fa fa-pencil fa-stack-1x fa-inverse"></i></span></a>')
        doc_list.append(doc_list1)
        inc += 1

    data = {'draw': request.GET.get('draw'), 'recordsTotal': lst_count, 'recordsFiltered': lst_count,
            'data': doc_list}
    return JsonResponse(data)


@login_required
def get_certificate_list(request):
    start = request.GET.get('start')
    last = request.GET.get('length')
    search = request.GET.get('search')
    objects = Q()
    if search:
        search_str = search.split(' ')
        objects = (Q(doc_name__icontains=search_str[0]) |
                   Q(file__icontains=search_str[0]) |
                   Q(status__icontains=search_str[0]))
        for term in search_str[1:]:
            if term != '':
                objects.add((Q(doc_name__icontains=term) |
                             Q(file__icontains=term) |
                             Q(status__icontains=term)), Q.AND)

    query_set = Q()
    is_admin = request.user.admin_user
    if is_admin:
        query_set = Q(user_id=request.user.id)

    lst_stmt = CertificationUploadDocuments.objects.filter(objects, query_set).order_by('id')[
               int(start):(int(last) + int(start))]
    q = CertificationUploadDocuments.objects.filter(objects)
    lst_count = len(q)
    doc_list = []
    inc = int(start) + 1

    for i in lst_stmt:
        doc_list1 = []
        doc_list1.append(inc)
        doc_list1.append(i.doc_name if i.doc_name else '')
        doc_list1.append(str(i.file) if i.file else '')
        doc_list1.append(i.status if i.status else '')
        created_dt = ''
        if i.created_date:
            created_dt = get_date_format(i.created_date, '%Y-%m-%d')
        doc_list1.append(created_dt)

        doc_list1.append('<span data-attr-value="suspend" onclick="delete_func(' + str(
            i.pk) + ')" class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-trash-o" aria-hidden="true"></i></span><a href="/resource/certification_document_update/' + str(
            i.pk) + '/" class="table-link text-info"><span class="fa-stack"><i class="fa fa-square '
                    'fa-stack-2x"></i><i class="fa fa-pencil fa-stack-1x fa-inverse"></i></span></a>')
        doc_list.append(doc_list1)
        inc += 1

    data = {'draw': request.GET.get('draw'), 'recordsTotal': lst_count, 'recordsFiltered': lst_count,
            'data': doc_list}
    return JsonResponse(data)


def data_delete(request):
    id = request.GET.get('id')
    flag = request.GET.get('flag')
    if flag == 'D':
        UploadDocuments.objects.filter(pk=id).delete()
    elif flag == 'I':
        UploadImage.objects.filter(pk=id).delete()
    elif flag == 'V':
        UploadVideo.objects.filter(pk=id).delete()
    elif flag == 'C':
        CertificationUploadDocuments.objects.filter(pk=id).delete()
    return JsonResponse({'message': 'Deleted successfully.'})


def show_resources(request):
    user_type = 0
    if 'user_type' in request.session:
        user_type = request.session['user_type']
    if user_type == 2:
        member_type = 1
    elif user_type == 3:
        member_type = 2
    elif user_type == 3:
        member_type = 4
    else:
        member_type = 0

    get_doc = UploadDocuments.objects.filter(member_type=str(member_type))
    if not get_doc:
        get_doc = UploadDocuments.objects.filter(member_type=str(0))

    get_video = UploadVideo.objects.filter(member_type=str(member_type))
    if not get_video:
        get_video = UploadVideo.objects.filter(member_type=str(0))

    get_image = UploadImage.objects.filter(member_type=str(member_type))
    if not get_image:
        get_image = UploadImage.objects.filter(member_type=str(0))

    return render(request, 'show_resources.html', {'get_doc': get_doc, 'get_video': get_video, 'get_image': get_image})


def show_certificate(request):
    user_id = request.session['id']
    get_certificate = UserCertificate.objects.filter(user_id=user_id)

    return render(request, 'show_certificate.html', {'certificate': get_certificate })


def get_users(request):
    form = request.GET
    user_type = form.get('user_type')
    search_text = form.get('search_text')
    charge_to_list = search_text.split(' ')

    q = Q(user_type=user_type) & Q(is_suspend=0) & Q(is_delete=0)

    q = q & (Q(first_name__icontains=charge_to_list[0]) | Q(middle_name__icontains=charge_to_list[0]) | Q(
        last_name__icontains=charge_to_list[0]) | Q(email__icontains=charge_to_list[0]))
    for term in charge_to_list[1:]:
        if term != '':
            q.add((Q(first_name__icontains=term) | Q(middle_name__icontains=term) | Q(last_name__icontains=term) | Q(
                email__icontains=term)), Q.AND)

    qs = CustomUser.objects.filter(q)[:50]
    data = []
    for qs in qs:
        loc_dict = {'id': qs.id, 'label': str(qs.first_name) + '-' + str(qs.email)}
        data.append(loc_dict)
    return JsonResponse({'data': data})