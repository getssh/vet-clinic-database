/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23),
       ('Gabumon', '2018-11-15', 2, TRUE, 8),
       ('Pikachu', '2021-01-07', 1, FALSE, 15.04),
       ('Devimon', '2017-05-12', 5, TRUE, 11);

/* Add more data to animals table */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, FALSE, -11.0),
       ('Plantmon', '2021-11-15', 2, TRUE, -5.7),
       ('Squirtle', '1993-04-02', 3, FALSE, -12.13),
       ('Angemon', '2005-06-12', 1, TRUE, -45.0),
       ('Boarmon', '2005-06-07', 7, TRUE, 20.4),
       ('Blossom', '1998-10-13', 3, TRUE, 17.0),
       ('Ditto', '2022-05-14', 4, TRUE, 22.0);

/*
  Insert the following data into the owners table:
  Sam Smith 34 years old.
  Jennifer Orwell 19 years old.
  Bob 45 years old.
  Melody Pond 77 years old.
  Dean Winchester 14 years old.
  Jodie Whittaker 38 years old.
*/

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

/*
  Insert the following data into the species table:
  Pokemon
  Digimon
*/

INSERT INTO species (name)
VALUES ('Pokemon'),
       ('Digimon');

/*
  Modify your inserted animals so it includes the species_id value:
  If the name ends in "mon" it will be Digimon
  All other animals are Pokemon
*/

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE name NOT LIKE '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

/*
  Modify your inserted animals to include owner information (owner_id):
  Sam Smith owns Agumon.
  Jennifer Orwell owns Gabumon and Pikachu.
  Bob owns Devimon and Plantmon.
  Melody Pond owns Charmander, Squirtle, and Blossom.
  Dean Winchester owns Angemon and Boarmon.
*/

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');

/*
  Insert the following data for vets:
  Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
  Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
  Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
  Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
*/

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Jack Harkness', 38, '2008-06-08');

/*
  Insert the following data for specialties:
  Vet William Tatcher is specialized in Pokemon.
  Vet Stephanie Mendez is specialized in Digimon and Pokemon.
  Vet Jack Harkness is specialized in Digimon.
*/

INSERT INTO specializations (species_id, vet_id)
VALUES ((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'William Tatcher'));

INSERT INTO specializations (species_id, vet_id)
VALUES ((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'));

INSERT INTO specializations (species_id, vet_id)
VALUES ((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'));

INSERT INTO specializations (species_id, vet_id)
VALUES ((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'));

/*
  Insert the following data for visits:
  Agumon visited William Tatcher on May 24th, 2020.
  Agumon visited Stephanie Mendez on Jul 22th, 2020.
  Gabumon visited Jack Harkness on Feb 2nd, 2021.
  Pikachu visited Maisy Smith on Jan 5th, 2020.
  Pikachu visited Maisy Smith on Mar 8th, 2020.
  Pikachu visited Maisy Smith on May 14th, 2020.
  Devimon visited Stephanie Mendez on May 4th, 2021.
  Charmander visited Jack Harkness on Feb 24th, 2021.
  Plantmon visited Maisy Smith on Dec 21st, 2019.
  Plantmon visited William Tatcher on Aug 10th, 2020.
  Plantmon visited Maisy Smith on Apr 7th, 2021.
  Squirtle visited Stephanie Mendez on Sep 29th, 2019.
  Angemon visited Jack Harkness on Oct 3rd, 2020.
  Angemon visited Jack Harkness on Nov 4th, 2020.
  Boarmon visited Maisy Smith on Jan 24th, 2019.
  Boarmon visited Maisy Smith on May 15th, 2019.
  Boarmon visited Maisy Smith on Feb 27th, 2020.
  Boarmon visited Maisy Smith on Aug 3rd, 2020.
  Blossom visited Stephanie Mendez on May 24th, 2020.
  Blossom visited William Tatcher on Jan 11th, 2021.
*/

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24');

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');
