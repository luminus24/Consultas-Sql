--Codigo para la creacion de la tabla
CREATE TABLE "tareas" (
    "id" uuid PRIMARY KEY,
    "description" varchar NOT NULL,
    "created_on" date NOT NULL,
    "status" varchar DEFAULT 'pending'
);

--Código para la creacion de las consultas
insert into tareas
(
	id,
	description,
	created_on,
	status
) values (
	'47ade6d3-106f-4345-bcc3-7f943839faaf',
	'Estudiar CSS',
	'2022-09-21',
	'pending'
),
(
	'8cc43d1e-bcac-4f77-8cac-28ff0bef3860',
	'Hacer responsiva la pagina Web',
	'2022-09-17',
	'executed'
),
(
	'72cf6380-3af9-4216-970d-24c52e83d7ce',
	'Estudiar Base de datos',
	'2022-09-22',
	'pending'
);

select * from tareas;

select description, created_on, status from tareas where status = 'executed';



