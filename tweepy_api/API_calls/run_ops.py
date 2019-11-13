import pandas as pd
import parse as parse
import get_list as get_list
import config as config
import pickle
from collections import defaultdict
import csv

api = config.create_api()
id_list = get_list.get_ids('GuinnessGB')

posts_dict = pd.DataFrame()
users_dict = pd.DataFrame()

for u in id_list :
    try:
        print(u)
        timeline = api.user_timeline(user_id=u, count=200)
        tweets = parse.get_tweets(u, timeline)
        users = parse.get_users(u, timeline)

    except:
        users = defaultdict(list)
        tweets = defaultdict(list)
        users['user_id'].append(users)
        users['authorized'].append(1)


    users_dict = users_dict.append(pd.DataFrame(users))
    posts_dict = posts_dict.append(pd.DataFrame(tweets))

posts_dict.to_csv("Data/GuinnessGB_post.csv", sep=";")
users_dict.to_csv("Data/GuinnessGB_users.csv", sep=";")

# with open('Data/SFUnified_user.pickle', 'wb') as to_write:
#     pickle.dump(users_dict,to_write)
#
# with open('Data/SFUnified_post.pickle', 'wb') as to_write:
#     pickle.dump(posts_dict,to_write)
