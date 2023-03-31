/*
Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. The output should be sorted by earliest date first 

Join all the table and use sum(case when) to generate cols
*/
select date
      ,non_paying
      ,paying
  from
    (
       select a3.date
             ,sum(case when a2.paying_customer = 'no' then a3.downloads else 0 end) as non_paying
             ,sum(case when a2.paying_customer = 'yes' then a3.downloads else 0 end) as paying
         from ms_user_dimension a1
         left join ms_acc_dimension a2
           on a1.acc_id = a2.acc_id
         left join ms_download_facts a3
           on a1.user_id = a3.user_id
        group by a3.date
        order by a3.date
    ) T
 where non_paying > paying
;