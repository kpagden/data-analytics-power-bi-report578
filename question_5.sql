/* 5. Which product category generated the most profit for the
"Wiltshire, UK" region in 2021? */

SELECT  category AS product_category,
        SUM(product_quantity * (dim_product.sale_price - cost_price)) AS profit
FROM
    orders
INNER JOIN
    dim_product ON dim_product.product_code = orders.product_code
INNER JOIN
    dim_date ON dim_date.date = orders.order_date
INNER JOIN
    dim_store ON dim_store.store_code = orders.store_code
WHERE
    year = 2021
AND
    full_region = 'Wiltshire, UK'
GROUP BY
    category
ORDER BY
    profit DESC
LIMIT
    1;