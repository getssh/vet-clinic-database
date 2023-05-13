/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2)
);

/* Alter animal table */

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

/* create owners table */

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age INTEGER
  );

/* create species table */

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
  );

  /*
  Modify animals table:
  Make sure that id is set as autoincremented PRIMARY KEY
  Remove column species
  Add column species_id which is a foreign key referencing species table
  Add column owner_id which is a foreign key referencing the owners table
  */

  ALTER TABLE animals DROP COLUMN IF EXISTS species;
  ALTER TABLE animals ADD COLUMN species_id INTEGER;
  ALTER TABLE animals ADD CONSTRAINT fk_animals_species_id FOREIGN KEY (species_id) REFERENCES species (id);
  ALTER TABLE animals ADD COLUMN owner_id INTEGER;
  ALTER TABLE animals ADD CONSTRAINT fk_animals_owner_id FOREIGN KEY (owner_id) REFERENCES owners (id);

  /*
  There is a many-to-many relationship between the tables species and vets:
  a vet can specialize in multiple species, and a species can have multiple 
  vets specialized in it.
  Create a "join table" called specializations to handle this relationship.
*/

CREATE TABLE specializations (
  species_id INTEGER REFERENCES species(id),
  vet_id INTEGER REFERENCES vets(id),
  PRIMARY KEY (species_id, vet_id)
);

/*
There is a many-to-many relationship between the tables animals and vets:
an animal can visit multiple vets and one vet can be visited by multiple animals.
Create a "join table" called visits to handle this relationship,
it should also keep track of the date of the visit.
*/

CREATE TABLE visits (
  animal_id INTEGER REFERENCES animals(id),
  vet_id INTEGER REFERENCES vets(id),
  visit_date DATE,
  PRIMARY KEY (animal_id, vet_id, visit_date)
);