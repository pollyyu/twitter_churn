from collections import defaultdict
import numpy as np

def get_tweets(user_id, timeline) :
    '''
    :param user_id: the list_id as recognized by twitter
    :param timeline: the dictionary that is pulled from user_timeline twitter API
    :return: all the posts in dictionary format of a specified list_id
    '''
    # attribute lists
    post_attrs = ['created_at', 'text', 'source', 'in_reply_to_screen_name', 'retweet_count', 'favorite_count',
                  'favorited', 'retweeted', 'is_quote_status', 'retweeted_status']
    entities_attrs = ['hashtags', 'symbols', 'user_mentions']

    # creating empty dictionary, and specifying user id
    post_dict = defaultdict(list)

    for tweets in timeline :
        post_dict['user_id'] = user_id
        for post in list(post_attrs) :
            try :
                post_dict[post].append(tweets[post])
            except :
                post_dict[post].append(np.nan)

                # looping through other post attributes
        for entity in entities_attrs :
            try :
                attr_name = 'len_' + entity
                post_dict[entity].append(tweets['entities'][entity])
                post_dict[attr_name].append(len(tweets['entities'][entity]))
            except :
                post_dict[entity].append(np.nan)
    return post_dict


def get_users(user_id, timeline):
    '''
    :param user_id:the list_id as recognized by twitter
    :param timeline:the dictionary that is pulled from user_timeline twitter API
    :return: user details for a given list_id
    '''
    # list of attributes
    attributes = ['name', 'screen_name', 'location', 'description', 'url', 'protected', 'followers_count',
                  'following', 'friends_count', 'listed_count', 'geo_enabled', 'created_at', 'favourites_count',
                  'statuses_count', 'contributors_enabled', 'is_translation_enabled', 'has_extended_profile',
                  'notifications', 'profile_image_url', 'profile_use_background_image']

    user_dict = defaultdict(list)  # creating empty dictionary, and specifying user id
    user_dict['user_id'] = user_id
    user_info = timeline[0]['user']  # creating a user_info and post dicts

    # looping through each user attribute
    for attribute in attributes :
        try :
            user_dict[attribute].append(user_info[attribute])

        except :
            user_dict[attribute].append(np.nan)

    return user_dict