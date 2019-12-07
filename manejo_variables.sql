---Listar los empleados cuyo job_id sea IT_PROG
SELECT 
    employee_id,
    first_name,
    last_name,
    job_id
FROM 
    employees
WHERE
    job_id = 'IT_PROG';

---Listar los empleados de acuerdo a un Job_ID ingresado por teclado
SELECT 
    employee_id,
    first_name,
    last_name,
    job_id
FROM 
    employees
WHERE
    job_id = '&job_id';
    
---Listar los datos de un empleado de acuerdo a su emploeyee_id
SELECT
    employee_id, 
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    employee_id = &employee_id;

---Listar los empleados de acuerdo a una columna asignada
---una determinada condición y especificar la columna por la cual se va a ordenar
SELECT
    employee_id,
    first_name,
    last_name,
    &column_name
FROM
    employees
WHERE
    &condition
ORDER  BY &order_column;
