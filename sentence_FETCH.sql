--Listar todos los empleados por su id y su nombre
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id;

--Listar los 5 primeros id y nombre de empleados
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
FETCH FIRST 5 ROWS ONLY;

---Listar el 10% de los empleados por su id y nombre
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
FETCH FIRST 10 PERCENT ROWS ONLY;

---Listar los 10 registros despues de los 5 primeros
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY;

---Listar el 50% de la cantidad de registros a partir del registro 8
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
OFFSET 7 ROWS FETCH NEXT 50 PERCENT ROWS ONLY;

SELECT employee_id, first_name, salary
FROM employees
ORDER BY salary DESC;

