DROP USER ynnov1@'%';
CREATE USER ynnov1@'%' IDENTIFIED BY 'ynnov';
GRANT SELECT ON ynnov1_employees TO ynnov1@'%';
GRANT SELECT ON ynnov1_departments TO ynnov1@'%';
GRANT EXECUTE ON PROCEDURE deleteEmployees TO ynnov1@'%';
SHOW GRANTS FOR ynnov1@'%';