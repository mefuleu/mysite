# Generated by Django 3.1.1 on 2020-11-05 08:09

import ckeditor_uploader.fields
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ProductTypeFirst',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('typename', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='ProductTypeSecond',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('second_typename', models.CharField(max_length=100)),
                ('typename_first', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='product.producttypefirst', verbose_name='typename_first')),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=255, unique=True)),
                ('product_specifications', models.CharField(blank=True, max_length=400)),
                ('usage_area', models.CharField(blank=True, max_length=400)),
                ('applicable_scene', models.CharField(blank=True, max_length=400)),
                ('use_age', models.CharField(blank=True, max_length=400)),
                ('ordering_hotline', models.CharField(blank=True, max_length=400)),
                ('create', models.DateTimeField(default=django.utils.timezone.now)),
                ('content', ckeditor_uploader.fields.RichTextUploadingField()),
                ('typename_second', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='product.producttypesecond', verbose_name='typename_second')),
            ],
            options={
                'ordering': ['-create'],
            },
        ),
    ]
