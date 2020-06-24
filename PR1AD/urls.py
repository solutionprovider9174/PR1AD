"""PR1AD URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from datetime import datetime
from django.conf.urls import url, include
from django.urls import path
from django.contrib import admin
from App import views, form
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LoginView, LogoutView


urlpatterns = [
    path('', views.home, name='home'),
    path('ads/', include('adwords.urls')),
    path('about/', views.about, name='about'),
    path('contact/', views.contact, name='contact'),
    path('profile/', views.profile, name='profile'),
    path('register/', views.register, name='register'),
    path('admin/', admin.site.urls),
    url(r'^iprestrict/', include('iprestrict.urls', namespace='iprestrict')),
    path('login/',
         LoginView.as_view
             (
             template_name='app/login.html',
             authentication_form=form.BootstrapAuthenticationForm,
             extra_context=
             {
                 'title': 'Login',
                 'year': datetime.now().year,
             }
         ),
         name='login'),
    path('logout/', LogoutView.as_view(
        template_name='app/logout.html',
        extra_context=
        {
            'title': 'Logout',
            'message': 'You have been logged out. See you soon again.',
            'year': datetime.now().year,
        }
    ),
         name='logout'),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)