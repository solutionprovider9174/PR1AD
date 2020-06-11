from django.shortcuts import render
from datetime import datetime
from django.shortcuts import render, redirect
from django.http import HttpRequest, HttpResponse, JsonResponse
from .models import HomepageSetting
from .form import UserRegistrationForm, UserUpdateForm
from django.contrib import messages
from django.contrib.gis.geoip2 import GeoIP2
# Create your views here.
def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip

def home(request):
    """Renders  the home page."""
    assert isinstance(request, HttpRequest)

    # homesetting_obj = HomepageSetting.objects.get(Is_active=1, validFrom__lte=datetime.now(),
    #                                                   validTo__gte=datetime.now())
    homesetting_obj = HomepageSetting.objects.get(Is_active=1)
    background_color = homesetting_obj.background_color
    font_color = homesetting_obj.Font_color
    home_text1 = homesetting_obj.homeslider_text1
    home_text2 = homesetting_obj.homeslider_text2
    home_text3 = homesetting_obj.homeslider_text3
    home_url1 = homesetting_obj.homeslider1
    home_url2 = homesetting_obj.homeslider2
    home_url3 = homesetting_obj.homeslider3
    homeimage_link1 = homesetting_obj.homeimage1
    homeimage_link2 = homesetting_obj.homeimage2
    homeimage_link3 = homesetting_obj.homeimage3
    validFrom = homesetting_obj.validFrom
    validTo = homesetting_obj.validTo
    is_active = homesetting_obj.Is_active
    print(background_color, font_color)
    return render(
        request,
        'app/index.html',
        {
            'title': 'Home Page',
            'year': datetime.now().year,
            'background_color':background_color,
            'font_color':font_color,
            'home_text1':home_text1,
            'home_text2':home_text2,
            'home_text3':home_text3,
            'home_url1':home_url1,
            'home_url2':home_url2,
            'home_url3':home_url3,
            'homeimage_link1':homeimage_link1,
            'homeimage_link2':homeimage_link2,
            'homeimage_link3':homeimage_link3,
            'validFrom':validFrom,
            'validTo':validTo,
        }
    )

def register(request):
    """Renders the registration page."""
    assert isinstance(request, HttpRequest)
    ip = get_client_ip(request)
    g = GeoIP2()
    try:
        info = g.city(ip)
        country_code = info.country_code
    except:
        country_code = 'unknown'

    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Your new account has been created, username : {username}')

            return redirect('login')
    else:
            form = UserRegistrationForm()

    return render(
        request,
        'app/register.html',
        {
            'title': 'Registration',
            'message': 'Fill in the User Registration form',
            'year': datetime.now().year,
            'form': form
        }
    )

def profile(request):
    """Renders the profile page."""
    assert isinstance(request, HttpRequest)
    user = request.user

    try:
        profile = user.profile
    except Exception as e:
        print(e)
        profile = None
    year = datetime.now().year
    subscription = 'Free'

    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=user, user=user)
        if u_form.is_valid():
            u_form.save()

    else:
        u_form = UserUpdateForm(instance=user, user=user)



    return render(
        request,
        'app/profile.html',
        {
            'title': 'Profile Page',
            'message': 'Please find your profile information below:',
            'year': year,
            'u_form': u_form,
            'subscription': subscription
        }
    )

def about(request):
    """Renders the about page."""
    assert isinstance(request, HttpRequest)
    return render(
        request,
        'app/about.html',
        {
            'title': 'About',
            'message': "The Companys's About page",
            'year': datetime.now().year,
        }
    )

def contact(request):
    """Renders the contact page."""
    assert isinstance(request, HttpRequest)
    return render(
        request,
        'app/contact.html',
        {
            'title': 'Contact',
            'message': 'Our contact page.',
            'year': datetime.now().year,
        }
    )


