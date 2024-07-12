
  create view "postgres"."public"."dw_faturamento_ano__dbt_tmp"
    
    
  as (
    with dw_faturamento_ano as(
    select 
	    DATE_PART('year', purchased_at) AS "Ano"
        ,sum(ap.price) AS "Faturamento"
    from 
	    public.airbyte_purchases pur 
    inner join 
	    airbyte_products ap
    on pur.product_id = ap.id 
    group by 1
    order by 1
)

select * from dw_faturamento_ano
  );