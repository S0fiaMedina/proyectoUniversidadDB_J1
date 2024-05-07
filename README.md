# Proyecto de base de datos (#2)



### 👤Autoría



- **Nombre:** Sofia Marcela Medina Díaz.
- **Grupo:** J1



## :school:  Base de datos de universidad :school: 

### 🗃️ Diagrama entidad - relación



### 🔨 Creación de tablas



### 👀 Vistas



### 🔧 Inserción de datos



### 🔍 Consultas



#### Consultas sobre una tabla

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

  ```sql
  SELECT name, last_name, last_surname FROM person
  WHERE type = 'student';
  
  +----------+------------+--------------+
  | name     | last_name  | last_surname |
  +----------+------------+--------------+
  | Salvador | Sánchez    | Pérez        |
  | Juan     | Saez       | Vega         |
  | Pedro    | Heller     | Pagac        |
  | José     | Koss       | Bayer        |
  | Ismael   | Strosin    | Turcotte     |
  | Ramón    | Herzog     | Tremblay     |
  | Daniel   | Herman     | Pacocha      |
  | Inma     | Lakin      | Yundt        |
  | Juan     | Gutiérrez  | López        |
  | Antonio  | Domínguez  | Guerrero     |
  | Irene    | Hernández  | Martínez     |
  | Sonia    | Gea        | Ruiz         |
  +----------+------------+--------------+
  
  ```

  

2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.

  ```sql
  SELECT p.name, p.last_name, p.last_surname FROM person AS p
  LEFT JOIN telephone AS t ON t.person_id = p.id
  WHERE t.person_id IS NULL;
  
  +-----------+------------+--------------+
  | name      | last_name  | last_surname |
  +-----------+------------+--------------+
  | Zoe       | Ramirez    | Gea          |
  | Ismael    | Strosin    | Turcotte     |
  | Guillermo | Ruecker    | Upton        |
  | Inma      | Lakin      | Yundt        |
  | Francesca | Schowalter | Muller       |
  | Antonio   | Domínguez  | Guerrero     |
  | Irene     | Hernández  | Martínez     |
  | Sonia     | Gea        | Ruiz         |
  +-----------+------------+--------------+
  ```

  

3. Devuelve el listado de los alumnos que nacieron en 1999.

   ```sql
   SELECT name, last_name, last_surname FROM person
   WHERE type = 'student' AND YEAR(birthday) = 1999;
   
   +---------+------------+--------------+
   | name    | last_name  | last_surname |
   +---------+------------+--------------+
   | Ismael  | Strosin    | Turcotte     |
   | Antonio | Domínguez  | Guerrero     |
   +---------+------------+--------------+
   ```

   

4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.

  ```sql
  SELECT p.id, p.nif, p.name, p.last_name, p.last_surname FROM person AS p
  LEFT JOIN telephone AS t ON t.person_id = p.id
  WHERE t.person_id IS NULL AND p.type = 'teacher' AND p.nif NOT LIKE '%k';
  
  +----+-----------+-----------+------------+--------------+
  | id | nif       | name      | last_name  | last_surname |
  +----+-----------+-----------+------------+--------------+
  |  3 | 11105554G | Zoe       | Ramirez    | Gea          |
  | 20 | 79221403L | Francesca | Schowalter | Muller       |
  +----+-----------+-----------+------------+--------------+
  ```

  

5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

  ```sql
  SELECT name, quarter, course, grade_id FROM subject 
  WHERE course = 3 AND quarter = 1 AND grade_id = 7;
  
  +---------------------------------------------+---------+--------+----------+
  | name                                        | quarter | course | grade_id |
  +---------------------------------------------+---------+--------+----------+
  | Bases moleculares del desarrollo vegetal    |       1 |      3 |        7 |
  | Fisiología animal                           |       1 |      3 |        7 |
  | Metabolismo y biosíntesis de biomoléculas   |       1 |      3 |        7 |
  | Operaciones de separación                   |       1 |      3 |        7 |
  | Patología molecular de plantas              |       1 |      3 |        7 |
  | Técnicas instrumentales básicas             |       1 |      3 |        7 |
  +---------------------------------------------+---------+--------+----------+
  
  
  ```

  

#### Consultas multitabla (Composición interna)

1. Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

  ```sql
  SELECT DISTINCT p.id, p.nif, p.name, p.last_name, p.last_surname, g.name FROM person AS p
  INNER JOIN student_enrollment AS s ON s.student_id = p.id
  INNER JOIN subject AS su ON su.id = s.subject_id 
  INNER JOIN grade AS g ON g.id = su.grade_id
  WHERE g.name LIKE '%Ingeniería Informática (Plan 2015)';
  
  +----+-----------+----------+------------+--------------+-----------------------------------------------+
  | id | nif       | name     | last_name  | last_surname | name                                          |
  +----+-----------+----------+------------+--------------+-----------------------------------------------+
  |  1 | 26902806M | Salvador | Sánchez    | Pérez        | Grado en Ingeniería Informática (Plan 2015)   |
  |  2 | 89542419S | Juan     | Saez       | Vega         | Grado en Ingeniería Informática (Plan 2015)   |
  |  4 | 17105885A | Pedro    | Heller     | Pagac        | Grado en Ingeniería Informática (Plan 2015)   |
  | 19 | 11578526G | Inma     | Lakin      | Yundt        | Grado en Ingeniería Informática (Plan 2015)   |
  | 23 | 64753215G | Irene    | Hernández  | Martínez     | Grado en Ingeniería Informática (Plan 2015)   |
  | 24 | 85135690V | Sonia    | Gea        | Ruiz         | Grado en Ingeniería Informática (Plan 2015)   |
  +----+-----------+----------+------------+--------------+-----------------------------------------------+
  
  ```

  

2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).

  ```sql
  SELECT su.name FROM subject AS su
  INNER JOIN grade AS gr ON gr.id = su.grade_id
  WHERE gr.name LIKE '%Ingeniería Informática (Plan 2015)';
  
  +---------------------------------------------------------------------------+
  | name                                                                      |
  +---------------------------------------------------------------------------+
  | Álgegra lineal y matemática discreta                                      |
  | Cálculo                                                                   |
  | Física para informática                                                   |
  | Introducción a la programación                                            |
  | Organización y gestión de empresas                                        |
  | Estadística                                                               |
  | Estructura y tecnología de computadores                                   |
  | Fundamentos de electrónica                                                |
  | Lógica y algorítmica                                                      |
  | Metodología de la programación                                            |
  | Arquitectura de Computadores                                              |
  | Estructura de Datos y Algoritmos I                                        |
  | Ingeniería del Software                                                   |
  | Sistemas Inteligentes                                                     |
  | Sistemas Operativos                                                       |
  | Bases de Datos                                                            |
  | Estructura de Datos y Algoritmos II                                       |
  | Fundamentos de Redes de Computadores                                      |
  | Planificación y Gestión de Proyectos Informáticos                         |
  | Programación de Servicios Software                                        |
  | Desarrollo de interfaces de usuario                                       |
  | Ingeniería de Requisitos                                                  |
  | Integración de las Tecnologías de la Información en las Organizaciones    |
  | Modelado y Diseño del Software 1                                          |
  | Multiprocesadores                                                         |
  | Seguridad y cumplimiento normativo                                        |
  | Sistema de Información para las Organizaciones                            |
  | Tecnologías web                                                           |
  | Teoría de códigos y criptografía                                          |
  | Administración de bases de datos                                          |
  | Herramientas y Métodos de Ingeniería del Software                         |
  | Informática industrial y robótica                                         |
  | Ingeniería de Sistemas de Información                                     |
  | Modelado y Diseño del Software 2                                          |
  | Negocio Electrónico                                                       |
  | Periféricos e interfaces                                                  |
  | Sistemas de tiempo real                                                   |
  | Tecnologías de acceso a red                                               |
  | Tratamiento digital de imágenes                                           |
  | Administración de redes y sistemas operativos                             |
  | Almacenes de Datos                                                        |
  | Fiabilidad y Gestión de Riesgos                                           |
  | Líneas de Productos Software                                              |
  | Procesos de Ingeniería del Software 1                                     |
  | Tecnologías multimedia                                                    |
  | Análisis y planificación de las TI                                        |
  | Desarrollo Rápido de Aplicaciones                                         |
  | Gestión de la Calidad y de la Innovación Tecnológica                      |
  | Inteligencia del Negocio                                                  |
  | Procesos de Ingeniería del Software 2                                     |
  | Seguridad Informática                                                     |
  +---------------------------------------------------------------------------+
  
  ```

  

3. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.

  ```sql
  SELECT p.name, p.last_name, p.last_surname, d.name FROM person AS p
  INNER JOIN teacher AS t ON t.id = p.id
  INNER JOIN department AS d ON d.id = t.department_id
  ORDER BY p.last_name ASC, p.last_surname ASC , p.name ASC;
  
  +-----------+------------+--------------+---------------------+
  | name      | last_name  | last_surname | name                |
  +-----------+------------+--------------+---------------------+
  | Antonio   | Fahey      | Considine    | Economía y Empresa  |
  | Manolo    | Hamill     | Kozey        | Informática         |
  | Alejandro | Kohler     | Schoen       | Matemáticas         |
  | Cristina  | Lemke      | Rutherford   | Economía y Empresa  |
  | Micaela   | Monahan    | Murray       | Agronomía           |
  | Zoe       | Ramirez    | Gea          | Informática         |
  | Guillermo | Ruecker    | Upton        | Educación           |
  | David     | Schmidt    | Fisher       | Matemáticas         |
  | Francesca | Schowalter | Muller       | Química y Física    |
  | Esther    | Spencer    | Lakin        | Educación           |
  | Alfredo   | Stiedemann | Morissette   | Química y Física    |
  | Carmen    | Streich    | Hirthe       | Educación           |
  +-----------+------------+--------------+---------------------+
  
  ```

  

4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.

  ```sql
  SELECT su.name, ay.start_year, ay.finish_year FROM person AS p
  INNER JOIN student_enrollment AS se ON se.student_id = p.id 
  INNER JOIN subject AS su ON su.id = se.subject_id
  INNER JOIN academic_year AS ay ON ay.id = se.academic_year_id
  WHERE p.nif = '26902806M';
  
  +-----------+----------+----------------------------------------+------------+-------------+
  | nif       | name     | name                                   | start_year | finish_year |
  +-----------+----------+----------------------------------------+------------+-------------+
  | 26902806M | Salvador | Álgegra lineal y matemática discreta   |       2014 |        2015 |
  | 26902806M | Salvador | Cálculo                                |       2014 |        2015 |
  | 26902806M | Salvador | Física para informática                |       2014 |        2015 |
  +-----------+----------+----------------------------------------+------------+-------------+
  
  ```

  

5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

  ```sql
  SELECT DISTINCT de.name FROM department AS de
  INNER JOIN teacher AS te ON te.department_id = de.id
  INNER JOIN subject AS su ON su.teacher_id = te.id
  INNER JOIN grade AS gr ON gr.id = su.grade_id
  WHERE gr.name = 'Grado en Ingeniería Informática (Plan 2015)';
  
  +--------------+
  | name         |
  +--------------+
  | Informática  |
  +--------------+
  
  ```

  

6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

  ```sql
  SELECT DISTINCT p.name, p.last_name, p.last_surname FROM person AS p
  INNER JOIN student_enrollment AS se ON se.student_id = p.id
  INNER JOIN academic_year AS ay ON ay.id = se.academic_year_id
  INNER JOIN subject AS su ON su.id = se.subject_id
  WHERE ay.start_year = 2018 AND ay.finish_year = 2019;
  
  +-------+------------+--------------+
  | name  | last_name  | last_surname |
  +-------+------------+--------------+
  | Inma  | Lakin      | Yundt        |
  | Irene | Hernández  | Martínez     |
  | Sonia | Gea        | Ruiz         |
  +-------+------------+--------------+
  
  ```

  

#### Consultas multitabla (Composición externa)

1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

  ```sql
  SELECT d.name, p.name, p.last_name, p.last_surname FROM person AS p
  RIGHT JOIN teacher AS t ON t.id = p.id
  LEFT JOIN department AS d ON d.id = t.department_id 
  ORDER BY p.last_name ASC, p.last_surname ASC , p.name ASC;
  
  +---------------------+-----------+------------+--------------+
  | name                | name      | last_name  | last_surname |
  +---------------------+-----------+------------+--------------+
  | Economía y Empresa  | Antonio   | Fahey      | Considine    |
  | Informática         | Manolo    | Hamill     | Kozey        |
  | Matemáticas         | Alejandro | Kohler     | Schoen       |
  | Economía y Empresa  | Cristina  | Lemke      | Rutherford   |
  | Agronomía           | Micaela   | Monahan    | Murray       |
  | Informática         | Zoe       | Ramirez    | Gea          |
  | Educación           | Guillermo | Ruecker    | Upton        |
  | Matemáticas         | David     | Schmidt    | Fisher       |
  | Química y Física    | Francesca | Schowalter | Muller       |
  | Educación           | Esther    | Spencer    | Lakin        |
  | Química y Física    | Alfredo   | Stiedemann | Morissette   |
  | Educación           | Carmen    | Streich    | Hirthe       |
  +---------------------+-----------+------------+--------------+
  
  ```

  

2. Devuelve un listado con los profesores que no están asociados a un departamento.

  ```sql
  SELECT d.name, p.name, p.last_name, p.last_surname FROM person AS p
  RIGHT JOIN teacher AS t ON t.id = p.id
  LEFT JOIN department AS d ON d.id = t.department_id 
  WHERE t.department_id IS NULL;
  
  Empty set (0,00 sec) -- todos los profesores estan asociados a un departamento
  ```

  

3. Devuelve un listado con los departamentos que no tienen profesores asociados.

  ```sql
  SELECT d.name 
  FROM department AS d
  LEFT JOIN teacher AS t ON d.id = t.department_id
  WHERE t.id IS NULL;
  
  +-----------------------+
  | name                  |
  +-----------------------+
  | Filología             |
  | Derecho               |
  | Biología y Geología   |
  +-----------------------+
  
  ```

  

4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

   ```sql
   SELECT  p.name, p.last_name, p.last_surname FROM person AS p
   RIGHT JOIN teacher AS t ON t.id = p.id
   LEFT JOIN subject AS su ON t.id = su.teacher_id 
   WHERE su.teacher_id IS NULL;
   
   +-----------+------------+--------------+
   | name      | last_name  | last_surname |
   +-----------+------------+--------------+
   | David     | Schmidt    | Fisher       |
   | Alejandro | Kohler     | Schoen       |
   | Cristina  | Lemke      | Rutherford   |
   | Antonio   | Fahey      | Considine    |
   | Esther    | Spencer    | Lakin        |
   | Carmen    | Streich    | Hirthe       |
   | Guillermo | Ruecker    | Upton        |
   | Micaela   | Monahan    | Murray       |
   | Alfredo   | Stiedemann | Morissette   |
   | Francesca | Schowalter | Muller       |
   +-----------+------------+--------------+
   
   ```

   

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

   ```sql
   SELECT su.name FROM subject AS su
   LEFT JOIN teacher AS t ON t.id = su.teacher_id
   WHERE su.teacher_id IS NULL;
   
   +---------------------------------------------------------------------------+
   | name                                                                      |
   +---------------------------------------------------------------------------+
   | Ingeniería de Requisitos                                                  |
   | Integración de las Tecnologías de la Información en las Organizaciones    |
   | Modelado y Diseño del Software 1                                          |
   | Multiprocesadores                                                         |
   | Seguridad y cumplimiento normativo                                        |
   | Sistema de Información para las Organizaciones                            |
   | Tecnologías web                                                           |
   | Teoría de códigos y criptografía                                          |
   | Administración de bases de datos                                          |
   | Herramientas y Métodos de Ingeniería del Software                         |
   | Informática industrial y robótica                                         |
   | Ingeniería de Sistemas de Información                                     |
   | Modelado y Diseño del Software 2                                          |
   | Negocio Electrónico                                                       |
   | Periféricos e interfaces                                                  |
   | Sistemas de tiempo real                                                   |
   | Tecnologías de acceso a red                                               |
   | Tratamiento digital de imágenes                                           |
   | Administración de redes y sistemas operativos                             |
   | Almacenes de Datos                                                        |
   | Fiabilidad y Gestión de Riesgos                                           |
   | Líneas de Productos Software                                              |
   | Procesos de Ingeniería del Software 1                                     |
   | Tecnologías multimedia                                                    |
   | Análisis y planificación de las TI                                        |
   | Desarrollo Rápido de Aplicaciones                                         |
   | Gestión de la Calidad y de la Innovación Tecnológica                      |
   | Inteligencia del Negocio                                                  |
   | Procesos de Ingeniería del Software 2                                     |
   | Seguridad Informática                                                     |
   | Biologia celular                                                          |
   | Física                                                                    |
   | Matemáticas I                                                             |
   | Química general                                                           |
   | Química orgánica                                                          |
   | Biología vegetal y animal                                                 |
   | Bioquímica                                                                |
   | Genética                                                                  |
   | Matemáticas II                                                            |
   | Microbiología                                                             |
   | Botánica agrícola                                                         |
   | Fisiología vegetal                                                        |
   | Genética molecular                                                        |
   | Ingeniería bioquímica                                                     |
   | Termodinámica y cinética química aplicada                                 |
   | Biorreactores                                                             |
   | Biotecnología microbiana                                                  |
   | Ingeniería genética                                                       |
   | Inmunología                                                               |
   | Virología                                                                 |
   | Bases moleculares del desarrollo vegetal                                  |
   | Fisiología animal                                                         |
   | Metabolismo y biosíntesis de biomoléculas                                 |
   | Operaciones de separación                                                 |
   | Patología molecular de plantas                                            |
   | Técnicas instrumentales básicas                                           |
   | Bioinformática                                                            |
   | Biotecnología de los productos hortofrutículas                            |
   | Biotecnología vegetal                                                     |
   | Genómica y proteómica                                                     |
   | Procesos biotecnológicos                                                  |
   | Técnicas instrumentales avanzadas                                         |
   +---------------------------------------------------------------------------+
   
   ```

   

6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

  ```sql
  SELECT d.name, su.name FROM department AS d
  JOIN teacher AS t ON d.id = t.department_id
  JOIN subject AS su ON t.id = su.teacher_id
  LEFT JOIN student_enrollment AS se ON su.id = se.subject_id
  WHERE se.subject_id IS NULL;
  
  +--------------+------------------------------------------------------+
  | name         | name                                                 |
  +--------------+------------------------------------------------------+
  | Informática  | Arquitectura de Computadores                         |
  | Informática  | Estructura de Datos y Algoritmos I                   |
  | Informática  | Ingeniería del Software                              |
  | Informática  | Sistemas Inteligentes                                |
  | Informática  | Sistemas Operativos                                  |
  | Informática  | Bases de Datos                                       |
  | Informática  | Estructura de Datos y Algoritmos II                  |
  | Informática  | Fundamentos de Redes de Computadores                 |
  | Informática  | Planificación y Gestión de Proyectos Informáticos    |
  | Informática  | Programación de Servicios Software                   |
  | Informática  | Desarrollo de interfaces de usuario                  |
  +--------------+------------------------------------------------------+
  
  ```

  

#### Consultas resumen

1. Devuelve el número total de alumnas que hay.

   ```sql
   SELECT COUNT(id) FROM person
   WHERE type = 'student';
   
   +-----------+
   | COUNT(id) |
   +-----------+
   |        12 |
   +-----------+
   
   ```

   

2. Calcula cuántos alumnos nacieron en 1999.

   ```sql
   SELECT COUNT(id) FROM person
   WHERE type = 'student' AND YEAR(birthday) = 1999;
   
   +-----------+
   | COUNT(id) |
   +-----------+
   |         2 |
   +-----------+
   ```

   

3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y
  deberá estar ordenado de mayor a menor por el número de profesores.

  ```sql
  SELECT d.name, COUNT(t.id) FROM teacher AS t
  INNER JOIN department AS d ON d.id = t.department_id
  GROUP BY d.name ORDER BY COUNT(t.id);
  
  +---------------------+-------------+
  | name                | COUNT(t.id) |
  +---------------------+-------------+
  | Agronomía           |           1 |
  | Informática         |           2 |
  | Matemáticas         |           2 |
  | Economía y Empresa  |           2 |
  | Química y Física    |           2 |
  | Educación           |           3 |
  +---------------------+-------------+
  
  ```

  

4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.

  ```sql
  SELECT d.name, COUNT(t.id) FROM teacher AS t
  RIGHT JOIN department AS d ON d.id = t.department_id
  GROUP BY d.name ORDER BY COUNT(t.id);
  
  +-----------------------+-------------+
  | name                  | COUNT(t.id) |
  +-----------------------+-------------+
  | Filología             |           0 |
  | Derecho               |           0 |
  | Biología y Geología   |           0 |
  | Agronomía             |           1 |
  | Informática           |           2 |
  | Matemáticas           |           2 |
  | Economía y Empresa    |           2 |
  | Química y Física      |           2 |
  | Educación             |           3 |
  +-----------------------+-------------+
  ```

  

5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

  ```sql
  SELECT gr.name, COUNT(s.id) FROM grade AS gr 
  LEFT JOIN subject AS s ON s.grade_id = gr.id
  GROUP BY gr.name 
  ORDER BY COUNT(s.id) DESC;
  
  +----------------------------------------------------------+-------------+
  | name                                                     | COUNT(s.id) |
  +----------------------------------------------------------+-------------+
  | Grado en Ingeniería Informática (Plan 2015)              |          51 |
  | Grado en Biotecnología (Plan 2015)                       |          32 |
  | Grado en Ingeniería Agrícola (Plan 2015)                 |           0 |
  | Grado en Ingeniería Eléctrica (Plan 2014)                |           0 |
  | Grado en Ingeniería Electrónica Industrial (Plan 2010)   |           0 |
  | Grado en Ingeniería Mecánica (Plan 2010)                 |           0 |
  | Grado en Ingeniería Química Industrial (Plan 2010)       |           0 |
  | Grado en Ciencias Ambientales (Plan 2009)                |           0 |
  | Grado en Matemáticas (Plan 2010)                         |           0 |
  | Grado en Química (Plan 2009)                             |           0 |
  +----------------------------------------------------------+-------------+
  
  
  ```

  

6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

  ```sql
  SELECT gr.name, COUNT(s.id) FROM grade AS gr 
  INNER JOIN subject AS s ON s.grade_id = gr.id
  GROUP BY gr.name 
  HAVING COUNT(s.id) > 40
  ORDER BY COUNT(s.id);
  
  +-----------------------------------------------+-------------+
  | name                                          | COUNT(s.id) |
  +-----------------------------------------------+-------------+
  | Grado en Ingeniería Informática (Plan 2015)   |          51 |
  +-----------------------------------------------+-------------+
  
  ```

  

7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.

  ```sql
  SELECT gr.name, su.type, SUM(su.credits) FROM subject AS su
  INNER JOIN grade AS gr ON gr.id = su.grade_id
  GROUP BY su.type, gr.name
  ORDER BY su.type DESC;
  
  +-----------------------------------------------+-----------+-----------------+
  | name                                          | type      | SUM(su.credits) |
  +-----------------------------------------------+-----------+-----------------+
  | Grado en Ingeniería Informática (Plan 2015)   | Optional  |             180 |
  | Grado en Biotecnología (Plan 2015)            | Mandatory |             120 |
  | Grado en Ingeniería Informática (Plan 2015)   | Mandatory |              54 |
  | Grado en Biotecnología (Plan 2015)            | Basic     |              60 |
  | Grado en Ingeniería Informática (Plan 2015)   | Basic     |              72 |
  +-----------------------------------------------+-----------+-----------------+
  ```

  

8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

  ```sql
  SELECT DISTINCT ay.start_year, COUNT(se.student_id) FROM student_enrollment AS se
  INNER JOIN academic_year AS ay ON ay.id = se.academic_year_id
  GROUP BY ay.start_year;
  
  +------------+----------------------+
  | start_year | COUNT(se.student_id) |
  +------------+----------------------+
  |       2014 |                    9 |
  |       2018 |                   30 |
  +------------+----------------------+
  ```

  

9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.

  ```sql
  SELECT p.id, p.name, p.last_name, p.last_surname, COUNT(DISTINCT su.id) FROM person AS p
  INNER JOIN teacher AS t ON t.id = p.id 
  LEFT JOIN subject AS su ON su.teacher_id = t.id
  GROUP BY p.id, p.name, p.last_name, p.last_surname
  ORDER BY COUNT(su.id) DESC;
  
  +----+-----------+------------+--------------+-----------------------+
  | id | name      | last_name  | last_surname | COUNT(DISTINCT su.id) |
  +----+-----------+------------+--------------+-----------------------+
  | 14 | Manolo    | Hamill     | Kozey        |                    11 |
  |  3 | Zoe       | Ramirez    | Gea          |                    10 |
  |  5 | David     | Schmidt    | Fisher       |                     0 |
  |  8 | Cristina  | Lemke      | Rutherford   |                     0 |
  | 10 | Esther    | Spencer    | Lakin        |                     0 |
  | 12 | Carmen    | Streich    | Hirthe       |                     0 |
  | 13 | Alfredo   | Stiedemann | Morissette   |                     0 |
  | 15 | Alejandro | Kohler     | Schoen       |                     0 |
  | 16 | Antonio   | Fahey      | Considine    |                     0 |
  | 17 | Guillermo | Ruecker    | Upton        |                     0 |
  | 18 | Micaela   | Monahan    | Murray       |                     0 |
  | 20 | Francesca | Schowalter | Muller       |                     0 |
  +----+-----------+------------+--------------+-----------------------+
  
  
  ```

  

#### Subconsultas

1. Devuelve todos los datos del alumno más joven.

   ```sql
   SELECT id, nif, name, last_name, last_surname, birthday, genre, type 
   FROM person
   WHERE birthday = (
       SELECT MIN(birthday) FROM person
   );
   
   +----+-----------+--------+-----------+--------------+------------+-------+---------+
   | id | nif       | name   | last_name | last_surname | birthday   | genre | type    |
   +----+-----------+--------+-----------+--------------+------------+-------+---------+
   | 12 | 85366986W | Carmen | Streich   | Hirthe       | 1971-04-29 | F     | teacher |
   +----+-----------+--------+-----------+--------------+------------+-------+---------+
   
   ```

   

2. Devuelve un listado con los profesores que no están asociados a un departamento.

  ```sql
  SELECT p.id, p.name, p.last_name, p.last_surname FROM person AS p
  INNER JOIN teacher AS t ON t.id = p.id  
  WHERE t.id NOT IN (
  	SELECT t1.id FROM teacher AS t1
      INNER JOIN department AS de ON de.id = t1.department_id
  );
  
  Empty set (0,00 sec) -- no hay profesores que no esten asignados a ningun departamento
  
  ```

  

3. Devuelve un listado con los departamentos que no tienen profesores asociados.

  ```sql
  SELECT de.name FROM department AS de
  WHERE de.id NOT IN (
  	SELECT department_id FROM teacher 
  );
  
  +-----------------------+
  | name                  |
  +-----------------------+
  | Filología             |
  | Derecho               |
  | Biología y Geología   |
  +-----------------------+
  
  ```

  

4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

  ```sql
  SELECT p.id, p.name, p.last_name, p.last_surname  FROM person AS p
  INNER JOIN teacher AS t ON t.id = p.id
  INNER JOIN department AS de ON de.id = t.department_id
  WHERE t.id NOT IN (
      SELECT teacher_id FROM subject
  );
  
  Empty set (0,00 sec)
  
  ```

  

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

   ```sql
   SELECT su.name FROM subject AS  su 
   WHERE NOT EXISTS (
       SELECT t.id  FROM teacher AS  t
     	WHERE t.id = su.teacher_id
   );
   
   +---------------------------------------------------------------------------+
   | name                                                                      |
   +---------------------------------------------------------------------------+
   | Ingeniería de Requisitos                                                  |
   | Integración de las Tecnologías de la Información en las Organizaciones    |
   | Modelado y Diseño del Software 1                                          |
   | Multiprocesadores                                                         |
   | Seguridad y cumplimiento normativo                                        |
   | Sistema de Información para las Organizaciones                            |
   | Tecnologías web                                                           |
   | Teoría de códigos y criptografía                                          |
   | Administración de bases de datos                                          |
   | Herramientas y Métodos de Ingeniería del Software                         |
   | Informática industrial y robótica                                         |
   | Ingeniería de Sistemas de Información                                     |
   | Modelado y Diseño del Software 2                                          |
   | Negocio Electrónico                                                       |
   | Periféricos e interfaces                                                  |
   | Sistemas de tiempo real                                                   |
   | Tecnologías de acceso a red                                               |
   | Tratamiento digital de imágenes                                           |
   | Administración de redes y sistemas operativos                             |
   | Almacenes de Datos                                                        |
   | Fiabilidad y Gestión de Riesgos                                           |
   | Líneas de Productos Software                                              |
   | Procesos de Ingeniería del Software 1                                     |
   | Tecnologías multimedia                                                    |
   | Análisis y planificación de las TI                                        |
   | Desarrollo Rápido de Aplicaciones                                         |
   | Gestión de la Calidad y de la Innovación Tecnológica                      |
   | Inteligencia del Negocio                                                  |
   | Procesos de Ingeniería del Software 2                                     |
   | Seguridad Informática                                                     |
   | Biologia celular                                                          |
   | Física                                                                    |
   | Matemáticas I                                                             |
   | Química general                                                           |
   | Química orgánica                                                          |
   | Biología vegetal y animal                                                 |
   | Bioquímica                                                                |
   | Genética                                                                  |
   | Matemáticas II                                                            |
   | Microbiología                                                             |
   | Botánica agrícola                                                         |
   | Fisiología vegetal                                                        |
   | Genética molecular                                                        |
   | Ingeniería bioquímica                                                     |
   | Termodinámica y cinética química aplicada                                 |
   | Biorreactores                                                             |
   | Biotecnología microbiana                                                  |
   | Ingeniería genética                                                       |
   | Inmunología                                                               |
   | Virología                                                                 |
   | Bases moleculares del desarrollo vegetal                                  |
   | Fisiología animal                                                         |
   | Metabolismo y biosíntesis de biomoléculas                                 |
   | Operaciones de separación                                                 |
   | Patología molecular de plantas                                            |
   | Técnicas instrumentales básicas                                           |
   | Bioinformática                                                            |
   | Biotecnología de los productos hortofrutículas                            |
   | Biotecnología vegetal                                                     |
   | Genómica y proteómica                                                     |
   | Procesos biotecnológicos                                                  |
   | Técnicas instrumentales avanzadas                                         |
   +---------------------------------------------------------------------------+
   
   ```

   

6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

  ```sql
  SELECT DISTINCT de.name  FROM department AS de
  INNER JOIN teacher AS te ON te.department_id = de.id
  WHERE NOT EXISTS (
      SELECT su.id FROM subject AS su
      WHERE su.teacher_id = te.id
  );
  +---------------------+
  | name                |
  +---------------------+
  | Matemáticas         |
  | Economía y Empresa  |
  | Educación           |
  | Agronomía           |
  | Química y Física    |
  +---------------------+
  ```

  