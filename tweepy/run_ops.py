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
