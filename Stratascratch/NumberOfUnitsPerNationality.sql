/**
Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.
*/
select a1.country
      ,count(unit_id) as apartment_count
  from airbnb_units a1
  left join
    (
       select host_id
             ,age
         from airbnb_hosts
        group by host_id,age
    ) a2
   on a1.host_id = a2.host_id
where a1.unit_type = 'Apartment' and a2.age < 30
group by a1.country
;