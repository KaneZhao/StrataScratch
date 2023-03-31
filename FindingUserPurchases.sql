/*
 Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.
 Using lag() to access the data of last shop time from the current  
*/
select user_id
  from
  (
    select user_id
          ,created_at
          ,lag(created_at, 1) over (partition by user_id order by created_at) nextday
     from amazon_transactions
    order by user_id, created_at
  ) T
 where datediff(created_at, nextday) <= 7  
 group by user_id
;