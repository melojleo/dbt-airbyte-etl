with dw_faturamento_model as(
    select
        pro.model as "Model",
        sum(pro.price) AS "Faturamento"
    from
        public.airbyte_purchases pur
    inner join public.airbyte_products pro on pur.product_id = pro.id
    group by pro.model
    order by sum(pro.price) desc
)

select * from dw_faturamento_model