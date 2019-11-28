DROP TABLE IF EXISTS users2;
CREATE TABLE IF NOT EXISTS users2 (
  index int,
  authorized varchar,
  contributors_enabled varchar,
  created_at timestamp,
  description varchar,
  favourites_count BIGINT,
  followers_count BIGINT,
  folllowing varchar,
  friends_count BIGINT,
  geo_enabled varchar,
  has_extended_profile varchar,
  is_translation_enabled varchar,
  listed_count BIGINT,
  location varchar,
  name varchar,
  notifications varchar,
  profile_image_url varchar,
  profile_use_background_image varchar,
  protected varchar,
  screen_name varchar,
  statuses_count BIGINT,
  url varchar,
  user_id varchar,
  PRIMARY KEY (user_id)
);

ALTER TABLE users3
  ALTER created_at DROP DEFAULT
 ,ALTER created_at type timestamp USING created_at::timestamp
 ,ALTER created_at SET DEFAULT '1970-01-01 01:00:00'::timestamp;


-----------------
---- POSTS ------
-----------------

-- DROP TABLE IF EXISTS posts;
-- CREATE TABLE IF NOT EXISTS posts (
-- index int,
-- user_id varchar,
-- created_at timestamp,
-- text_content varchar,
-- source varchar,
-- in_reply_to_screen_name varchar,
-- retweet_count BIGINT,
-- favorite_count BIGINT,
-- favorited varchar (12),
-- retweeted varchar(12),
-- is_quote_status varchar (12),
-- retweeted_status varchar,
-- hashtags varchar,
-- len_hashtags int,
-- symbols varchar,
-- len_symbols int,
-- user_mentions varchar,
-- len_user_mentions int,
-- PRIMARY KEY (user_id, created_at)
-- );

DROP TABLE IF EXISTS tmp_table;
CREATE TEMP TABLE tmp_table
AS
SELECT *
FROM posts3
WITH NO DATA;

COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/AOC_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/Aerosmith_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/BarackObama_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/BernieSanders_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/BonJovi_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/ChiliPeppers_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/MittRomney_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/PythonHub_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/PythonInsider_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/PythonStack_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/RepCummings_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/SpeakerRyan_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/TDataScience_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/Weezer_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/fullstackpython_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/paramore_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/pythontrending_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/realpython_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/thebeatles_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/thekillers_posts.csv' DELIMITER ';' CSV HEADER;

-- second batch insert
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/TheChainsmokers_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/ThisIsSethsBlog_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/AdamMGrant_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/Imaginedragons_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/dbader_org_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/SpeakerPelosi_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/richardbranson_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/danariely_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/realDonaldTrump_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/voxdotcom_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/JimCarrey_posts.csv' DELIMITER ';' CSV HEADER;
--COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/profgalloway_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/sequoia_posts.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/tomhanks_posts.csv' DELIMITER ';' CSV HEADER;

DROP TABLE IF EXISTS posts4;
CREATE TABLE posts4
AS
SELECT *
FROM posts3
WITH NO DATA;

INSERT INTO posts4
SELECT  DISTINCT ON (user_id, created_at) *
FROM tmp_table
ON CONFLICT (user_id, created_at)
DO NOTHING;

----------------------------------------------
-- DROP TABLE users;
-- CREATE TABLE users
-- AS
-- SELECT *
-- FROM users2
-- WITH NO DATA
-- ;


DROP TABLE IF EXISTS tmp_table;
CREATE TEMP TABLE tmp_table
AS
SELECT *
FROM users
WITH NO DATA;

DROP TABLE IF EXISTS users2;
CREATE TABLE users2
AS
SELECT *
FROM users
WITH NO DATA;


-- INSERT INTO users2
-- SELECT index, authorized, contributors_enabled, created_at, description,favourites_count,
-- followers_count, following, friends_count, geo_enabled, has_extended_profile,
-- is_translation_enabled, listed_count, location, name, notifications, profile_image_url,
-- profile_use_background_image, protected, screen_name, statuses_count ,url, user_id FROM
-- (SELECT *,
-- ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY user_id) AS ROW_NUMBER
-- FROM users) sub
-- WHERE ROW_NUMBER = 1

COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/AOC_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/Aerosmith_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/BarackObama_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/BernieSanders_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/BonJovi_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/ChiliPeppers_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/MittRomney_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/PythonHub_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/PythonInsider_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/PythonStack_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/RepCummings_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/SpeakerRyan_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/TDataScience_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/Weezer_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/fullstackpython_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/paramore_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/pythontrending_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/realpython_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/thebeatles_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/thekillers_users.csv' DELIMITER ';' CSV HEADER;

-- second batch INSERT
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/TheChainsmokers_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/ThisIsSethsBlog_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/AdamMGrant_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/Imaginedragons_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/dbader_org_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/SpeakerPelosi_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/richardbranson_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/danariely_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/realDonaldTrump_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/voxdotcom_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/JimCarrey_users.csv' DELIMITER ';' CSV HEADER;
--COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/profgalloway_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/sequoia_users.csv' DELIMITER ';' CSV HEADER;
COPY tmp_table FROM '/home/ubuntu/API_calls/Data2/tomhanks_users.csv' DELIMITER ';' CSV HEADER;


INSERT INTO users2
SELECT  DISTINCT ON (user_id) *
FROM tmp_table
-- ON CONFLICT ON CONSTRAINT (user_id)
 -- (user_id)
-- DO NOTHING;

DELETE FROM users WHERE followers_count is null

select count(*) from tmp_table where followers_count is null;



-----------------------------------------

aws$ jupyter notebook --no-browser --port=8889

local$ ssh -N -f -L localhost:9995:localhost:8889 ubuntu@myaws


scp -r ~/.ssh/new_key.pem API_calls ubuntu@myaws:.

echo "$string" | sed

------------
-- let's first play with some easy data before scaling
CREATE TABLE posts3
AS SELECT * FROM
posts
WITH NO DATA
-- LIMIT 3000

COPY posts3 FROM '/home/ubuntu/API_calls/Data/ultimetis_posts.csv' DELIMITER ';' CSV HEADER;




-- writing sql query to get posts DATA
DROP TABLE IF EXISTS user_agg2;
CREATE TABLE user_agg2 AS
SELECT
user_id,
COUNT(*) AS tweet_count,
max(created_at) AS latest_post,
min(created_at) AS earliest_post,
count(created_at) AS count_posts,
avg(text_length) AS mean_text_length,
stddev(text_length) AS std_dev_text_length,
SUM(Android) AS Android,
SUM(iPhone) AS iPhone,
SUM(Desktop_web) AS Desktop_web,
SUM(Web_app) AS Web_app,
SUM(count_reply_screen) AS sum_count_reply_screen,
SUM(retweet_count) AS sum_retweet,
SUM(favorite_count) AS sum_favorite_count,
SUM(retweet_zero) AS sum_retweet_zero,
SUM(retweet_100) AS sum_retweet_100,
SUM(retweet_1000) AS sum_retweet_1000,
SUM(retweet_viral) AS sum_retweet_viral,
SUM(len_hashtags) AS len_hashtags,
SUM(len_symbols) AS len_symbols,
SUM(len_user_mentions) AS len_user_mentions
FROM
  (SELECT
  *,
  source,
  char_length(text_content) as text_length,
  CASE WHEN substring(source from 62 for 19) = 'Twitter for Android' THEN 1 ELSE 0 END AS Android,
  CASE WHEN substring(source from 61 for 18) = 'Twitter for iPhone' THEN 1 ELSE 0 END AS iPhone,
  CASE WHEN substring(source from 45 for 18) = 'Twitter Web Client' THEN 1 ELSE 0 END AS Desktop_web,
  CASE WHEN substring(source from 53 for 15) = 'Twitter Web App' THEN 1 ELSE 0 END AS Web_app,
  CASE WHEN in_reply_to_screen_name is not null THEN 1 ELSE 0 END AS count_reply_screen,
  CASE WHEN retweet_count = 0 THEN 1 ELSE 0 END AS retweet_zero,
  CASE WHEN retweet_count > 0 AND retweet_count < 100 THEN 1 ELSE 0 END AS retweet_100,
  CASE WHEN retweet_count >= 100 AND retweet_count <1000 THEN 1 ELSE 0 END AS retweet_1000,
  CASE WHEN retweet_count >= 1000 THEN 1 ELSE 0 END AS retweet_viral,
  CASE WHEN favorited = 'True' THEN 1 ELSE 0 END AS favorited_YN,
  CASE WHEN retweeted = 'True' THEN 1 ELSE 0 END AS retweeted_YN,
  CASE WHEN is_quote_status = 'True' THEN 1 ELSE 0 END AS is_quote_status_YN
  FROM posts4) sub
GROUP BY user_id
;

---- let's try the 1 month, 2 month and 3 month thing
DROP TABLE IF EXISTS dates_posts2;
CREATE TABLE dates_posts2 AS
SELECT
tb.user_id,
aggr.days_30,
aggr.days_60,
aggr.days_90,
aggr.latest_post,
tb.created_at
FROM posts4 AS tb INNER JOIN
  (SELECT -- getting individual dates for each latest post
    user_id,
    latest_post - interval '30' day AS days_30,
    latest_post - interval '60' day AS days_60,
    latest_post - interval '90' day AS days_90,
    latest_post
    FROM
      (SELECT
        user_id,
        max(created_at) AS latest_post -- getting latest post for each user_id
        FROM posts4 GROUP BY 1) AS sub) AS aggr
ON tb.user_id = aggr.user_id
;

----- ok , let's try to count the days now
DROP TABLE IF EXISTS agg_dates2;
CREATE TABLE agg_dates2 AS
SELECT
user_id,
SUM(count_30) AS days_30,
SUM(count_60) AS days_60,
SUM(count_90) AS days_90,
SUM(count_before_90) AS days_before_90,
SUM(jan19) AS jan19,
SUM(feb19) AS feb19,
SUM(mar19) AS mar19,
SUM(apr19) AS apr19,
SUM(may19) AS may19,
SUM(jun19) AS jun19,
SUM(jul19) AS jul19,
SUM(aug19) AS aug19,
SUM(sep19) AS sep19,
SUM(oct19) AS oct19,
COUNT(*) AS tweet_count
FROM
  (SELECT
  user_id,
  CASE WHEN created_at >= days_30 THEN 1 ELSE 0 END AS count_30,
  CASE WHEN created_at < days_30 AND created_at >= days_60 THEN 1 ELSE 0 END AS count_60,
  CASE WHEN created_at < days_60 AND created_at >= days_90 THEN 1 ELSE 0 END AS count_90,
  CASE WHEN created_at < days_90 THEN 1 ELSE 0 END AS count_before_90,
  CASE WHEN EXTRACT(YEAR FROM created_at) = 2019 AND EXTRACT(MONTH FROM created_at) = 1 THEN 1 ELSE 0 END AS jan19,
  CASE WHEN EXTRACT(YEAR FROM created_at) = 2019 AND EXTRACT(MONTH FROM created_at) = 2 THEN 1 ELSE 0 END AS feb19,
  CASE WHEN EXTRACT(YEAR FROM created_at) = 2019 AND EXTRACT(MONTH FROM created_at) = 3 THEN 1 ELSE 0 END AS mar19,
  CASE WHEN EXTRACT(YEAR FROM created_at) = 2019 AND EXTRACT(MONTH FROM created_at) = 4 THEN 1 ELSE 0 END AS apr19,
  CASE WHEN EXTRACT(YEAR FROM created_at) = 2019 AND EXTRACT(MONTH FROM created_at) = 5 THEN 1 ELSE 0 END AS may19,
  CASE WHEN EXTRACT(YEAR FROM created_at) = 2019 AND EXTRACT(MONTH FROM created_at) = 6 THEN 1 ELSE 0 END AS jun19,
  CASE WHEN EXTRACT(YEAR FROM created_at) = 2019 AND EXTRACT(MONTH FROM created_at) = 7 THEN 1 ELSE 0 END AS jul19,
  CASE WHEN EXTRACT(YEAR FROM created_at) = 2019 AND EXTRACT(MONTH FROM created_at) = 8 THEN 1 ELSE 0 END AS aug19,
  CASE WHEN EXTRACT(YEAR FROM created_at) = 2019 AND EXTRACT(MONTH FROM created_at) = 9 THEN 1 ELSE 0 END AS sep19,
  CASE WHEN EXTRACT(YEAR FROM created_at) = 2019 AND EXTRACT(MONTH FROM created_at) = 10 THEN 1 ELSE 0 END AS oct19
  FROM dates_posts2) sub
GROUP BY user_id

--- join agg_dates with the main TABLE
-- DROP TABLE final_users;

INSERT INTO final_users
SELECT a.*,
b.days_30,
b.days_60,
b.days_90,
b.days_before_90
FROM user_agg2 a
JOIN agg_dates2 b ON a.user_id = b.user_id



user_id, tweet_count, latest_post, earliest_post,count_posts, mean_text_length,
std_dev_text_length, android, iphone, desktop_web, web_app, sum_count_reply_screen,
sum_retweet, sum_favorite_count, sum_retweet_zero, sum_retweet_100, sum_retweet_1000,
sum_retweet_viral, len_hashtags, len_symbols, len_user_mentions, days_30, days_60,
days_90, days_before_90, index, authorized, contributors_enabled,

--- create clean table
DROP TABLE users_cleaned;
CREATE TABLE users_cleaned AS
-- INSERT INTO users_cleaned
SELECT
created_at,
description,
char_length(description) AS length_description,
favourites_count,
followers_count,
CASE WHEN following = 'True' THEN 1 ELSE 0 END AS following_YN,
friends_count,
CASE WHEN geo_enabled = 'True' THEN 1 ELSE 0 END AS geo_enabled_YN,
CASE WHEN has_extended_profile = 'True' THEN 1 ELSE 0 END AS extended_profile_YN,
CASE WHEN is_translation_enabled = 'True' THEN 1 ELSE 0 END AS translation_enabled_YN,
listed_count,
CASE WHEN location is not null THEN 1 ELSE 0 END AS location_stated_YN,
location,
name,
char_length(name) AS length_name,
CASE WHEN notifications = 'True' THEN 1 ELSE 0 END AS notification_YN,
profile_image_url,
CASE WHEN profile_image_url = 'http://abs.twimg.com/sticky/default_profile_images/default_profile_normal.png' THEN 1 ELSE 0 END AS default_profile_image_YN,
CASE WHEN profile_use_background_image = 'True' THEN 1 ELSE 0 END AS background_image_YN,
CASE WHEN protected = 'True' THEN 1 ELSE 0 END AS protected_YN,
screen_name,
char_length(screen_name) AS screen_name_length,
statuses_count,
CASE WHEN url IS NOT NULL THEN 1 ELSE 0 END AS url_YN,
user_id
FROM users2
WHERE authorized is null
;

--- joined TABLE
DROP TABLE final_table;
CREATE TABLE final_table2 AS
SELECT
a.* ,
b.created_at, b.description, b.length_description, b.favourites_count, b.followers_count,b.following_yn,
b.friends_count, b.geo_enabled_yn, b.extended_profile_yn, b.translation_enabled_yn, b.listed_count,
b.location_stated_yn, b.location, b.name, b.length_name, b.notification_yn, b.profile_image_url,
b.default_profile_image_yn, b.background_image_yn, b.protected_yn, b.screen_name, b.screen_name_length,
b.statuses_count, b.url_yn
FROM final_users a INNER JOIN users_cleaned b
ON a.user_id = b.user_id


CREATE TABLE final_table3 AS
SELECT user_id, tweet_count, latest_post, earliest_post,count_posts, mean_text_length,
std_dev_text_length, android, iphone, desktop_web, web_app, sum_count_reply_screen,
sum_retweet, sum_favorite_count, sum_retweet_zero, sum_retweet_100, sum_retweet_1000,
sum_retweet_viral, len_hashtags, len_symbols, len_user_mentions, days_30, days_60,
days_90, days_before_90, created_at, description, length_description, favourites_count,
followers_count,following_yn, friends_count, geo_enabled_yn, extended_profile_yn,
translation_enabled_yn, listed_count, location_stated_yn, location, name,
length_name, notification_yn, profile_image_url, default_profile_image_yn, background_image_yn,
protected_yn, screen_name, screen_name_length, statuses_count, url_yn FROM
(SELECT *,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY user_id) AS ROW_NUMBER
FROM final_table2) sub
WHERE ROW_NUMBER = 1

---- let's analyze the table
scp -i ~/.ssh/new_key.pem ubuntu@myaws:/home/ubuntu/api_calls/Data/menu_initial.csv .

scp -i ~/.ssh/new_key.pem ubuntu@54.219.144.195:/home/ubuntu/Modeling.ipynb .

Modeling.ipynb

python -c 'from run_ops import *; create_csv(user_set = ["Kell_Belle77"])'
