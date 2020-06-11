from django.contrib.admin.models import LogEntry
from django.contrib import admin
from .models import HomepageSetting, CustomUser, BlockIP


admin.site.register(BlockIP)


class HomepageSettingAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'background_color', 'Font_color', 'homeslider_text1', 'homeslider_text2', 'homeslider_text3',
        'homeslider1', 'homeslider2', 'homeslider3', 'homeimage1', 'homeimage2', 'homeimage3',
        'validFrom', 'validTo')


class CustomUserModelAdmin(admin.ModelAdmin):
    list_display = ['id', 'username', 'user_level', 'is_active', 'ip_address',
                    'country', 'city', 'address', 'phone', 'login_count', 'last_login']
    fieldsets = (
        (None, {'fields': ('username', 'password', 'user_level')}),
        (('Permission'), {
            'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions'),
        }),
        (('Personnel Info'), {
            'fields': ('country', 'city', 'phone', 'address'),
        }),
        (('Date'), {'fields': ('last_login', 'date_joined')}),
    )


class LogEntryModelAdmin(admin.ModelAdmin):
    list_filter = ('action_time',)
    list_display = ('get_username', 'action_time', 'object_repr',
                    'action_flag', 'change_message', 'content_type_name')
    search_fields = ['object_repr', 'change_message']

    def object_repr(self, obj):
        return obj.object_repr
    object_repr.short_description = 'Object'

    def content_type_name(self, obj):
        return obj.content_type

    def get_username(self, obj):
        return obj.user.username
    get_username.short_description = 'User_ID'

    class Meta:
        verbose_name_plural = "History"


admin.site.register(CustomUser, CustomUserModelAdmin)
admin.site.register(LogEntry, LogEntryModelAdmin)
admin.site.register(HomepageSetting, HomepageSettingAdmin)
