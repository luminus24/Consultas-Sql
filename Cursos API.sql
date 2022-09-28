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
    "user_id" uuid NOT NULL,
    "title" varchar NOT NULL,
    "description" varchar NOT NULL,
    "level" varchar NOT NULL,
    "teacher" varchar NOT NULL
);

CREATE TABLE "course_video" (
    "id" uuid PRIMARY KEY,
    "courses_id" uuid NOT NULL,
    "title" varchar NOT NULL,
    "url" varchar UNIQUE NOT NULL
);

CREATE TABLE "categories" (
    "id" uuid PRIMARY KEY,
    "course_video_id" uuid NOT NULL,
    "name" varchar NOT NULL
);

CREATE TABLE "roles" (
    "id" uuid PRIMARY KEY,
    "name" varchar NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("course_video_id") REFERENCES "course_video" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("roles_id") REFERENCES "roles" ("id");





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
)

insert into users (
	id,
	roles_id,
	name,
	email,
	password,
	age
) values (
	'a22a9682-a7dc-4d05-99c2-7d6b4cbef4ff',
	'b2b7d806-6900-4db0-9533-5ef468425c36',
	'Gabriel Araujo',
	'gabriel@araujo.com',
	'gabriel123',
	23
),
(
	'b2b7d806-6900-4db0-9533-5ef468425c36',
	'b62b5129-02e5-4944-9a17-a9fa8106bb16',
	'Rafael Lopez',
	'rafael64@lopez.com',
	'rafael123',
	18
)

insert into courses (
	id,
	user_id,
	title,
	description,
	level,
	teacher
) values (
	'212dfbcf-7a73-4bc1-ab98-e18b9cfb4e5c',
	'b2b7d806-6900-4db0-9533-5ef468425c36',
	'PostgreSQL Para Principiantes Desde 0',
	'PostgreSQL: Curso Básico, lo que usted necesita saber para comenzar con las bases de datos relacionales en PostgreSQL.',
	'Principiante',
	'Carlos Alonzo'
),
(
	'e2695ba0-18cb-4b37-b1c8-2ad482653501',
	'b2b7d806-6900-4db0-9533-5ef468425c36',
	'Sistemas de Auditorías en PostgreSQL',
	'Conoce los medios, herramientas y configuraciones necesarias para disponer de auditoría en bases de datos Postgres',
	'Intermedio',
	'Luis Fernandez'
)

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
)


insert into categories (
	id,
	course_video_id,
	name
) values (
	'6407e8b3-1bc6-4570-ac12-4981c4c546d6',
	'6bb7da8c-0806-4cce-9df0-0d27df3a2600',
	'Informatica y software'
), (
	'1cf79334-3580-4456-a2b5-92eccadf5a16',
	'6ed572a9-e58d-4c2f-9416-b337c4fb7419',
	'Informatica y software'
)