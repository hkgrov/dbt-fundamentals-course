with payments as (
    select * from {{ ref('stg_stripe__payments') }}
),

aggregated as (
    select
        SUM(payments.amount) AS total_revenue
    from payments
    where payments.status = 'success'
)

select * from aggregated