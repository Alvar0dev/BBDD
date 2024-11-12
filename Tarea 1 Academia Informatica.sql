-- EJERCICIO 1:

-- Vamos a crear las tablas para una Academia donde se imparten distintos cursos de informática. Empezaremos creando con SQL las siguientes tablas:

    -- Tabla ALUMNOS recogerá información sobre el alumnado:

 --Nombre, Apellido1, Apellido2, NIF, Dirección, Sexo, Fecha de Nacimiento 
 --y Curso en el que se matricula.

    -- Tabla CURSOS con los siguientes campos: 

--Nombre del Curso, Código del Curso que lo identifica, NIF del Profesor, 
--Máximo número de alumnos/as recomendado, Fecha de inicio, 
--Fecha final, Número de horas totales del curso. 

--Los alumnos/as no pueden compaginar varios cursos a la vez.

    -- Tabla PROFESORES con los siguientes campos: 
--Nombre, Apellido1, Apellido2, NIF, Dirección, Titulación, Salario.

-- Debes elegir los nombres más adecuados para los atributos teniendo en cuenta las reglas.
-- Debes elegir los tipos de datos adecuados en función del contenido de los campos.
-- Debes establecer las siguientes restricciones: 

-- El alumno o alumna debe matricularse en un curso antes de que se le pueda dar de alta.
-- En un curso, el número de horas es un dato que no puede faltar, 
-- es obligatorio que contenga información.
-- En la tabla PROFESORES, el atributo Salario no puede estar vacío. x

-- Dos cursos no pueden llamarse de la misma forma. x
-- Dos profesores no pueden llamarse igual. x

-- Podremos diferenciar las tuplas de la tabla CURSOS por el Código del Curso.x
-- Podremos diferenciar las tuplas de la tabla PROFESORES y ALUMNOS por el NIF.x

-- La fecha de comienzo del curso nunca puede ser menor que la fecha de finalización.x
-- El dominio del atributo sexo es M (mujer) y H (hombre).x
-- Se debe cumplir la regla de integridad referencial.x

-----------------------------------------------------------------------------------------  

-- EJERCICIO2:

-- Vamos a modificar las tablas que hemos creado en el apartado anterior:

-- Crea un nuevo atributo llamado Edad de tipo numérico a la tabla ALUMNOS. x
-- Añade las siguientes restricciones:

-- Modifica el campo que has creado anteriormente para que la edad del alumno o alumna esté comprendida entre 14 y 65 años. x
-- Modifica el campo Número de horas del CURSO de manera que solo pueda haber cursos con 30, 40 o 60 horas.
-- No podemos añadir un curso si su número máximo de alumnos es inferior a 15.
-- Elimina la restricción que controla los valores que puede tomar el atributo Sexo.
-- Elimina la columna Dirección de la tabla PROFESORES.
-- Cambia la clave primaria de la tabla PROFESORES por Nombre y Apellidos.
-- Renombra la tabla PROFESORES por TUTORES.
-- Elimina la tabla ALUMNOS.
-- Crea un usuario con tu nombre y clave BD02 y dale todos los privilegios sobre la tabla CURSOS.
-- Ahora al usuario anterior quítale permisos para modificar o actualizar la tabla CURSOS.


-- EJERCICIO 1:

CREATE TABLE ALUMNOS {

    Nombre VARCHAR(20) PRIMARY KEY,
    Apellido1 VARCHAR(20), 
    Apellido2 VARCHAR(20), 
    Nif_Alumnos VARCHAR(20), FOREING KEY REFERENCES PROFESORES (Nif_Profesor),
    Dirección VARCHAR(100), 
    Sexo CHAR(1) CONSTRAINT CK_Alumnos_Sexo (Sexo in ('H', 'M')), 
    Fecha de Nacimiento DATE , 
    IdCurso VARCHAR(10) FOREING KEY REFERENCES CURSOS (IdCurso),

    CONSTRAINT FK_ALUMNOS_IDCurso FOREING KEY 
    REFERENCES CURSOS(IdCurso)
    CONTRAINT CK_Cursos_FechaIniFin

    CONSTRAINT FK_ALUMNOS_Nif_Alumnos FOREING KEY
    REFERENCES PROFESORES (Nif_Profesor),

}

CREATE TABLE CURSOS{

    NombreCurso VARCHAR(20),
    IdCurso VARCHAR(20) PRIMARY KEY, 
    Nif_Profesor VARCHAR(20), 
    MaxAlumos NUMBER(2), 
    FechaInicio VARCHAR(20), 
    FechaFin VARCHAR(20), 
    TotalHoras VARCHAR(20) NOT NULL,
    
    UNIQUE( NombreCurso),

    CONSTRAINT CK_Cursos_FechaIniFin (FechaInicio < FechaFin),
    CONSTRAINT PK_ALUMNOS_IDCurso PRIMARY KEY,

}

CREATE TABLE PROFESORES{
    Nombre VARCHAR(20)
    , Apellido1 VARCHAR(20)
    , Apellido2 VARCHAR(20)
    , NIF VARCHAR(20) 
    , Dirección VARCHAR(100)
    , Titulación VARCHAR(20)
    , Salario VARCHAR(20) NOT NULL
    
    ,UNIQUE( Nombre, Apellido1, Apellido2)
} 

-- EJERCICIO 2

ALTER TABLE ALUMNOS
    ADD Edad NUMBER 

ALTER TABLE ALUMNOS
    MODIFY Edad CHECK Edad BEETWEEN 14 AND 65
    CONTRAINT CK ALUMNOS_Edad_14_65

ALTER TABLE CURSOS
    MODIFY TotalHoras CHECK (TotalHoras IN (30, 40 , 60)),
    MODIFY MaxAlumos CHECK (MaxAlumnos IN (>=15))


