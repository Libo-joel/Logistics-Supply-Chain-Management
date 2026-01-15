-- 1. Inventory Audit Log
CREATE TABLE inventory_audit_log (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    old_quantity INT,
    new_quantity INT,
    action_type VARCHAR(20),
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- 2. Delivery Status Log
CREATE TABLE delivery_status_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    shipment_id INT,
    old_status VARCHAR(50),
    new_status VARCHAR(50),
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
