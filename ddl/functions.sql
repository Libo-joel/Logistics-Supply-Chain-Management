DELIMITER $$

-- 1. Get product price
CREATE FUNCTION fn_get_product_price(p_product_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE price DECIMAL(10,2);

    SELECT p.price INTO price
    FROM Product p
    WHERE p.product_id = p_product_id;

    RETURN price;
END$$

-- 2. Get total inventory of a product
CREATE FUNCTION fn_total_inventory(p_product_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_qty INT;

    SELECT SUM(quantity) INTO total_qty
    FROM Inventory
    WHERE product_id = p_product_id;

    RETURN IFNULL(total_qty, 0);
END$$

-- 3. Get total sales amount of an order
CREATE FUNCTION fn_sales_order_total(p_sales_order_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(sod.quantity * p.price)
    INTO total
    FROM Sales_Order_Details sod
    JOIN Product p ON sod.product_id = p.product_id
    WHERE sod.sales_order_id = p_sales_order_id;

    RETURN IFNULL(total, 0);
END$$

-- 4. Get latest delivery status
CREATE FUNCTION fn_delivery_status(p_shipment_id INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(50);

    SELECT status INTO status_val
    FROM Delivery_Tracking
    WHERE shipment_id = p_shipment_id
    ORDER BY updated_date DESC
    LIMIT 1;

    RETURN status_val;
END$$

DELIMITER ;
