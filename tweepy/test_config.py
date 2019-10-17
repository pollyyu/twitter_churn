import tweepy

# Authenticate to Twitter
auth = tweepy.OAuthHandler("5SDCerBHlWzSBAzvBXonhZ6Xe", "8zeJxu7srcQN6uhQAvcsWXHM8q8pVdzys6g6kfyeQhyVLcdcIR")
auth.set_access_token("2263992234-pp4lcAeHd7sYOOrlbjKfCPea7BC4vBr1xZoifce",
    "RRcgaj400e2ubOFuiy8YwrvTBsjxs19YVhQB1tFYcN5lA")

api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True, parser=tweepy.parsers.JSONParser())


try:
    api.verify_credentials()
    print("Authentication OK")
except:
    print("Error during authentication")