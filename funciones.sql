/** Funciones de una sola fila **/

--Funciones de caracter (conversi�n)

--- Upper, Lower e Initcap
SELECT UPPER('lima') AS "MAY�SCULAS" FROM dual; -- min�scula a may�scula
SELECT LOWER('LIMA') AS "min�sculas"FROM dual; -- may�scula a min�scula
SELECT INITCAP('an�lisis de sistemas') AS "CAPITAL" FROM dual; -- primeras letras en may�sculas

SELECT
    employee_id,
    first_name, upper(first_name), --todo a may�sculas
    last_name, lower(last_name), --todo a min�sculas
    email, initcap(email) --todo a primera may�scula y resto min�scula
FROM
    employees;
    

--Funciones de manupulaci�n de caracteres
---Length
SELECT
    'computadora' AS "Texto",
    LENGTH('computadora') AS "Cantidad de caracteres"
FROM
    dual;

SELECT
    'Carrera Profesional de An�lisis de Sistremas' AS "Texto",
    LENGTH('Carrera Profesional de An�lisis de Sistemas') AS "Cantidad de caracteres"
FROM
    dual;

SELECT 
    department_name AS "Departamento",
    LENGTH(department_name) AS "cantidad de caracteres"
FROM 
    departments;

---Concat
SELECT
    'Hola' AS "Cadena 01",
    'Mundo' AS "Cadena 02",
    CONCAT('Hola', 'Mundo') AS "Concatenar", -- la funci�n concat s�lo admite dos par�metros
    ('Hola' || ' ' || 'Mundo') AS "Operador de concatenaci�n" -- El operador de concatenaci�n une dos o m�s cadenas
FROM
    dual;

SELECT
    first_name AS "Nombre",
    last_name AS "Apellido",
    CONCAT(first_name, last_name) AS "Nombre y Apellido",
    (last_name || ', ' || first_name) AS "Apellido y Nombre"
FROM
    employees;

---SUBSTR
SELECT
    'Instituto Valle Grande' AS  "Cadena de texto",
    SUBSTR('Instituto Valle Grande', 1, 9) AS "Extraer Instituto",
    SUBSTR('Instituto Valle Grande', 11, 5) AS "Extraer Valle",
    SUBSTR('Instituto Valle Grande', 17, 6) AS "Extraer Grande" 
FROM
    dual;
    
SELECT
    first_name AS "Empleado",
    SUBSTR(hire_date, 4,9) AS "Mes - A�o"
FROM
    employees;

---INSTR
SELECT 
    'escritorio' AS "Cadena de texto",
    INSTR('escritorio', 't', 1) AS "Posici�n del caracter T",
    INSTR('escritorio', 'c', 1) AS "Posici�n del caracter C",
    INSTR('escritorio', 'r', 1, 2) AS "Posici�n de la 2da aparici�n del caracter R",
    INSTR('escritorio', 'I', 1, 2) AS "Posici�n de la 2da aparici�n del caracter I", -- diferencia entre may�sculas y min�sculas
    INSTR('escritorio', 'i', 1, 2) AS "Posici�n de la 2da aparici�n del caracter I"
FROM
    dual;
    
SELECT
    department_name AS "Departamento",
    INSTR(department_name, 'o', 1) AS "Posici�n del caracter o"
FROM
    departments;

---LPAD, RPAD
SELECT
    'mouse' AS "Cadena de texto",
    LPAD('mouse', 8, '*') AS "completar con caracteres a la izquierda",
    RPAD('mouse', 8, '*') AS "completar con caracteres a la derecha"
FROM
    dual;

---TRIM
SELECT
    TRIM('*' from '***mouse') AS "Quitando caracteres de la izquierda",
    TRIM('*' from 'mouse***') AS "Quitando caracteres de la derecha",
    TRIM('*' from '***mouse******') AS "Quitando caracteres de ambos lados",
    TRIM(' ' from '        computadora     ') AS "Quitando espacios en blanco"
FROM
    dual;

---REPLACE
SELECT
    'Programador de aplicaciones' AS "Cadena de texto",
    REPLACE('Programador de aplicaciones', 'aplicaciones', 'software') AS "Cambiando aplicaciones por software",
    REPLACE('Programador de aplicaciones', 'Programador', 'Constructor') AS "Cambiando programador por constructor"
FROM
    dual;
    
SELECT 
    REPLACE('programador programador computador mesa', 'a', 'i') -- busca un caracter o cadena y los reemplaza cada vez que coincide
FROM 
    dual; 

--Funciones num�ricas

---ROUND
SELECT 
    23.363 AS "N�mero",
    ROUND(23.363, 2) AS "Redondear a dos decimales",
    ROUND(23.363, 1) AS "Redondear a un decimal",
    ROUND(23.36, -1) AS "Redondear" -- redondea un n�mero un d�gito a la izquierda del punto decimal
FROM
    dual;

---MOD
SELECT
    'Diviri 20/3' AS "Divisi�n",
    MOD(20,3) AS "Residuo"
FROM
    dual;
    
---TRUNC
SELECT
    TRUNC(345.254) AS "Quitar decimales",
    TRUNC(345.254, 2) AS "Dejar dos decimales",
    TRUNC(345.254, -1) AS "Quitar hasta un entero",
    TRUNC(345.254, -2) AS "Quitar hasta dos enteros"
FROM
    dual;

--Funciones de fecha

---Formato por default es DD-MM-RR
SELECT 
    employee_id AS "ID",
    first_name AS "Empleado",
    hire_date AS "Fecha de contrato"
FROM
    employees;

---Fecha actual del sistema
SELECT sysdate AS "Fecha actual del sistema" FROM dual;

---Agregando o sumando d�as
SELECT 
    sysdate AS "Fecha actual del sistema",
    sysdate + 21 AS "Navidad" ---Agregando d�as a una fecha
FROM 
    dual;

---Restando d�as a una fecha
SELECT 
    sysdate AS "Fecha actual del sistema",
    sysdate - 10 AS "Retrocediendo en el tiempo" ---Restando d�as a una fecha
FROM 
    dual;
    
---La resta de dos fechas da como resultado el n�mero de d�as
SELECT 
    first_name AS "Empleado",
    hire_date AS "Fecha de contrato",
    sysdate AS "Fecha actual del sistema",
    sysdate - hire_date AS "Resta de fechas"
FROM 
    employees;

---Obteniendo n�mero de semanas entre dos fecha
SELECT
    sysdate AS "Fecha actual",
    hire_date AS "Fecha de contrato",
    (sysdate-hire_date)/7 AS "N�mero de semanas",
    round((sysdate-hire_date)/7) AS "Redondenado el n�mero de semanas"
FROM
    employees;

---Obteniendo el n�mero de meses entre dos fechas
SELECT
    first_name AS "Empleado",
    hire_date AS "Fecha de contrato",
    sysdate AS "Fecha actual",
    MONTHS_BETWEEN(sysdate, hire_date) AS "Cantidad de meses transcurridos"
FROM
    employees;

---Agregando o sumando meses a una fecha 
SELECT
    first_name AS "Empleado",
    hire_date AS "Fecha de contrato",
    ADD_MONTHS(hire_date, 3) AS "Fecha de contrato m�s 3 meses"
FROM
    employees;
    
---Restando meses a un fecha
SELECT
    first_name AS "Empleado",
    hire_date AS "Fecha de contrato",
    ADD_MONTHS(hire_date, -3) AS "Fecha de contrato menos 3 meses"
FROM
    employees;

---Averiguar fecha a partir de un nombre de d�a
SELECT
    sysdate AS "Fecha actual",
    NEXT_DAY(sysdate, 'SATURDAY') AS "D�a siguiente", --b�squeda a partir de un nombre de d�a de semana
    NEXT_DAY(sysdate, 7) AS "D�a siguiente" -- b�squeda a partir de un n�mero de d�a de semana (1 = sunday.... 7 = saturday
FROM
    dual;

---Obtener el �ltimo d�a del mes a partir de una fecha
SELECT
    sysdate AS "Fecha actual del sistema",
    LAST_DAY(sysdate) AS "�ltima fecha del mes de acuerdo a una fecha"
FROM
    dual;


SELECT * FROM nls_session_parameters;

SELECT * FROM nls_database_parameters;

SELECT * FROM NLS_INSTANCE_PARAMETERS;


---Obtener nombre del d�a de una determinada fecha
SELECT
    sysdate AS "Fecha actual",
    TO_CHAR(sysdate, 'DAY') AS "D�a actual"
FROM
    dual;
