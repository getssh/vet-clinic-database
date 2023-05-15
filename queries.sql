/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* First transaction: update the animals table by setting the species column to unspecified then rollback */

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Second transaction */

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

/* Thired transaction delete all records in the animals table, then roll back the transaction */

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Forth transaction */

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

/* Answering questions using query */

/* How many animals are there? */
SELECT COUNT(*) AS total_animals FROM animals;

/* How many animals have never tried to escape? */
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

/* What is the average weight of animals? */
SELECT AVG(weight_kg) AS average_weight FROM animals;

/* Who escapes the most, neutered or not neutered animals? */
SELECT neutered, COUNT(*) AS escape_count FROM animals GROUP BY neutered ORDER BY escape_count DESC;

/* What is the minimum and maximum weight of each type of animal? */
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT species, AVG(escape_attempts) AS average_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/*
  Write queries (using JOIN) to answer the following questions:
  What animals belong to Melody Pond?
  List of all animals that are pokemon (their type is Pokemon).
  List all owners and their animals, remember to include those that don't own any animal.
  How many animals are there per species?
  List all Digimon owned by Jennifer Orwell.
  List all animals owned by Dean Winchester that haven't tried to escape.
  Who owns the most animals?
*/

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

SELECT a.name
FROM animals a
JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name, a.name
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id;

SELECT s.name, COUNT(*) AS animal_count
FROM animals a
JOIN species s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name
FROM animals a
JOIN species s ON a.species_id = s.id
JOIN owners o ON a.owner_id = o.id
WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name, COUNT(a.id) AS animal_count
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY animal_count DESC
LIMIT 1;

/*
  Write queries to answer the following:
  Who was the last animal seen by William Tatcher?
  How many different animals did Stephanie Mendez see?
  List all vets and their specialties, including vets with no specialties.
  List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
  What animal has the most visits to vets?
  Who was Maisy Smith's first visit?
  Details for most recent visit: animal information, vet information, and date of visit.
  How many visits were with a vet that did not specialize in that animal's species?
  What specialty should Maisy Smith consider getting? Look for the species she gets the most.
*/

SELECT a.name AS animal_name
FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT a.id) AS animal_count
FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez';

SELECT v.name AS vet_name, s.name AS specialty_name
FROM vets v
LEFT JOIN specializations sp ON v.id = sp.vet_id
LEFT JOIN species s ON sp.species_id = s.id;

SELECT a.name AS animal_name
FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez'
  AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name AS animal_name, COUNT(v.animal_id) AS visit_count
FROM animals a
LEFT JOIN visits v ON a.id = v.animal_id
GROUP BY a.id
ORDER BY visit_count DESC
LIMIT 1;

SELECT a.name AS animal_name
FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Maisy Smith'
ORDER BY v.visit_date ASC
LIMIT 1;

SELECT V.visit_date, A.name AS animal_name, A.date_of_birth, A.escape_attempts, A.neutered, A.weight_kg,
  S.name AS species_type, O.full_name AS owner_name, E.name AS vet_name, E.age AS vet_age,
  E.date_of_graduation
  FROM visits V
  JOIN animals A ON A.id=V.animal_id
  JOIN species S ON S.id=A.species_id
  JOIN owners O ON O.id=A.owner_id
  JOIN vets E ON E.id=V.vet_id
  ORDER BY V.visit_date DESC
  LIMIT 1;

SELECT COUNT(*) AS visit_count
FROM visits v
INNER JOIN animals a ON v.animal_id = a.id
INNER JOIN vets vt ON v.vet_id = vt.id
LEFT JOIN specializations sp ON vt.id = sp.vet_id AND a.species_id = sp.species_id
WHERE sp.vet_id IS NULL;

SELECT S.name AS animal_type, COUNT(V.animal_id) AS total_visits
FROM visits V
JOIN vets E ON E.id=V.vet_id
JOIN animals A ON A.id=V.animal_id
JOIN species S ON S.id=A.species_id
WHERE E.name='Maisy Smith'
GROUP BY S.name
ORDER BY total_visits DESC LIMIT 1;
