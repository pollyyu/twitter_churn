from config import *
api = create_api()
# define screen_name
def get_ids(screen_name):
    '''
    :argument: screen_name of user
    :returns: a list_id of the given user's followers
    '''
    # get first list
    first_list = api.followers_ids(screen_name=screen_name)
    id_list = first_list['ids']
    cursor = first_list['next_cursor']

    while cursor != 0 :
        user_ids = api.followers_ids(screen_name=screen_name, cursor=cursor)
        id_list.extend(user_ids[0]['ids'])
        cursor = user_ids[0]['next_cursor']

    return id_list