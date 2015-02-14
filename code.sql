
/* ex2 */
create table person (
    id integer primary key,
    first_name text,
    last_name text,
    age integer
);

create table person_pet (
    person_id integer,
    pet_id integer
);

create table pet (
    id integer primary key,
    name text,
    breed text,
    age integer,
    dead integer
);

/* ex3 */
insert into person (id, first_name, last_name, age)
	values (0, "Edib", "Shaw", 37);
insert into person (id, first_name, last_name, age)
	values (1, "Jesenko", "Gavric", 26);
insert into person (id, first_name, last_name, age)
	values (2, "Gordan", "Sajevic", 22);
insert into person (id, first_name, last_name, age)
	values (3, "Nedzad", "Hamzic", 26);

insert into pet (id, name, breed, age, dead)
	values(0, "Rex", "Dog", 14, 0);
insert into pet values(1, "Kitty", "Cat", 1, 1);
insert into pet values(2, "Flek", "Dog", 2, 0);
insert into pet values(3, "Max", "Dog", 5, 0);


/* ex4 */
insert into person_pet (person_id, pet_id) values (1, 0);
insert into person_pet values (1, 1);

/* ex5 */
select * from person;
select name, age from pet;
select name, age from pet where dead = 0;
select * from person where first_name != "Edib";


select * from pet where age > 10;
select * from person where age < 26;
select * from person where age > 25 or age < 35;

/* ex6 */

select pet.id, pet.name, pet.age, pet.dead
from pet, person_pet, person
where
pet.id = person_pet.pet_id and
person_pet.person_id = person.id and
person.first_name = "Jesenko";

select pet.id, pet.name, pet.age, pet.dead
from pet, person_pet, person
where
pet.id = person_pet.pet_id and
person_pet.person_id = person.id and
person.id = 3;

/* ex7*/
select name, age from pet where dead = 1;
delete from pet where dead = 1;
select * from pet;
insert into pet values(1, "Kitty", "Cat", 1, 0);
select * from pet;

/*extra credit*/
/* delete pets and add them again with new values */
delete from pet where id=0;
insert into pet values(0, "Rex", "Dog", 14, 0);
delete from pet where id=3;
insert into pet values(3, "MaX", "Dog", 14, 1);

/* ex8 DELETING
delete from pet where id in(
	select pet.id
	from pet, person_pet, person
	where
	person.id = person_pet.person_id and
	pet.id = person_pet.pet_id and
	person.first_name = "Jesenko"
);

select * from pet;
select * from person_pet;

delete from person_pet
	where pet_id not in (
		select id from pet
	);
select * from person_pet;  */

/* ex9 */
update person set last_name = "Imamovic"
	where first_name = "Edib";
update pet set name = "Bleki" 
	where id = 3;
select * from person;
select * from pet;

/* ex9 extra credit change name again by id */
update person set first_name = "Macic"
	where id = 0;

select * from person;

/* change names to everey dead animala */
update pet set name = "DECEASED"
	where dead = 1;

select * from pet;

/*ex10*/
select * from pet;

update pet set name = "Jesenko's pet" where id in(
	select pet.id
	from pet, person_pet, person
	where
	person.id = person_pet.person_id and
	pet.id = person_pet.pet_id and
	person.first_name = "Jesenko"
);

select * from pet;

/* extra credit */
/* adding dead animals and relating to owner*/
insert into pet values(4, "Simba", "Dog", 4, 1);
insert into pet values(5, "Rea", "Dog", 7, 1);
insert into person_pet values(1, 4);
insert into person_pet values(1, 5);

update pet set name = "Jesenko's dead Pet"
	where id in(
		select pet.id
		from pet, person_pet, person
		where
		person.id = person_pet.person_id and
		pet.id = person_pet.pet_id and
		pet.dead = 1
		);
select * from pet;

/* ex12 

drop table if exists syntax;
 adding height and weight columns 
alter table person add column height integer;
alter table person add column weight integer;
*/