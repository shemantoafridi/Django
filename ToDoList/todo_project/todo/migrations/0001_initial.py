from django.db import migrations, models

class Migration(migrations.Migration):

    initial = True

    dependencies = [
        # If there are other apps that this migration depends on, list them here.
    ]

    operations = [
        migrations.CreateModel(
            name='Todo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=300)),
                ('description', models.TextField()),
                ('completed', models.BooleanField(default=False)),
            ],
        ),
    ]
