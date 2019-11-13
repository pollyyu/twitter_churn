# twitter_churn

There are 3 main steps in this notebook: 
1) Data acquisition (using Twitter API)
2) Data management (in Postgresql)
3) Data modelling (in Jupyter notebook)
4) Presentation of findings (found in Presentation.key)

## 1) API calls
The API calls are in folder tweepy_api/API_calls. 
Users are obtained by getting user_id from a given screen_name's followers (the configuration of this is run_ops.py).  
The collected followers historical timeline and their profile attributes will be obtained from calling another API. Up to 200 historical posts were collected

The relevant files and purposes are:   
``` 
-- API_calls:
  -- config.py
      desc: configuration details for API connection. Will return api tweepy method
  -- get_list.py
      desc: calls the followers tweepy API to get a list of user_ids for a stated screen name in run_ops 
  -- parse.py 
      desc: has parser functions for users and posts
  -- run_ops.py 
     desc: where you run the main file. main argument is screen name, and output will be two pickle files: (1) users dataframe (2) user posts dataframe. The two dataframes may be joined by primary key user_id
```
Run run_ops.py to API. The operation will spit out user attributes and their historical timeline information in tweepy_api/api_calls/data

## 2) Data management
70,000 and 10 million historical posts were collected from step 1. 

Because there were too many historical posts to process in python, the preprocessing of dates and feature engineering of frequency by months were done in postgresql. 

The csv generated from step 1) were copied into two raw postgresql tables: users and posts.

Then, there were subsequent steps in sql to process users and posts and perform feature engineering. 

The final table will be a merge between the two processed tables, and at a user level. This final table will then be accessed from a python jupyter notebook/ file to perform modelling.

You can find the sql code for data management and preprocessing in create_database.sql file


## 3) Data modelling
The modeling is done in Modelling.ipynb.

The main sections of this notebook is: 
* Accessing and (further) preprocessing of data
* Base Model and other techniques (oversampling, feature selection)
* Model selection
* Saving and outputting proba - this was outputted to fit into a Tableau dashboard for visualization. The selected visualization can be found in the presentation key 

## 4) Presentation of findings 
The final presentation and recommendation is in Presentation.key which can be opened from a keynote
