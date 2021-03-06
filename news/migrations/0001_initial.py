# Generated by Django 3.1.1 on 2020-12-18 05:54

import ckeditor_uploader.fields
from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='New',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=255)),
                ('create', models.DateTimeField(default=django.utils.timezone.now)),
                ('content', ckeditor_uploader.fields.RichTextUploadingField()),
            ],
            options={
                'ordering': ['create'],
            },
        ),
    ]
