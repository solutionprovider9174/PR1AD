from django.urls import path
from . import views

urlpatterns = [
    path('get_token/', views.test_token_view, name="test_token"),
    path('campaign/create/', views.test_campaign, name="test_campaign"),
]
