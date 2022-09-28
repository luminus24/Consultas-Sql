
--Código para crear las tablas

CREATE TABLE "users" (
	"id" uuid PRIMARY KEY,
	"roles_id" uuid NOT NULL,
	"name" varchar NOT NULL,
	"email" varchar UNIQUE NOT NULL,
	"password" varchar NOT NULL,
	"age" integer NOT NULL
);

CREATE TABLE "courses" (
	"id" uuid PRIMARY KEY,
	"categories_id" uuid NOT NULL,
	"title" varchar NOT NULL,
	"description" varchar NOT NULL,
	"level" varchar NOT NULL,
	"teacher_info" uuid NOT NULL
);

CREATE TABLE "course_video" (
	"id" uuid PRIMARY KEY,
	"courses_id" uuid NOT NULL,
	"title" varchar NOT NULL,
	"url" varchar UNIQUE NOT NULL
);

CREATE TABLE "categories" (
	"id" uuid PRIMARY KEY,
	"name" varchar NOT NULL
);

CREATE TABLE "roles" (
	"id" uuid PRIMARY KEY,
	"name" varchar NOT NULL
);

ALTER TABLE "course_video" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("roles_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_info") REFERENCES "users" ("id");

--Código pra llenar las tablas

insert into roles (
	id,
	name
) values (
	'b62b5129-02e5-4944-9a17-a9fa8106bb16',
	'student'
),
(
	'f0536597-c5dc-4afe-bb84-9bfa63ec6d53',
	'teacher'
),
(
	'b2b7d806-6900-4db0-9533-5ef468425c36',
	'admin'
);


insert into users (
	id,
	roles_id,
	name,
	email,
	password,
	age
) values (
	'a22a9682-a7dc-4d05-99c2-7d6b4cbef4ff',
	'f0536597-c5dc-4afe-bb84-9bfa63ec6d53',
	'Gabriel Araujo',
	'gabriel@araujo.com',
	'gabriel123',
	35
),
(
	'b2b7d806-6900-4db0-9533-5ef468425c36',
	'f0536597-c5dc-4afe-bb84-9bfa63ec6d53',
	'Rafael Lopez',
	'rafael64@lopez.com',
	'rafael123',
	28
);


insert into categories (
	id,
	name
) values (
	'6407e8b3-1bc6-4570-ac12-4981c4c546d6',
	'Informatica y software'
), (
	'1cf79334-3580-4456-a2b5-92eccadf5a16',
	'Redes y seguridad'
);


insert into courses (
	id,
	categories_id,
	title,
	description,
	level,
	teacher_info
) values (
	'212dfbcf-7a73-4bc1-ab98-e18b9cfb4e5c',
	'6407e8b3-1bc6-4570-ac12-4981c4c546d6',
	'PostgreSQL Para Principiantes Desde 0',
	'PostgreSQL: Curso Básico, lo que usted necesita saber para comenzar con las bases de datos relacionales en PostgreSQL.',
	'Principiante',
	'a22a9682-a7dc-4d05-99c2-7d6b4cbef4ff'
),
(
	'e2695ba0-18cb-4b37-b1c8-2ad482653501',
	'6407e8b3-1bc6-4570-ac12-4981c4c546d6',
	'Sistemas de Auditorías en PostgreSQL',
	'Conoce los medios, herramientas y configuraciones necesarias para disponer de auditoría en bases de datos Postgres',
	'Intermedio',
	'b2b7d806-6900-4db0-9533-5ef468425c36'
);


insert into course_video (
	id,
	courses_id,
	title,
	url
) values (
	'6bb7da8c-0806-4cce-9df0-0d27df3a2600',
	'e2695ba0-18cb-4b37-b1c8-2ad482653501',
	'Auditar usando el log de PostgreSQL',
	'https://sistemas-de-auditoria-en-postgresql/auditar-usando-el-log-de-postgressql'
),
(
	'6ed572a9-e58d-4c2f-9416-b337c4fb7419',
	'e2695ba0-18cb-4b37-b1c8-2ad482653501',
	'Auditar usando triggers',
	'https://sistemas-de-auditoria-en-postgresql/auditar-usando-triggers'
);