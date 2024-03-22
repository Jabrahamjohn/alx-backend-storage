--- resets the atrribute email when email has been changed
DELIMITER //

CREATE TRIGGER reset_valid_email
BEFORE UPDATE ON your_table
FOR EACH ROW
BEGIN
    IF NEW.email <> OLD.email THEN
        SET NEW.valid_email = NULL;
    END IF;
END //

DELIMITER ;