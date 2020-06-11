from django.db import models
import datetime
from colorfield.fields import ColorField
from django.contrib.auth.models import AbstractUser
import ipcalc
from django.utils.translation import ugettext_lazy as _
from django.core.cache import cache
from django.db.models.signals import post_save, post_delete


class CustomUser(AbstractUser):
    LEVEL_CHOICES = (
        ('1', "Level 1"),
        ('2', "Level 2"),
    )
    user_level = models.CharField(
        max_length=1, choices=LEVEL_CHOICES, default="1")
    ip_address = models.CharField(
        max_length=255, blank=True, verbose_name='Registration IP')
    address = models.CharField(
        max_length=255, blank=True, verbose_name='Address')
    phone = models.CharField(max_length=255, blank=True, verbose_name='Phone')
    city = models.CharField(max_length=255, blank=True, verbose_name='City')
    country = models.CharField(
        max_length=255, blank=True, verbose_name='Country Name')
    login_count = models.PositiveIntegerField(default=0)
    from django.contrib.auth.signals import user_logged_in

    def login_user(sender, request, user, **kwargs):
        user_info = CustomUser.objects.filter(username=user)
        user_info.update(login_count=CustomUser.objects.get(
            username=user).login_count + 1)
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
                                  # unique=True,
                                  blank=True)
    homeslider2 = models.URLField(max_length=128,
                                  db_index=True,
                                  # unique=True,
                                  blank=True)
    homeslider3 = models.URLField(max_length=128,
                                  db_index=True,
                                  # unique=True,
                                  blank=True)
    homeimage1 = models.ImageField(upload_to='logo/')
    homeimage2 = models.ImageField(upload_to='logo/')
    homeimage3 = models.ImageField(upload_to='logo/')
    validFrom = models.DateTimeField(default=datetime.datetime.now)
    validTo = models.DateTimeField(default=datetime.datetime.now)
    Is_active = models.IntegerField(choices=RELEVANCE_CHOICES, default=1)


class BlockIP(models.Model):
    network = models.CharField(_('IP address or mask'), max_length=18)
    reason_for_block = models.TextField(
        blank=True, null=True, help_text=_("Optional reason for block"))

    def __str__(self):
        return 'BlockIP: %s' % self.network

    def get_network(self):
        return ipcalc.Network(self.network)

    class Meta:
        verbose_name = _('IPs & masks to ban')
        verbose_name_plural = _('IPs & masks to ban')


def _clear_cache(sender, instance, **kwargs):
    cache.set('blockip:list', BlockIP.objects.all())


post_save.connect(_clear_cache, sender=BlockIP)
post_delete.connect(_clear_cache, sender=BlockIP)
