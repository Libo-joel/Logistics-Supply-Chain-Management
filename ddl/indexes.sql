-- Manufacturer
CREATE INDEX idx_manufacturer_name ON Manufacturer(name);

-- Product
CREATE INDEX idx_product_name ON Product(product_name);
CREATE INDEX idx_product_price ON Product(price);
CREATE INDEX idx_product_manufacturer ON Product(manufacturer_id);

-- Supplier
CREATE INDEX idx_supplier_name ON Supplier(supplier_name);

-- Warehouse
CREATE INDEX idx_warehouse_name ON Warehouse(warehouse_name);
CREATE INDEX idx_warehouse_location ON Warehouse(location);

-- Customer
CREATE INDEX idx_customer_name ON Customer(customer_name);
CREATE INDEX idx_customer_email ON Customer(email);

-- Transporter
CREATE INDEX idx_transporter_name ON Transporter(transporter_name);

-- Inventory
CREATE INDEX idx_inventory_product ON Inventory(product_id);
CREATE INDEX idx_inventory_warehouse ON Inventory(warehouse_id);
CREATE INDEX idx_inventory_product_warehouse 
ON Inventory(product_id, warehouse_id);

-- Purchase Order
CREATE INDEX idx_purchase_order_supplier ON Purchase_Order(supplier_id);
CREATE INDEX idx_purchase_order_date ON Purchase_Order(order_date);

-- Purchase Order Details
CREATE INDEX idx_po_details_order ON Purchase_Order_Details(purchase_order_id);
CREATE INDEX idx_po_details_product ON Purchase_Order_Details(product_id);

-- Sales Order
CREATE INDEX idx_sales_order_customer ON Sales_Order(customer_id);
CREATE INDEX idx_sales_order_date ON Sales_Order(order_date);

-- Sales Order Details
CREATE INDEX idx_so_details_order ON Sales_Order_Details(sales_order_id);
CREATE INDEX idx_so_details_product ON Sales_Order_Details(product_id);

-- Shipment
CREATE INDEX idx_shipment_sales_order ON Shipment(sales_order_id);
CREATE INDEX idx_shipment_transporter ON Shipment(transporter_id);
CREATE INDEX idx_shipment_ship_date ON Shipment(ship_date);

-- Shipment Items
CREATE INDEX idx_shipment_items_shipment ON Shipment_Items(shipment_id);
CREATE INDEX idx_shipment_items_product ON Shipment_Items(product_id);

-- Delivery Tracking
CREATE INDEX idx_delivery_tracking_shipment ON Delivery_Tracking(shipment_id);
CREATE INDEX idx_delivery_tracking_status ON Delivery_Tracking(status);

-- Payment
CREATE INDEX idx_payment_sales_order ON Payment(sales_order_id);
CREATE INDEX idx_payment_date ON Payment(payment_date);
