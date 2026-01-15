-- Manufacturer
CREATE TABLE Manufacturer (
    manufacturer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- Product
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    manufacturer_id INT,
    FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(manufacturer_id)
);

-- Supplier
CREATE TABLE Supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_no VARCHAR(20)
);

-- Warehouse
CREATE TABLE Warehouse (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100),
    location VARCHAR(100)
);

-- Inventory
CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id)
);

-- Purchase Order
CREATE TABLE Purchase_Order (
    purchase_order_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    order_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- Purchase Order Details
CREATE TABLE Purchase_Order_Details (
    purchase_order_details_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (purchase_order_id) REFERENCES Purchase_Order(purchase_order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Customer
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

-- Sales Order
CREATE TABLE Sales_Order (
    sales_order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Sales Order Details
CREATE TABLE Sales_Order_Details (
    sales_order_details_id INT AUTO_INCREMENT PRIMARY KEY,
    sales_order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (sales_order_id) REFERENCES Sales_Order(sales_order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Transporter
CREATE TABLE Transporter (
    transporter_id INT AUTO_INCREMENT PRIMARY KEY,
    transporter_name VARCHAR(100)
);

-- Shipment
CREATE TABLE Shipment (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    sales_order_id INT,
    transporter_id INT,
    ship_date DATE,
    FOREIGN KEY (sales_order_id) REFERENCES Sales_Order(sales_order_id),
    FOREIGN KEY (transporter_id) REFERENCES Transporter(transporter_id)
);

-- Shipment Items
CREATE TABLE Shipment_Items (
    shipment_items_id INT AUTO_INCREMENT PRIMARY KEY,
    shipment_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Delivery Tracking
CREATE TABLE Delivery_Tracking (
    delivery_tracking_id INT AUTO_INCREMENT PRIMARY KEY,
    shipment_id INT,
    status VARCHAR(50),
    updated_date DATE,
    FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id)
);

-- Payment
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    sales_order_id INT,
    amount DECIMAL(10,2),
    payment_mode VARCHAR(50),
    payment_date DATE,
    FOREIGN KEY (sales_order_id) REFERENCES Sales_Order(sales_order_id)
);
