from django.shortcuts import render, HttpResponse
import argparse
from .get_client import get_client
from google_auth_oauthlib.flow import InstalledAppFlow
import argparse
import datetime
import sys
import uuid
import google.ads.google_ads.client


_DATE_FORMAT = '%Y%m%d'
SCOPE = u'https://www.googleapis.com/auth/adwords'


def test_token_view(request):
    flow = InstalledAppFlow.from_client_secrets_file(
        'adwords/creds.json', scopes=[SCOPE])

    flow.run_local_server()

    print('Access token: %s' % flow.credentials.token)
    print('Refresh token: %s' % flow.credentials.refresh_token)
    return HttpResponse("Got the refresh token")


def test_campaign(request):
    client = get_client()
    print(client)

    customer_id = "1164085964"
    campaign_budget_service = client.get_service('CampaignBudgetService',
                                                 version='v3')
    campaign_service = client.get_service('CampaignService', version='v3')

    # Create a budget, which can be shared by multiple campaigns.
    campaign_budget_operation = client.get_type('CampaignBudgetOperation',
                                                version='v3')
    campaign_budget = campaign_budget_operation.create
    campaign_budget.name.value = 'Interplanetary Budget %s' % uuid.uuid4()
    campaign_budget.delivery_method = client.get_type(
        'BudgetDeliveryMethodEnum').STANDARD
    campaign_budget.amount_micros.value = 500000

    # Add budget.
    try:
        campaign_budget_response = (
            campaign_budget_service.mutate_campaign_budgets(
                customer_id, [campaign_budget_operation]))
    except google.ads.google_ads.errors.GoogleAdsException as ex:
        print('Request with ID "%s" failed with status "%s" and includes the '
              'following errors:' % (ex.request_id, ex.error.code().name))
        for error in ex.failure.errors:
            print('\tError with message "%s".' % error.message)
            if error.location:
                for field_path_element in error.location.field_path_elements:
                    print('\t\tOn field: %s' % field_path_element.field_name)
        sys.exit(1)

    # Create campaign.
    campaign_operation = client.get_type('CampaignOperation', version='v3')
    campaign = campaign_operation.create
    campaign.name.value = 'Interplanetary Cruise %s' % uuid.uuid4()
    campaign.advertising_channel_type = client.get_type(
        'AdvertisingChannelTypeEnum').SEARCH

    # Recommendation: Set the campaign to PAUSED when creating it to prevent
    # the ads from immediately serving. Set to ENABLED once you've added
    # targeting and the ads are ready to serve.
    campaign.status = client.get_type(
        'CampaignStatusEnum', version='v3').PAUSED

    # Set the bidding strategy and budget.
    campaign.manual_cpc.enhanced_cpc_enabled.value = True
    campaign.campaign_budget.value = (
        campaign_budget_response.results[0].resource_name)

    # Set the campaign network options.
    campaign.network_settings.target_google_search.value = True
    campaign.network_settings.target_search_network.value = True
    campaign.network_settings.target_content_network.value = False
    campaign.network_settings.target_partner_search_network.value = False

    # Optional: Set the start date.
    start_time = datetime.date.today() + datetime.timedelta(days=1)
    campaign.start_date.value = datetime.date.strftime(start_time,
                                                       _DATE_FORMAT)

    # Optional: Set the end date.
    end_time = start_time + datetime.timedelta(weeks=4)
    campaign.end_date.value = datetime.date.strftime(end_time, _DATE_FORMAT)

    # Add the campaign.
    try:
        campaign_response = campaign_service.mutate_campaigns(
            customer_id, [campaign_operation])
    except google.ads.google_ads.errors.GoogleAdsException as ex:
        print('Request with ID "%s" failed with status "%s" and includes the '
              'following errors:' % (ex.request_id, ex.error.code().name))
        for error in ex.failure.errors:
            print('\tError with message "%s".' % error.message)
            if error.location:
                for field_path_element in error.location.field_path_elements:
                    print('\t\tOn field: %s' % field_path_element.field_name)

    print('Created campaign %s.' % campaign_response.results[0].resource_name)

    return HttpResponse("WOrking")
