from django import forms
from django.contrib.auth.forms import AuthenticationForm
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.forms import UserCreationForm
from App.models import CustomUser as User
from crispy_forms.helper import FormHelper

class BootstrapAuthenticationForm(AuthenticationForm):
    """Authentication form which uses boostrap CSS."""
    username = forms.CharField(max_length=254,
                               widget=forms.TextInput({
                                   'class': 'form-control',
                                   'placeholder': 'User name'}))
    password = forms.CharField(label=_("Password"),
                               widget=forms.PasswordInput({
                                   'class': 'form-control',
                                   'placeholder':'Password'}))

class UserRegistrationForm(UserCreationForm):
    email = forms.EmailField()

    class Meta:
        model = User
        fields = ['username','first_name','last_name','address', 'phone','country','city', 'email', 'password1', 'password2']


class UserUpdateForm(forms.ModelForm):

    class Meta:
        model = User
        fields = ['username','first_name','last_name','address', 'phone','country','city', 'email']


# class ProfileUpdateForm(forms.ModelForm):
#
#     class Meta:
#         model = Profile
#         fields = ['image', 'firstname', 'lastname', 'birthyear', 'country']
#
#     def __init__(self, *args, **kwargs):
#
#         user = kwargs.pop('user', None)
#         if user is not None:
#
#             super(ProfileUpdateForm, self).__init__(*args, **kwargs)
#             self.helper = FormHelper()
#             self.helper.form_tag = False
#             self.helper.disable_csrf = True
#
#             self.fields['country'].initial = User.objects.get(username__exact=user).country
#             self.fields['country'].widget.attrs['class'] = 'country_select_option'
#         else:
#             super(ProfileUpdateForm, self).__init__(*args, **kwargs)
#             self.helper = FormHelper()
#             self.helper.form_tag = False
#             self.helper.disable_csrf = True
#             self.fields['country'].widget.attrs['class'] = 'country_select_option'
















