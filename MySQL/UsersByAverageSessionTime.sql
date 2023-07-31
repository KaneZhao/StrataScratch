/*
Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, consider only the latest page_load and earliest page_exit. Output the user_id and their average session time.
*/
select user_id
,avg(TIMESTAMPDIFF(SECOND, page_load, page_exit)) as avg
from
(
select user_id
      ,date(timestamp)
      ,min(case when action = 'page_exit' then timestamp else null end) as page_exit
      ,max(case when action = 'page_load' then timestamp else null end) as page_load
  from facebook_web_log
 where action in ('page_exit', 'page_load')
 group by user_id, date(timestamp)
) T 
where page_exit is not null and page_load is not null
group by user_id
;