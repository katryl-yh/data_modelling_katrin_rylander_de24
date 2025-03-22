**1. Start docker**

**2. Run docker**
First run `docker compose up -d`. 
Go into your postgres container, in this case:

```bash
docker exec -it postgres_data_modeling bash
```
Connect to database "data_modeling_course_db" as user "postgres":

```bash
psql -U postgres -d data_modeling_course_db
```

OR connect as user "postgres":

```bash
psql -U postgres
```
AND then connect to the database with:
```bash
\c data_modeling_course_db 
```

## Reference on postgres commands

This is not a complete list, but some that might be useful for reference.

### Useful psql commands

| Command                   | Description                                               |
| ------------------------- | --------------------------------------------------------- |
| `\l`                      | List all databases                                        |
| `\i <path_to_sql_script>` | To read a an SQL file                                     |
| `\c database_name`        | Connect to a specific database                            |
| `\dt`                     | List all tables in the current database                   |
| `\dt schema_name.*`       | List all tables in a schema schema_name                   |
| `\d table_name`           | Show table structure (columns, types, constraints)        |
| `\du`                     | List all users and roles                                  |
| `\conninfo`               | Show current connection info (user, database, host, port) |
| `\q`                      | Quit `psql`                                               |
| `\dn`                     | display all available schemas in selected PostgreSQL database|


### Table management (DDL)

| Command                                                       | Description                          |
| ------------------------------------------------------------- | ------------------------------------ |
| `CREATE DATABASE db_name;`                                    | Create a new database                |
| `DROP DATABASE db_name;`                                      | Delete a database (**irreversible**) |
| `ALTER DATABASE db_name RENAME TO new_name;`                  | Rename a database                    |
| `CREATE TABLE table_name (id SERIAL PRIMARY KEY, name TEXT);` | Create a new table                   |
| `DROP TABLE table_name;`                                      | Delete a table (**irreversible**)    |
| `ALTER TABLE table_name ADD COLUMN column_name TYPE;`         | Add a new column                     |
| `ALTER TABLE table_name DROP COLUMN column_name;`             | Remove a column                      |
| `ALTER TABLE table_name RENAME TO new_table_name;`            | Rename a table                       |
| `TRUNCATE TABLE table_name;`                                  | Remove all rows from a table         |

### User & role management (DCL)

| Command                                                  | Description                         |
| -------------------------------------------------------- | ----------------------------------- |
| `GRANT ALL PRIVILEGES ON DATABASE db_name TO user;`      | Grant full privileges to a user     |
| `REVOKE ALL PRIVILEGES ON DATABASE db_name FROM user;`   | Revoke privileges                   |
| `CREATE USER user_name WITH PASSWORD 'your_password';`   | Create a new user                   |
| `DROP USER user_name;`                                   | Delete a user                       |
| `ALTER USER user_name WITH SUPERUSER;`                   | Grant superuser privileges          |
| `ALTER USER user_name WITH PASSWORD 'new_password';`     | Change user password                |
| `GRANT CONNECT ON DATABASE db_name TO user_name;`        | Allow user to connect to a database |
| `GRANT USAGE ON SCHEMA public TO user_name;`             | Allow user to use public schema     |
| `GRANT ALL PRIVILEGES ON TABLE table_name TO user_name;` | Grant all privileges on a table     |

### Query data (DQL)

| Command                                                    | Description                             |
| ---------------------------------------------------------- | --------------------------------------- |
| `SELECT * FROM table_name;`                                | Select all data from a table            |
| `SELECT column1, column2 FROM table_name WHERE condition;` | Select specific columns with conditions |
| `SELECT COUNT(*) FROM table_name;`                         | Count number of rows                    |
| `SELECT DISTINCT column_name FROM table_name;`             | Select distinct values                  |
| `SELECT * FROM table_name ORDER BY column_name ASC/DESC;`  | Sort results                            |

### Updating & deleting data (DML)

| Command                                                              | Description                            |
| -------------------------------------------------------------------- | -------------------------------------- |
| `INSERT INTO table_name (column1, column2) VALUES (value1, value2);` | Insert new data                        |
| `UPDATE table_name SET column1 = value WHERE condition;`             | Update existing data                   |
| `DELETE FROM table_name WHERE condition;`                            | Delete specific rows                   |
| `DELETE FROM table_name;`                                            | Delete all rows (**use with caution**) |

---
To copy multiple .csv files from your local machine into a Docker container, you can use the docker cp command. <br>
If your container is already running, you can copy multiple .csv files like this:

`docker cp /local/path/*.csv container_name:/container/path/`

C:/Users/Katrin/Documents/github/data_modelling_katrin_rylander_de24/exercises/sql_postgres/mob_3_library/data/Member.csv


014a4a04a106:/var/lib/postgresql/data/library_data