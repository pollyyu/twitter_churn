import tweepy
import logging

logger = logging.getLogger()

def create_api():
    '''
    :return: creates a Tweepy API object
    '''
    # Authenticate to Twitter

    auth = tweepy.OAuthHandler("CONSUMER_KEY", "CONSUMER_SECRET")
    auth.set_access_token("ACCESS_TOKEN","ACCESS_TOKEN_SECRET")
    api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True, parser=tweepy.parsers.JSONParser())

    return api

    try:
        api.verify_credentials()
    except:
        logger.error("Error creating API", exc_info=True)
        raise e
    logger.info("API created")
    return api
