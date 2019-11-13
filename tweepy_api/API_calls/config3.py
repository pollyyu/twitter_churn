import tweepy
import logging

logger = logging.getLogger()

def create_api():
    '''
    :return: creates a Tweepy API object
    '''
    # Authenticate to Twitter

    auth = tweepy.OAuthHandler("HeEksG1y0qmxlpDOch8fiQODT", "ymfXeoOEZ99s3stknqgCiKTEBbIpQKPnq9SPTCJicJNlIM32hz")
    auth.set_access_token("702642813150711808-p29x1h7WpJaqX4eOmWhBGvz99RIitQB",
        "Rq0SF3oDrKNK7ENK8smrN1SWKwpGTwuigpG0plHG1HxiG")
    api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True, parser=tweepy.parsers.JSONParser())

    try:
        api.verify_credentials()
    except:
        logger.error("Error creating API", exc_info=True)
        raise e
    logger.info("API created")
    return api
