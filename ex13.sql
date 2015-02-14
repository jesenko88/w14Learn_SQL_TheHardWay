/* adding new columns */
ALTER TABLE person add column dead INTEGER;
ALTER TABLE person add column phone_number TEXT;
ALTER TABLE person add column salary FLOAT;
ALTER TABLE person add column dob DATETIME;

ALTER TABLE person_pet add column purchased_on DATETIME;

ALTER TABLE pet add column dob DATE;
ALTER TABLE pet add column parent INTEGER;

/* adding some people and animals*/
insert into pet values (6, "Rock", "Dog", 4, 0, '2008-08-12', 8);
insert into pet values (7, "Blue", "Dog", 2, 0, '2003-11-02', 8);
insert into pet values (8, "Daddy", "Dog", 11, 0, '2007-04-12',null);
insert into pet values (9, "Hart", "Dog", 9, 0, '2008-05-07', 6);

insert into person values (4, "Haris", "Arifovic", "23", 0, "335-845", 1100, '1992-12-23' );
insert into person values (5, "Emir", "Imamovic", "24", 0, "777-845", 1200, '1994-08-12' );
insert into person values (6, "Amra", "Poprzanovic", "55", 0, "222-772", 950, '1995-08-21' );
insert into person values (7, "Emina", "Muratovic", "55", 0, "111-845", 890, '1991-08-12' );

/* updating database */
/* addiing relations */
insert into person_pet values (4, 8, '2009-01-02');
insert into person_pet values (4, 6, '2011-01-12');
insert into person_pet values (5, 7, '2013-07-02');
insert into person_pet values (6, 9, '2014-05-09');

select * from pet;
select * from person_pet;

/* ex13 find names of pets and owners bought before 2014 */
select pet.name, person.first_name
from pet, person_pet, person
where pet.id = person_pet.pet_id and
person_pet.person_id = person.id and
person_pet.purchased_on < '2014%'
;

/* the same with inner join 
 select pet.name, person.first_name from pet
 inner join person_pet on pet.id = person_pet.pet_id
 inner join person on person_pet.person_id = person.id
 where person_pet.purchased_on < '2014%'
 ; */

/* find a pet that is a child of a given pet */
select pet.name as child
from pet where pet.parent = 8;
;




