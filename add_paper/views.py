from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Q, F
from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from datetime import datetime
from .models import PaperList, VerifiedPaper


# Create your views here.

@login_required
def add_paper(request):
    user_id = request.user.id
    if request.method == 'POST':
        form = request.POST
        form1 = request.FILES
        paper_title = form.get('paper_title')
        paper_desc = form.get('paper_desc')
        paper_file = form1.get('paper_file')

        qs = PaperList.objects.create(paper_title=paper_title, paper_desc=paper_desc, paper_file=paper_file,
                                      paper_user_id=user_id)
        if qs:
            msg = 'Paper saved successfully'
            messages.success(request, msg)
            return HttpResponseRedirect('/add_paper/view_paper/')
    else:
        return render(request, 'add_paper.html')


@login_required
def edit_paper(request, id):
    user_id = request.user.id
    if request.method == 'POST':
        form = request.POST
        form1 = request.FILES
        paper_title = form.get('paper_title')
        paper_desc = form.get('paper_desc')
        paper_file = form1.get('paper_file')

        qs = PaperList.objects.filter(pk=id).update(paper_title=paper_title, paper_desc=paper_desc,
                                      paper_user_id=user_id, paper_upd_dt=datetime.now())
        if qs:
            if paper_file:
                p = PaperList.objects.get(pk=id)
                p.paper_file = paper_file
                p.save()
            msg = 'Paper updated successfully'
            messages.success(request, msg)
            return HttpResponseRedirect('/add_paper/view_paper/')
    else:
        data = {}
        try:
            data = PaperList.objects.get(pk=id)
        except Exception as e:
            print(e)

        return render(request, 'edit_paper.html', {'data': data, 'id': id})


@login_required
def submit_paper(request, id):
    user_id = request.user.id
    qs = PaperList.objects.filter(pk=id).update(paper_submit_tf=True, paper_upd_dt=datetime.now())
    if qs:
        msg = 'Paper submitted successfully'
        messages.success(request, msg)
        return HttpResponseRedirect('/add_paper/view_paper/')


@login_required
def delete_paper(request, id):
    user_id = request.user.id
    qs = PaperList.objects.filter(pk=id, paper_submit_tf=False).delete()
    if qs:
        msg = 'Paper deleted successfully'
        messages.success(request, msg)
        return HttpResponseRedirect('/add_paper/view_paper/')


@login_required
def view_paper(request):
    user_id = request.user.id
    qs1 = PaperList.objects.filter(paper_submit_tf=True).order_by('-paper_marks', 'paper_upd_dt')
    rank = 1
    for qs1 in qs1:
        PaperList.objects.filter(pk=qs1.paper_id).update(paper_rank=rank)
        rank += 1

    if request.user.is_superuser:
        qs = PaperList.objects.all().order_by('-paper_marks')
    else:
        qs = PaperList.objects.filter(paper_user_id=user_id).order_by('-pk')

    return render(request, 'view_paper.html', {'data': qs})


@login_required
def verify_paper(request):
    user_id = request.user.id
    if request.method == 'POST':
        form = request.POST
        selected_paper = form.get('selected_paper')
        paper_id = form.getlist('paper_id[]')

        qs = PaperList.objects.filter(pk=selected_paper).update(paper_marks=F('paper_marks')+1)
        if qs:
            if len(paper_id) >=2:
                qs1 = VerifiedPaper.objects.create(vp_user_id=user_id, vp_paper1_id=paper_id[0],
                                                   vp_paper2_id=paper_id[1], vp_selected_paper_id=selected_paper)
            else:
                qs1 = VerifiedPaper.objects.create(vp_user_id=user_id, vp_paper1_id=paper_id[0],
                                                    vp_selected_paper_id=selected_paper)
            if qs1:
                messages.success(request, 'Previous paper verified successfully')
            else:
                messages.success(request, 'Could not verified')

    qs = PaperList.objects.filter(~Q(paper_user_id=user_id) & Q(paper_submit_tf=True)).order_by('pk')
    is_success = 0
    is_data = 1
    data = []
    if len(qs) > 1:
        for x in range(len(qs)):
            for y in range(len(qs)):
                if x == y:
                    is_data = 0
                else:
                    paper1 = qs[x].paper_id
                    paper2 = qs[y].paper_id
                    qs_exists = VerifiedPaper.objects.filter(((Q(vp_paper1_id=paper1) & Q(vp_paper2_id=paper2)) |
                                                              (Q(vp_paper1_id=paper2) & Q(vp_paper2_id=paper1))) &
                                                             Q(vp_user_id=user_id)).exists()
                    if not qs_exists:
                        data = [{
                            'paper_id': qs[x].paper_id,
                            'paper_title': qs[x].paper_title,
                            'paper_desc': qs[x].paper_desc,
                            'paper_file': qs[x].paper_file
                        },
                        {
                            'paper_id': qs[y].paper_id,
                            'paper_title': qs[y].paper_title,
                            'paper_desc': qs[y].paper_desc,
                            'paper_file': qs[y].paper_file
                        }]
                        is_success = 1
                        is_data = 1
                        break
            if is_success == 1:
                break
    else:
        is_data = 0

    return render(request, 'verify_paper.html', {'data': data, 'is_data': is_data})

