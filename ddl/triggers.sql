DELIMITER $$

-- 1. AFTER INSERT: Increase inventory after purchase
CREATE TRIGGER trg_after_purchase_insert
AFTER INSERT ON Purchase_Order_Details
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET quantity = quantity + NEW.quantity
    WHERE product_id = NEW.product_id;
END$$


-- 2. AFTER INSERT: Decrease inventory after sale
CREATE TRIGGER trg_after_sales_insert
AFTER INSERT ON Sales_Order_Details
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET quantity = quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END$$


-- 3. AFTER UPDATE: Log delivery status change
CREATE TRIGGER trg_after_delivery_update
AFTER UPDATE ON Delivery_Tracking
FOR EACH ROW
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO delivery_status_log
        (shipment_id, old_status, new_status)
        VALUES
        (NEW.shipment_id, OLD.status, NEW.status);
    END IF;
END$$

DELIMITER ;
