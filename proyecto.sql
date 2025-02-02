select table_name from user_tables order by table_name;

CREATE TABLE tipoSangre (
    idTipoSangre INT PRIMARY KEY,
    tipoSangre VARCHAR2(50)
);

INSERT INTO tipoSangre VALUES (1, 'A+');
INSERT INTO tipoSangre VALUES (2, 'A-');
INSERT INTO tipoSangre VALUES (3, 'B+');
INSERT INTO tipoSangre VALUES (4, 'B-');
INSERT INTO tipoSangre VALUES (5, 'AB+');
INSERT INTO tipoSangre VALUES (6, 'AB-');
INSERT INTO tipoSangre VALUES (7, 'O+');
INSERT INTO tipoSangre VALUES (8, 'O-');


drop table habitaciones cascade constraints;


CREATE TABLE habitaciones (
    idHabitacion INT PRIMARY KEY
);

INSERT INTO habitaciones (idHabitacion, idCama) VALUES (101, 1);
INSERT INTO habitaciones (idHabitacion, idCama) VALUES (102, 2);
INSERT INTO habitaciones (idHabitacion, idCama) VALUES (103, 3);
INSERT INTO habitaciones (idHabitacion, idCama) VALUES (104, 4);
INSERT INTO habitaciones (idHabitacion, idCama) VALUES (105, 5);


CREATE TABLE medicamento (
    idMedicamento INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100),
    descripcion VARCHAR2(200)
);
INSERT INTO medicamento (nombre, descripcion) VALUES ('Paracetamol', 'Analg�sico y antipir�tico');
INSERT INTO medicamento (nombre, descripcion) VALUES ('Ibuprofeno', 'Antiinflamatorio no esteroideo');
INSERT INTO medicamento (nombre, descripcion) VALUES ('Omeprazol', 'Inhibidor de la bomba de protones');
INSERT INTO medicamento (nombre, descripcion) VALUES ('Amoxicilina', 'Antibi�tico de amplio espectro');
INSERT INTO medicamento (nombre, descripcion) VALUES ('Atorvastatina', 'Estatina para reducci�n de colesterol');

select * from medicamento;


create table enfermedad(
    idEnfermedad INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    enfermedad varchar2(80)
);

INSERT INTO enfermedad (enfermedad) VALUES ('Gripe');
INSERT INTO enfermedad (enfermedad) VALUES ('Diabetes');
INSERT INTO enfermedad (enfermedad) VALUES ('Hipertensi�n');
INSERT INTO enfermedad (enfermedad) VALUES ('Asma');

CREATE TABLE paciente (
    idPaciente INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nombres VARCHAR2(100),
    idTipoSangre INT REFERENCES tipoSangre(idTipoSangre),
    telefono VARCHAR2(20),
    idHabitacion INT REFERENCES habitaciones(idHabitacion),
    fechaNacimiento VARCHAR2(50),
    idEnfermedad INT REFERENCES enfermedad(idEnfermedad),
    horaAplicacion VARCHAR2(50),
    idMedicamento INT REFERENCES medicamento(idMedicamento)
);


select * from paciente;

INSERT INTO paciente (nombres, idTipoSangre, telefono, idHabitacion, fechaNacimiento, idEnfermedad, horaAplicacion, idMedicamento)
VALUES ('Mar�a G�mez', 2, '555-5678', 102, '1975-11-23', 1, TO_CHAR(SYSDATE, 'HH24:MI:SS'), 1);

INSERT INTO paciente (nombres, idTipoSangre, telefono, idHabitacion, fechaNacimiento, idEnfermedad, horaAplicacion, idMedicamento)
VALUES ('Carlos Mart�nez', 3, '555-8765', 103, '1990-02-05', 2, TO_CHAR(SYSDATE, 'HH24:MI:SS'), 2);


