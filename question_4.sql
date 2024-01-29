/* Create a view where the rows are the store types and the columns are
the total sales, percentage of total sales and the count of orders */

SELECT  store_type,
        SUM(orders.product_quantity * dim_product.sale_price) AS total_sales,
        COUNT(*) * 100 / SUM(COUNT(*)) OVER() AS percentage_of_total_sales,
        COUNT(order_date) AS count_of_orders
FROM
    orders
INNER JOIN
    dim_product ON dim_product.product_code = orders.product_code
INNER JOIN
    dim_store ON dim_store.store_code = orders.store_code
GROUP BY
    store_type
ORDER BY
    total_sales DESC;