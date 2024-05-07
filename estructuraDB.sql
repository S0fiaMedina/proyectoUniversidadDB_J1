-- Script de la creacion de la base de datos de Universidad

DROP DATABASE IF EXISTS universidadDB;
CREATE DATABASE universidadDB;
USE universidadDB;

/*
*********** TABLAS DERIVADAS DE PERSONA***********
*/
-- PERSONA

CREATE TABLE person (
    id INT UNSIGNED AUTO_INCREMENT,
    nif VARCHAR(9) UNIQUE,
    name VARCHAR(25) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    last_surname VARCHAR(50),
    birthday DATE NOT NULL,
    genre ENUM('F', 'M') NOT NULL,
    type ENUM('teacher', 'student') NOT NULL,
    CONSTRAINT pk_person PRIMARY KEY(id)
)ENGINE = INNODB;


/*
*********** TABLAS DERIVADAS DE DIRECCION***********
*/

-- PAISES
CREATE TABLE country(
	id INT NOT NULL AUTO_INCREMENT,
	country_name VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT pk_country PRIMARY KEY(id)
)ENGINE = INNODB;

-- REGIONES
CREATE TABLE region(
	id INT NOT NULL	 AUTO_INCREMENT,
	region_name VARCHAR(50) NOT NULL,
	country_id INT NOT NULL,
	CONSTRAINT pk_region PRIMARY KEY(id),
	CONSTRAINT fk_region_country FOREIGN KEY(country_id) REFERENCES country(id)
)ENGINE = INNODB;

-- CIUDAD

CREATE TABLE city(
	id INT NOT NULL AUTO_INCREMENT,
	city_name VARCHAR(50) NOT NULL,
	region_id INT NOT NULL,
	CONSTRAINT pk_city PRIMARY KEY(id),
	CONSTRAINT fk_city_region FOREIGN KEY(region_id) REFERENCES region(id)
)ENGINE = INNODB;

--  TIPO DE COMPLEMENTO

CREATE TABLE complement_type(
	id INT NOT NULL AUTO_INCREMENT,
	type_name VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT pk_complement_type PRIMARY KEY(id)
)ENGINE = INNODB;

-- COMPLEMENTO

CREATE TABLE complement(
	id INT NOT NULL AUTO_INCREMENT,
	complement_type_id INT NOT NULL,
	complement_description VARCHAR(50) NOT NULL,
	CONSTRAINT pk_complement PRIMARY KEY(id),
	CONSTRAINT FOREIGN KEY(complement_type_id) REFERENCES complement_type(id)
)ENGINE = INNODB;

-- DIRECCION

CREATE TABLE address( 
	id INT NOT NULL AUTO_INCREMENT,
	person_id INT UNSIGNED NOT NULL,
	zip VARCHAR(15) NOT NULL,
	city_id INT NOT NULL,
	CONSTRAINT pk_address PRIMARY KEY(id),
	CONSTRAINT fk_address_city FOREIGN KEY(city_id) REFERENCES city(id),
	CONSTRAINT fk_address_person FOREIGN KEY(person_id) REFERENCES person(id)
)ENGINE = INNODB;

-- DIRECCION COMPLEMENTO

CREATE TABLE address_complement(
    complement_id INT NOT NULL,
    address_id INT NOT NULL,
    CONSTRAINT pk_address_complement PRIMARY KEY(complement_id, address_id),
    CONSTRAINT fk_address_complement_complement FOREIGN KEY(complement_id) REFERENCES complement(id),
    CONSTRAINT fk_address_complement_address FOREIGN KEY(address_id) REFERENCES address(id)
)ENGINE = INNODB;


/*
******************* TABLAS DERIVADAS DE TELEFONO *******************
*/

-- TIPO DE TELEFONO
CREATE TABLE telephone_type(
	id INT NOT NULL AUTO_INCREMENT,
	type_name VARCHAR(15) NOT NULL,
	CONSTRAINT pk_telephone_type PRIMARY KEY(id)
)ENGINE = INNODB;

/*
-- TELEFONO
*/
CREATE TABLE telephone(
	id INT NOT NULL AUTO_INCREMENT,
	person_id INT UNSIGNED NOT NULL,
	phone_number VARCHAR(10)  NOT NULL,
	type_id INT NOT NULL,
	CONSTRAINT pk_telephone PRIMARY KEY(id),
	CONSTRAINT fk_telephone_person FOREIGN KEY(person_id) REFERENCES person(id),
	CONSTRAINT fk_telephone_type FOREIGN KEY(type_id) REFERENCES telephone_type(id)
)ENGINE = INNODB;







/*
*********** TABLAS DERIVADAS DE PROFESOR***********
*/

-- DEPARTAMENTO
CREATE TABLE department (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- PROFESOR

CREATE TABLE teacher (
    id INT UNSIGNED NOT NULL,
    department_id INT UNSIGNED NOT NULL,
    CONSTRAINT pk_teacher PRIMARY KEY(id),
    CONSTRAINT fk_teacher_person FOREIGN KEY (id) REFERENCES person(id),
    CONSTRAINT fk_teacher_department FOREIGN KEY (department_id) REFERENCES department(id)
)ENGINE = INNODB;

-- GRADO

CREATE TABLE grade (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_grade PRIMARY KEY(id)
)ENGINE = INNODB;




-- materia

CREATE TABLE subject (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    credits FLOAT UNSIGNED NOT NULL,
    type ENUM('Basic', 'Mandatory', 'Optional') NOT NULL,
    course TINYINT UNSIGNED NOT NULL,
    quarter TINYINT UNSIGNED NOT NULL,
    teacher_id INT UNSIGNED,
    grade_id INT UNSIGNED NOT NULL,
    CONSTRAINT pk_subject PRIMARY KEY(id),
    CONSTRAINT fk_subject_teacher FOREIGN KEY(teacher_id) REFERENCES teacher(id),
    CONSTRAINT fk_subject_grade FOREIGN KEY(grade_id) REFERENCES grade(id)
)ENGINE = INNODB;

CREATE TABLE academic_year (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    start_date YEAR NOT NULL,
    finish_date YEAR NOT NULL
);

-- estudiante
CREATE TABLE student_enrollment (
    student_id INT UNSIGNED NOT NULL,
    subject_id INT UNSIGNED NOT NULL,
    academic_year_id INT  NOT NULL,
    PRIMARY KEY (student_id, subject_id, academic_year_id),
    FOREIGN KEY (student_id) REFERENCES person(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id),
    FOREIGN KEY (academic_year_id) REFERENCES academic_year(id)
)ENGINE = INNODB;
