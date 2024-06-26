-- -----------------------------------
--  funcion para ingresar datos de la persona 
-- -----------------------------------

/* Toma como parametro los valores que estan en el insert original hacia persona, y los ingresa a las tablas derivadas de persona que están en esta base de datos*/

DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_DATA_PERSON//
CREATE PROCEDURE INSERT_DATA_PERSON(
    IN id INT ,
    IN nif VARCHAR(9),
    IN nombre VARCHAR(25) ,
    IN apellido1 VARCHAR(50) ,
    IN apellido2 VARCHAR(50),
    IN ciudad VARCHAR(25) ,
    IN direccion VARCHAR(50) ,
    IN telefono VARCHAR(9),
    IN fecha_nacimiento DATE ,
    IN sexo ENUM('H', 'M'),
    IN tipo ENUM('profesor', 'alumno')
)
BEGIN
	DECLARE genre VARCHAR(20);
	DECLARE rol VARCHAR(20);
	DECLARE calle VARCHAR(70);
	DECLARE complement_l INT;
	DECLARE address_l INT;
	DECLARE person_l INT;
	
	
	IF sexo = 'H' THEN -- traduce las opciones: 'Femenine', 'Masculine'
		SET genre = 'M';
	ELSE 
		SET genre = 'F';
	END IF;
	
	IF tipo = 'profesor' THEN -- traduce las opciones
		SET rol = 'teacher';
	ELSE 
		SET rol = 'student ';
	END IF;
	
	SET calle = recortar_calle(direccion); -- obtiene el numero del complmento de la direccion(calle)
	
	
	INSERT INTO person VALUES(id, nif,nombre, apellido1, apellido2, fecha_nacimiento, genre, rol);
	
	SET person_l = LAST_INSERT_ID();
	
	INSERT INTO complement(complement_type_id, complement_description) VALUES(1, calle);
	SET complement_l = LAST_INSERT_ID();
	INSERT INTO address(person_id, city_id) VALUES(person_l,1);
	SET address_l = LAST_INSERT_ID();
	INSERT INTO address_complement VALUES(complement_l,address_l );
	
    IF telefono IS NOT NULL THEN
        INSERT INTO telephone(person_id, phone_number, type_id) VALUES (person_l, telefono, 1);
    END IF;
END//
DELIMITER ;


-- -----------------------------------------------
-- funcion para ingresar datos de las asignaturas
-- ----------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS DATA_SUBJECT$$
CREATE PROCEDURE DATA_SUBJECT(
    IN id INT  ,
    IN nombre VARCHAR(100)  ,
    IN creditos FLOAT UNSIGNED  ,
    IN tipo VARCHAR(20),
    IN curso TINYINT   ,
    IN cuatrimestre TINYINT   ,
    IN id_profesor INT ,
    IN id_grado INT  
)
BEGIN

	DECLARE subject_type VARCHAR(20);
	
	IF tipo = 'básica' THEN
		SET subject_type = 'Basic';
	ELSEIF tipo = 'obligatoria' THEN
		SET subject_type = 'Mandatory';
	ELSE
		SET subject_type = 'Optional';
	END IF;
	
	INSERT INTO subject VALUES(id, nombre, creditos, subject_type, curso, cuatrimestre, id_profesor, id_grado);
END$$
DELIMITER ;
