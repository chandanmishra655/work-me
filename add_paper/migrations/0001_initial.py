# Generated by Django 2.2.2 on 2021-10-28 19:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='PaperList',
            fields=[
                ('paper_id', models.AutoField(primary_key=True, serialize=False)),
                ('paper_title', models.TextField(null=True)),
                ('paper_desc', models.TextField(null=True)),
                ('paper_file', models.FileField(blank=True, null=True, upload_to='paper')),
                ('paper_cr_dt', models.DateTimeField(auto_now=True, null=True)),
                ('paper_upd_dt', models.DateTimeField(null=True)),
                ('paper_marks', models.IntegerField(default=0)),
                ('paper_rank', models.IntegerField(default=0)),
                ('paper_submit_tf', models.BooleanField(default=False, null=True)),
            ],
            options={
                'db_table': 'paper_list',
            },
        ),
        migrations.CreateModel(
            name='VerifiedPaper',
            fields=[
                ('vp_id', models.AutoField(primary_key=True, serialize=False)),
                ('vp_cr_dt', models.DateTimeField(auto_now=True)),
                ('vp_upd_dt', models.DateTimeField(null=True)),
                ('vp_paper1', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='vp_paper1', to='add_paper.PaperList')),
                ('vp_paper2', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='vp_paper2', to='add_paper.PaperList')),
                ('vp_selected_paper', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='vp_selected_paper', to='add_paper.PaperList')),
            ],
            options={
                'db_table': 'verified_paper',
            },
        ),
    ]
