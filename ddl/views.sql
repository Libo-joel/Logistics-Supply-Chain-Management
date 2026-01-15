-- 1. Product with Manufacturer
CREATE VIEW vw_product_manufacturer AS
SELECT 
    p.product_id,
    p.product_name,
    p.price,
    m.name AS manufacturer_name
FROM Product p
JOIN Manufacturer m ON p.manufacturer_id = m.manufacturer_id;

-- 2. Inventory Status
CREATE VIEW vw_inventory_status AS
SELECT 
    w.warehouse_name,
    p.product_name,
    i.quantity
FROM Inventory i
JOIN Product p ON i.product_id = p.product_id
JOIN Warehouse w ON i.warehouse_id = w.warehouse_id;

-- 3. Purchase Order Summary
CREATE VIEW vw_purchase_order_summary AS
SELECT 
    po.purchase_order_id,
    s.supplier_name,
    po.order_date
FROM Purchase_Order po
JOIN Supplier s ON po.supplier_id = s.supplier_id;

-- 4. Purchase Order Products
CREATE VIEW vw_purchase_order_products AS
SELECT 
    po.purchase_order_id,
    p.product_name,
    pod.quantity
FROM Purchase_Order_Details pod
JOIN Purchase_Order po ON pod.purchase_order_id = po.purchase_order_id
JOIN Product p ON pod.product_id = p.product_id;

-- 5. Customer Sales Orders
CREATE VIEW vw_customer_sales_orders AS
SELECT 
    c.customer_name,
    so.sales_order_id,
    so.order_date
FROM Sales_Order so
JOIN Customer c ON so.customer_id = c.customer_id;

-- 6. Sales Order Details
CREATE VIEW vw_sales_order_details AS
SELECT 
    so.sales_order_id,
    p.product_name,
    sod.quantity
FROM Sales_Order_Details sod
JOIN Sales_Order so ON sod.sales_order_id = so.sales_order_id
JOIN Product p ON sod.product_id = p.product_id;

-- 7. Shipment Status
CREATE VIEW vw_shipment_status AS
SELECT 
    sh.shipment_id,
    t.transporter_name,
    dt.status
FROM Shipment sh
JOIN Transporter t ON sh.transporter_id = t.transporter_id
JOIN Delivery_Tracking dt ON sh.shipment_id = dt.shipment_id;

-- 8. Payment Summary
CREATE VIEW vw_payment_summary AS
SELECT 
    so.sales_order_id,
    c.customer_name,
    p.amount,
    p.payment_mode
FROM Payment p
JOIN Sales_Order so ON p.sales_order_id = so.sales_order_id
JOIN Customer c ON so.customer_id = c.customer_id;
