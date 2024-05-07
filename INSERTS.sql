-- PROCEDIMIENTO PARA PERSONAS
INSERT INTO country VALUES(1, 'España');
INSERT INTO region VALUES(1,'Almería', 1 );
INSERT INTO complement_type(type_name) VALUES('Calle');
INSERT INTO telephone_type(type_name) VALUES ('Fijo');



-- INSERTS DE DEPARTAMENTO
INSERT INTO department  VALUES (1, 'Informática');
INSERT INTO department  VALUES (2, 'Matemáticas');
INSERT INTO department  VALUES (3, 'Economía y Empresa');
INSERT INTO department  VALUES (4, 'Educación');
INSERT INTO department  VALUES (5, 'Agronomía');
INSERT INTO department  VALUES (6, 'Química y Física');
INSERT INTO department  VALUES (7, 'Filología');
INSERT INTO department  VALUES (8, 'Derecho');
INSERT INTO department  VALUES (9, 'Biología y Geología');

-- PROFESOR
INSERT INTO teacher VALUES (3, 1);
INSERT INTO teacher VALUES (5, 2);
INSERT INTO teacher VALUES (8, 3);
INSERT INTO teacher VALUES (10, 4);
INSERT INTO teacher VALUES (12, 4);
INSERT INTO teacher VALUES (13, 6);
INSERT INTO teacher VALUES (14, 1);
INSERT INTO teacher VALUES (15, 2);
INSERT INTO teacher VALUES (16, 3);
INSERT INTO teacher VALUES (17, 4);
INSERT INTO teacher VALUES (18, 5);
INSERT INTO teacher VALUES (20, 6);

-- GRADO
INSERT INTO grade VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO grade VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO grade VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO grade VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO grade VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO grade VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO grade VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO grade VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grade VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO grade VALUES (10, 'Grado en Química (Plan 2009)');

-- CURSO ESCOLAR
INSERT INTO academic_year VALUES (1, 2014, 2015);
INSERT INTO academic_year VALUES (2, 2015, 2016);
INSERT INTO academic_year VALUES (3, 2016, 2017);
INSERT INTO academic_year VALUES (4, 2017, 2018);
INSERT INTO academic_year VALUES (5, 2018, 2019); 

--ESTUDIANTE
INSERT INTO student VALUES (1, 1, 1);
INSERT INTO student VALUES (1, 2, 1);
INSERT INTO student VALUES (1, 3, 1);
INSERT INTO student VALUES (2, 1, 1);
INSERT INTO student VALUES (2, 2, 1);
INSERT INTO student VALUES (2, 3, 1);
INSERT INTO student VALUES (4, 1, 1);
INSERT INTO student VALUES (4, 2, 1);
INSERT INTO student VALUES (4, 3, 1);
INSERT INTO student VALUES (24, 1, 5);
INSERT INTO student VALUES (24, 2, 5);
INSERT INTO student VALUES (24, 3, 5);
INSERT INTO student VALUES (24, 4, 5);
INSERT INTO student VALUES (24, 5, 5);
INSERT INTO student VALUES (24, 6, 5);
INSERT INTO student VALUES (24, 7, 5);
INSERT INTO student VALUES (24, 8, 5);
INSERT INTO student VALUES (24, 9, 5);
INSERT INTO student VALUES (24, 10, 5);
INSERT INTO student VALUES (23, 1, 5);
INSERT INTO student VALUES (23, 2, 5);
INSERT INTO student VALUES (23, 3, 5);
INSERT INTO student VALUES (23, 4, 5);
INSERT INTO student VALUES (23, 5, 5);
INSERT INTO student VALUES (23, 6, 5);
INSERT INTO student VALUES (23, 7, 5);
INSERT INTO student VALUES (23, 8, 5);
INSERT INTO student VALUES (23, 9, 5);
INSERT INTO student VALUES (23, 10, 5);
INSERT INTO student VALUES (19, 1, 5);
INSERT INTO student VALUES (19, 2, 5);
INSERT INTO student VALUES (19, 3, 5);
INSERT INTO student VALUES (19, 4, 5);
INSERT INTO student VALUES (19, 5, 5);
INSERT INTO student VALUES (19, 6, 5);
INSERT INTO student VALUES (19, 7, 5);
INSERT INTO student VALUES (19, 8, 5);
INSERT INTO student VALUES (19, 9, 5);
INSERT INTO student VALUES (19, 10, 5);
