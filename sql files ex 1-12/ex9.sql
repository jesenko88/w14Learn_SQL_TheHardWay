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