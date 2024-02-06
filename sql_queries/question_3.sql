--3. Which German store type had the highest revenue in 2022?

SELECT  store_type,
        SUM(orders.product_quantity * dim_product.sale_price) AS revenue
FROM
    orders
INNER JOIN
    dim_product ON dim_product.product_code = orders.product_code
INNER JOIN
    dim_date ON dim_date.date = orders.order_date
INNER JOIN
    dim_store ON dim_store.store_code = orders.store_code
WHERE
    year = 2022
AND
    country = 'Germany'
GROUP BY
    store_type
ORDER BY
    revenue DESC
LIMIT
    1;