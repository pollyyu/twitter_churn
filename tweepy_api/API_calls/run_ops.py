import pandas as pd
from parse import *
from get_list import *
from config import *
import pickle

api = create_api()
id_list = get_ids('paulynnyu')

posts_dict = pd.DataFrame()
users_dict = pd.DataFrame()

for users in id_list :
    try :
        timeline = api.user_timeline(user_id=users, count=200)
        tweets = get_tweets(users, timeline)
        users = get_users(users, timeline)

    except :
        users = defaultdict(list)
        tweets = defaultdict(list)
        users['user_id'].append(users)
        users['authorized'].append(1)

    # print full list
    users_dict = users_dict.append(pd.DataFrame(users))
    posts_dict = posts_dict.append(pd.DataFrame(tweets))

with open('user.pickle', 'wb') as to_write:
    pickle.dump(users_dict,to_write)

with open('post.pickle', 'wb') as to_write:
    pickle.dump(posts_dict,to_write)