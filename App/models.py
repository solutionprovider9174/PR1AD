from django.db import models
import datetime
from colorfield.fields import ColorField
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.signals import user_logged_in, user_logged_out, user_login_failed
from django.dispatch import receiver

UserLevel_CHOICES = (
    (0, ("Level1(Manually)")),
    (1, ("Level2(Automatically)"))
)

UserEmailChangePermission_CHOICES = (
    (0, ("No")),
    (1, ("Yes"))
)
class CustomUser(AbstractUser):
    ip_address = models.CharField(max_length=255, blank=True, verbose_name='Registration IP')
    address = models.CharField(max_length=255, blank=True, verbose_name='Address')
    phone = models.CharField(max_length=255, blank=True, verbose_name='Phone')
    city = models.CharField(max_length=255, blank=True, verbose_name='City')
    country = models.CharField(max_length=255, blank=True, verbose_name='Country Name')
    login_count = models.PositiveIntegerField(default=0)
    user_level = models.IntegerField(choices=UserLevel_CHOICES, default=0)
    user_email_change_permission = models.IntegerField(choices=UserEmailChangePermission_CHOICES, default=0)
    from django.contrib.auth.signals import user_logged_in
    def login_user(sender, request, user, **kwargs):
        user_info = CustomUser.objects.filter(username=user)
        user_info.update(login_count=CustomUser.objects.get(username=user).login_count + 1)
    user_logged_in.connect(login_user)

RELEVANCE_CHOICES = (
    (0, ("No")),
    (1, ("Yes"))
)
class HomepageSetting(models.Model):
    background_color = ColorField(default='#FF0000')
    Font_color = ColorField(default='#FF0000')
    homeslider_text1 = models.CharField(max_length=500, null=True, blank=True)
    homeslider_text2 = models.CharField(max_length=500, null=True, blank=True)
    homeslider_text3 = models.CharField(max_length=500, null=True, blank=True)
    homeslider1 = models.URLField(max_length=128,
                                    db_index=True,
                                    blank=True)
    homeslider2 = models.URLField(max_length=128,
                                  db_index=True,
                                  blank=True)
    homeslider3 = models.URLField(max_length=128,
                                  db_index=True,
                                  blank=True)
    homeimage1 = models.ImageField(upload_to='logo/')
    homeimage2 = models.ImageField(upload_to='logo/')
    homeimage3 = models.ImageField(upload_to='logo/')
    validFrom = models.DateTimeField(default=datetime.datetime.now)
    validTo = models.DateTimeField(default=datetime.datetime.now)
    Is_active = models.IntegerField(choices=RELEVANCE_CHOICES, default=1)

class AuditEntry(models.Model):
    action = models.CharField(max_length=64)
    ip = models.GenericIPAddressField(null=True)
    username = models.CharField(max_length=256, null=True)
    date_time = models.DateTimeField(default=datetime.datetime.now)
    def __unicode__(self):
        return '{0} - {1} - {2}'.format(self.action, self.username, self.ip)

    def __str__(self):
        return '{0} - {1} - {2}'.format(self.action, self.username, self.ip)


@receiver(user_logged_in)
def user_logged_in_callback(sender, request, user, **kwargs):
    ip = request.META.get('REMOTE_ADDR')
    AuditEntry.objects.create(action='user_logged_in', ip=ip, username=user.username)


@receiver(user_logged_out)
def user_logged_out_callback(sender, request, user, **kwargs):
    ip = request.META.get('REMOTE_ADDR')
    AuditEntry.objects.create(action='user_logged_out', ip=ip, username=user.username)


@receiver(user_login_failed)
def user_login_failed_callback(sender, credentials, **kwargs):
    AuditEntry.objects.create(action='user_login_failed', username=credentials.get('username', None))