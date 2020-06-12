from google.ads.google_ads.client import GoogleAdsClient


def get_client():
    client = GoogleAdsClient.load_from_storage('adwords/google-ads.yaml')
    return client