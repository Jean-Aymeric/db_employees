DROP PROCEDURE IF EXISTS deleteEmployees;
DELIMITER //

CREATE PROCEDURE deleteEmployees(IN _emp_no INT)
BEGIN
    DECLARE exist INT;
    DECLARE errorMessage VARCHAR(255);

    SET exist = (SELECT COUNT(*) FROM employees WHERE employees.emp_no = _emp_no);
    IF exist = 0 THEN
        SET errorMessage = CONCAT('Employee ', _emp_no, ' does not exist');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = errorMessage;
    END IF;

    UPDATE salaries
        SET to_date = CURDATE()
    WHERE emp_no = _emp_no AND to_date = '9999-01-01';

    UPDATE titles
        SET to_date = CURDATE()
    WHERE emp_no = _emp_no AND to_date = '9999-01-01';

    UPDATE dept_manager
        SET to_date = CURDATE()
    WHERE emp_no = _emp_no AND to_date = '9999-01-01';
END //

DELIMITER ;