📄 1️⃣ unique_constraints.sql
ALTER TABLE Manufacturer
ADD CONSTRAINT uq_manufacturer_name UNIQUE (name);

ALTER TABLE Product
ADD CONSTRAINT uq_product_name UNIQUE (product_name);

ALTER TABLE Supplier
ADD CONSTRAINT uq_supplier_name UNIQUE (supplier_name);

ALTER TABLE Warehouse
ADD CONSTRAINT uq_warehouse_name UNIQUE (warehouse_name);

ALTER TABLE Customer
ADD CONSTRAINT uq_customer_email UNIQUE (email);

ALTER TABLE Transporter
ADD CONSTRAINT uq_transporter_name UNIQUE (transporter_name);

ALTER TABLE Purchase_Order
ADD CONSTRAINT uq_purchase_order_id UNIQUE (purchase_order_id);

ALTER TABLE Sales_Order
ADD CONSTRAINT uq_sales_order_id UNIQUE (sales_order_id);



📄 2️⃣ check_constraints.sql
ALTER TABLE Product
ADD CONSTRAINT chk_product_price CHECK (price > 0);

ALTER TABLE Inventory
ADD CONSTRAINT chk_inventory_quantity CHECK (quantity >= 0);

ALTER TABLE Purchase_Order_Details
ADD CONSTRAINT chk_po_quantity CHECK (quantity > 0);

ALTER TABLE Sales_Order_Details
ADD CONSTRAINT chk_so_quantity CHECK (quantity > 0);

ALTER TABLE Shipment_Items
ADD CONSTRAINT chk_shipment_quantity CHECK (quantity > 0);

ALTER TABLE Payment
ADD CONSTRAINT chk_payment_amount CHECK (amount > 0);

ALTER TABLE Delivery_Tracking
ADD CONSTRAINT chk_delivery_status
CHECK (status IN ('Packed','Shipped','Out for Delivery','Delivered'));

ALTER TABLE Supplier
ADD CONSTRAINT chk_supplier_contact CHECK (contact_no IS NOT NULL);

ALTER TABLE Warehouse
ADD CONSTRAINT chk_warehouse_location CHECK (location <> '');

ALTER TABLE Product
ADD CONSTRAINT chk_product_name CHECK (product_name <> '');

📄 3️⃣ default_constraints.sql
ALTER TABLE Purchase_Order
ALTER order_date SET DEFAULT (CURRENT_DATE);

ALTER TABLE Sales_Order
ALTER order_date SET DEFAULT (CURRENT_DATE);

ALTER TABLE Shipment
ALTER ship_date SET DEFAULT (CURRENT_DATE);

ALTER TABLE Delivery_Tracking
ALTER updated_date SET DEFAULT (CURRENT_DATE);

ALTER TABLE Payment
ALTER payment_date SET DEFAULT (CURRENT_DATE);

ALTER TABLE Inventory
ALTER quantity SET DEFAULT 0;

ALTER TABLE Product
ALTER price SET DEFAULT 0.00;

ALTER TABLE Delivery_Tracking
ALTER status SET DEFAULT 'Packed';

ALTER TABLE Customer
ALTER customer_name SET DEFAULT 'Unknown';

ALTER TABLE Warehouse
ALTER location SET DEFAULT 'Not Assigned';
