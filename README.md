# 📗 Table of Contents

- [� Table of Contents](#-table-of-contents)
- [vet-clinic-database ](#vet-clinic-database-)
  - [🛠 Built With ](#-built-with-)
  - [💻 Getting Started ](#-getting-started-)
  - [👥 Author(s) ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<div align="center"><hr width="250px"/></div>

# vet-clinic-database <a name="about-project"></a>

**vet-clinic-database** is a database which is reletional database created with postgreSQL. It create animal database and store the data in diffrent tables and fetch the data when required with the necessary queries.


## 🛠 Built With <a name="built-with"></a>

- ### Tech Stack <a name="tech-stack"></a>

  <ul>
    <li>
      PostgreSQL
    </li>
  </ul>

<!-- Features -->

- ### Key Features <a name="key-features"></a>
- **[Create animals database]**
- **[Create Table with animal data]**
- **[Get data from the database]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO

## 🚀 Live Demo <a name="live-demo"></a>

> Add a link to your deployed project.

- [Live Demo Link](<replace-with-your-deployment-URL>)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
-->
<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy of this project up and running, follow these steps.

- ### Prerequisites

   - You need to have `PostgreSQL` installed, you can follow the [PostgreSQL Tutorial](https://www.postgresqltutorial.com/) to install it on your machine.


- ### Setup
    Clone this repository to your desired folder:
    ```sh
    git clone https://github.com/getssh/vet-clinic-database
    cd vet-clinic-database
    ```
- ### Run
    Start your `PostgreSQL` CLI:
    ```sh
    psql postgres
    ```
    `PostgreSQL` will show the `prompt`:
    ```postgresql
    postgres=#
    ```
    Now you can start typing `SQL` sentences. Happy querying!
- ### Usage
  This repository includes files with plain SQL that can be used to recreate a database:
  - Use [schema.sql](./schema.sql) to create all tables.
    ```sql
    CREATE DATABASE vet_clinic;
    ```
    ```sql
    CREATE TABLE animals (
      id INT GENERATED ALWAYS AS IDENTITY,
      name VARCHAR(50),
      date_of_birth DATE,
      escape_attempts INT,
      neutered BOOLEAN,
      weight_kg DECIMAL,
      PRIMARY KEY(id)
    );
    ```
  - Use [data.sql](./data.sql) to populate tables with sample data.
    ```sql
    INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
      VALUES ('Agumon', '02/03/2020', 0, true, 10.23);
    ```
  - Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database.
    ```sql
    SELECT * from animals WHERE name LIKE '%mon';
    ```
    ⚠️ _*Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!*_

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Author(s) <a name="authors"></a>

👨‍💻 **Getayawkal Tamrat**

- GitHub: [@getssh](https://github.com/getssh)
- Twitter: [@GetayawkalT](https://twitter.com/GetayawkalT)
- LinkedIn: [@getayawkal-tamrat](https://www.linkedin.com/in/getayawkal-tamrat/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Add more data to the database**
- [ ] **Write complex schema and quires**
- [ ] **Work with multiple tables**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, typos, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/getssh/vet-clinic-database/issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like the project please give it a start

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- I would like to thank my mentors and follow students and coding partners

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional)

## ❓ FAQ <a name="faq"></a>

> Add at least 2 questions new developers would ask when they decide to use your project.

- **[Question_1]**

  - [Answer_1]

- **[Question_2]**

  - [Answer_2]

<p align="right">(<a href="#readme-top">back to top</a>)</p>
-->
<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>