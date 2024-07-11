with dw_faturamento_model (
    select pro.model as "Model"
        ,sum(pro.price) AS "Faturamento"
    from public.airbyte_purchases pur inner join airbyte_products pro
    on pur.product_id = pro.product_id
    group by pro.model
    order by 2 desc
)

select * from dw_faturamento_model