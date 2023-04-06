/*
You have been asked to find the job titles of the highest-paid employees.
Your output should include the highest-paid title or multiple titles with the same salary.
*/
select a2.worker_title
  from worker a1
  left join title a2
    on a1.worker_id = a2.worker_ref_id
 where a1.salary =
    (
      select max(salary) as salary
        from worker
    ) 
 group by a2.worker_title
;