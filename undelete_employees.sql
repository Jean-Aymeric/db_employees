DROP PROCEDURE IF EXISTS undeleteEmployees;
DELIMITER //

CREATE PROCEDURE undeleteEmployees(IN _emp_no INT)
BEGIN
    DECLARE exist INT;
    DECLARE errorMessage VARCHAR(255);
    DECLARE maxToDate DATE;

    SET exist = (SELECT COUNT(*) FROM employees WHERE employees.emp_no = _emp_no);
    IF exist = 0 THEN
        SET errorMessage = CONCAT('Employee ', _emp_no, ' does not exist');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = errorMessage;
    END IF;

    SET maxToDate = (SELECT MAX(to_date) FROM salaries WHERE emp_no = _emp_no);
    UPDATE salaries
        SET to_date = '9999-01-01'
    WHERE emp_no = _emp_no AND to_date = maxToDate;

    UPDATE titles
        SET to_date = '9999-01-01'
    WHERE emp_no = _emp_no AND to_date = maxToDate;

    UPDATE dept_manager
        SET to_date = '9999-01-01'
    WHERE emp_no = _emp_no AND to_date = maxToDate;
END //

DELIMITER ;