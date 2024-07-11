with dw_faturamento_ano as(
    select DATE_PART('year', purchased_at) AS "Ano"
        ,sum(ap.price) AS "Faturamento"
    from public.airbyte_purchases pur inner.join airbyte_products ap
    on our.product_id = ap.product_idgroup by 1
    order by 1
)

select * from dw_faturamento_ano