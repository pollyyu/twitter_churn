# define screen_name
screen_name = 'paulynnyu'

# get first list
first_list = api.followers_ids(screen_name=screen_name)
id_list = first_list['ids']
cursor = first_list['next_cursor']

while cursor != 0:
    user_ids = api.followers_ids(screen_name=screen_name, cursor=cursor)
    id_list.append(user_ids[0]['ids'])
    cursor = user_ids[0]['next_cursor']