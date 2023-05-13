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