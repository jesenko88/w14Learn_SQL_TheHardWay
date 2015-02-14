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
insert into person_pet values(1, 4);

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