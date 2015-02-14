drop table if exists person;

create table person(
id integer primary key,
first_name text,
last_name text
age integer
);

alter table person rename to people;

alter table people add column hatred integer;

alter table people rename to person;

.schema person

drop table person;