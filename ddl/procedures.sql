DELIMITER $$

-- 1. Create Purchase Order
CREATE PROCEDURE sp_create_purchase_order(
    IN p_supplier_id INT,
    IN p_order_date DATE
)
BEGIN
    INSERT INTO Purchase_Order (supplier_id, order_date)
    VALUES (p_supplier_id, p_order_date);
END$$


-- 2. Add item to Purchase Order
CREATE PROCEDURE sp_add_purchase_order_item(
    IN p_purchase_order_id INT,
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    INSERT INTO Purchase_Order_Details
    (purchase_order_id, product_id, quantity)
    VALUES (p_purchase_order_id, p_product_id, p_quantity);
END$$


-- 3. Create Sales Order
CREATE PROCEDURE sp_create_sales_order(
    IN p_customer_id INT,
    IN p_order_date DATE
)
BEGIN
    INSERT INTO Sales_Order (customer_id, order_date)
    VALUES (p_customer_id, p_order_date);
END$$


-- 4. Add item to Sales Order
CREATE PROCEDURE sp_add_sales_order_item(
    IN p_sales_order_id INT,
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    INSERT INTO Sales_Order_Details
    (sales_order_id, product_id, quantity)
    VALUES (p_sales_order_id, p_product_id, p_quantity);
END$$


-- 5. Create Shipment
CREATE PROCEDURE sp_create_shipment(
    IN p_sales_order_id INT,
    IN p_transporter_id INT,
    IN p_ship_date DATE
)
BEGIN
    INSERT INTO Shipment
    (sales_order_id, transporter_id, ship_date)
    VALUES (p_sales_order_id, p_transporter_id, p_ship_date);
END$$


-- 6. Update Payment
CREATE PROCEDURE sp_update_payment(
    IN p_payment_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_payment_mode VARCHAR(50),
    IN p_payment_date DATE
)
BEGIN
    UPDATE Payment
    SET
        amount = p_amount,
        payment_mode = p_payment_mode,
        payment_date = p_payment_date
    WHERE payment_id = p_payment_id;
END$$

DELIMITER ;
