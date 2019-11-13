import tweepy
import logging

logger = logging.getLogger()

def create_api():
    '''
    :return: creates a Tweepy API object
    '''
    # Authenticate to Twitter

    auth = tweepy.OAuthHandler("rovyYRegGkaZCYgeyHMYHqa2I", "seXLUDEuCLMTiYnC69r5fp6sotR0nUG6eoLxTfoLD4BL83mx4r")
    auth.set_access_token("11353622-D5KrAj5Xp9cSWVwAUURVGTYColc7Fi07U86ZN40em",
        "FE9VjT8u9cdlzxyR2DXyz1nYoVM3nL6EQWxma7lBrotrl")
    api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True, parser=tweepy.parsers.JSONParser())

    try:
        api.verify_credentials()
    except:
        logger.error("Error creating API", exc_info=True)
        raise e
    logger.info("API created")
    return api