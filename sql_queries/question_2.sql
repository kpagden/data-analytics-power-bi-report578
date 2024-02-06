--2. Which month in 2022 has had the highest revenue?

SELECT  month_name,
        SUM(orders.product_quantity * dim_product.sale_price) AS revenue
FROM
    orders
INNER JOIN
    dim_product ON dim_product.product_code = orders.product_code
INNER JOIN
    dim_date ON dim_date.date = orders.order_date
WHERE
    year = 2022
GROUP BY
    month_name
ORDER BY
    revenue DESC
LIMIT
    1;

