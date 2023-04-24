/**
What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.

Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.
*/
select a1.date
      ,sum(case when a2.action = 'accepted' then 1 else 0 end)/sum(case when a1.action = 'sent' then 1 else 0 end) as percentage_acceptance
  from fb_friend_requests a1
  left join fb_friend_requests a2
    on a1.user_id_sender = a2.user_id_sender 
   and a1.user_id_receiver = a2.user_id_receiver
   and a1.action = 'sent' 
   and a2.action = 'accepted'
 group by a1.date
having sum(case when a2.action = 'accepted' then 1 else 0 end) > 0
;

