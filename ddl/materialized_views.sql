-- 1. Materialized View: Inventory Summary
CREATE TABLE mv_inventory_summary AS
SELECT
    product_id,
    SUM(quantity) AS total_quantity
FROM Inventory
GROUP BY product_id;

CREATE INDEX idx_mv_inventory_product
ON mv_inventory_summary(product_id);


-- 2. Materialized View: Sales Summary
CREATE TABLE mv_sales_summary AS
SELECT
    so.customer_id,
    COUNT(so.sales_order_id) AS total_orders,
    SUM(p.amount) AS total_amount
FROM Sales_Order so
JOIN Payment p ON so.sales_order_id = p.sales_order_id
GROUP BY so.customer_id;

CREATE INDEX idx_mv_sales_customer
ON mv_sales_summary(customer_id);
