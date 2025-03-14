# Excercise 1

## 0. Hospital example

Going back to the hospital exercise from exercise0, task 1, we will build logical and physical data models. This is the conceptual data model after we've added the composite entities to take care of many-to-many relationships.

<img src = "../assets/v2_conceptual_hospital_ex0_1.png" width=500>

a) Create a logical data model using lucidcharts

b) Identify different keys on the various entities

c) Identify child entities and parent entities. What makes them into parent/child relationships?

d) Create a physical data model using dbdiagram

e) Create a few tables manually, insert given data plus some more, and try to manually link foreign keys to primary keys. Can you satisfy that a doctor can work at several departments and several hospitals?

### Solution

a)
<img src = "../assets/v4_hospital_ex1_0.png" width=500>

b)

**Hospital**

- hospital_id PRIMARY KEY
- name
- address

**Department**

- department_id PRIMARY KEY
- name

**Doctor**

- doctor_id PRIMARY KEY
- name

**HospitalDepartment**

- hospital_id FOREIGN KEY
- department_id FOREIGN KEY

**HospitalDoctor**

- hospital_id FOREIGN KEY
- doctor_id FOREIGN KEY

**DepartmentDoctor**

- department_id FOREIGN KEY
- doctor_id FOREIGN KEY

c)

**Parent entity**

- Hospital
- Department
- Doctor

**Child entity**

- HospitalDepartment
- HospitalDoctor
- DepartmentDoctor

To define parent/child relationship follow the rules:

- Parent is an entity that is referenced by other entities.
- A child entity depends on or is associated with a parent.

d)

<img src = "../assets/hospital_ex1_0d.png" width=500>

Hospital

| hospital_id | name         | address          |
| ----------- | ------------ | ---------------- |
| 1           | Sjukhusstock | Drottninggatan 3 |
| 2           | Sjukhussoder | Sodergatan 3     |

Department

| department_id | name       |
| ------------- | ---------- |
| 1             | Kardiologi |
| 2             | Neurologi  |
| 3             | Gynekologi |

Doctor

| doctor_id | name                |
| --------- | ------------------- |
| 1         | Dr. Abra Abrahamson |
| 2         | Dr. Erika Eriksson  |
| 3         | Dr. Sven Svensson   |
| 4         | Dr. Carl Carlsson   |
| 5         | Dr. Anna Karlsson   |
| 6         | Dr. Sara Lindgren   |

HospitalDepartment

| hospital_id | department_id |
| ----------- | ------------- |
| 1           | 1             |
| 1           | 2             |
| 2           | 1             |
| 2           | 2             |
| 2           | 3             |

HospitalDoctor

| hospital_id | doctor_id |
| ----------- | --------- |
| 1           | 1         |
| 1           | 2         |
| 1           | 3         |
| 1           | 6         |
| 2           | 3         |
| 2           | 4         |
| 2           | 5         |
| 2           | 6         |

DepartmentDoctor

| department_id | doctor_id |
| ------------- | --------- |
| 1             | 1         |
| 1             | 6         |
| 2             | 2         |
| 2             | 3         |
| 2             | 4         |
| 3             | 5         |
| 3             | 6         |

e)

The current layout od my database does not allow to satisfy the condition that a doctor can work at several departments and several hospitals.
It do not get correct results when querying after join operations.
I will try to solve this problem by introducting another table:

DoctorDepartmentHospital

| doctor_id | department_id | hospital_id |
| --------- | ------------- | ----------- |
| 1         | 1             | 1           |
| 1         | 1             | 2           |
| 2         | 2             | 1           |
| 3         | 2             | 1           |
| 3         | 2             | 2           |
| 4         | 2             | 2           |
| 5         | 3             | 2           |
| 6         | 3             | 2           |
| 6         | 1             | 1           |

Advantages of DoctorDepartmentHospital Table:

**Removes Ambiguity**

- The current structure doesn’t explicitly link a doctor to a department within a specific hospital.
- This new table ensures that each doctor is assigned to a specific department within a specific hospital.

**Simplifies Queries**

- No need for multiple JOINs across different tables (HospitalDoctor, DepartmentDoctor, HospitalDepartment).
- A single table directly links doctors, departments, and hospitals.

**More Accurate Data Representation**

- Prevents errors where a doctor appears in a department but not in any hospital.
- Ensures that a doctor is linked to a department within a hospital, not just separately to both.

**Comparison: Current vs. New Approach**

| Approach                       | Pros                                            | Cons                                            |
| ------------------------------ | ----------------------------------------------- | ----------------------------------------------- |
| Current (Separate Tables)      | Easier to understand initially                  | Requires more joins, possible inconsistencies   |
| New (DoctorDepartmentHospital) | Simplifies queries, ensures clear relationships | Slightly more data redundancy but avoids errors |

## 2. Identify keys

| EmployeeID | Förnamn | Efternamn | AvdelningID | E-post                       | Telefon     |
| ---------- | ------- | --------- | ----------- | ---------------------------- | ----------- |
| 201        | Erik    | Johansson | 1           | erik.johansson@coolfirma.se  | 070-1234567 |
| 202        | Anna    | Karlsson  | 2           | anna.karlsson@coolfirma.se   | 073-2345678 |
| 203        | Johan   | Andersson | 1           | johan.andersson@coolfirma.se | 072-3456789 |
| 204        | Sara    | Lindgren  | 3           | sara.lindgren@coolfirma.se   | 076-4567890 |
| 205        | Maria   | Svensson  | 2           | maria.svensson@coolfirma.se  | 070-5678901 |

a) Which columns could be candidate keys here?

**The possible candidate keys in this table are:**

- EmployeeID (Most common choice for a primary key)
- E-post (If emails are guaranteed unique)
- Telefon (If phone numbers are guaranteed unique)

**Not possible:**

- Förnamn + Efternamn: Not unique (different people can have the same name)
- AvdelningID: Not unique (employees belong to the same department)

b) From this set of candidate keys, which one would you choose as primary key and which ones as alternate keys?

- Primary key = EmployeeID
- Alternate Key = Epost OR Telefon if I could guarantee they are unique

**Best Choice for Primary Key is EmployeeID because it is:**

- Stable: Employee IDs don’t change over time, whereas emails and phone numbers might.
- Numeric: More efficient for indexing and joins compared to strings.

Since E-post (email) and Telefon (phone) are also unique, they can be declared as alternate keys with unique constraints.

c) Is your primary key considered as natural key or surrogate key?

**EmployeeID is a Surrogate Key**
A surrogate key is an artificially created unique identifier, typically numeric and system-generated, that has no real-world meaning outside the database.

Since EmployeeID is just a number assigned to each employee and does not derive from real-world attributes (like name or email), it is a surrogate key.

d) Create another table with a primary key where one of the columns in this table could act as a foreign key.

| manager_id | AvdelningID |
| ---------- | ----------- |
| 52         | 1           |
| 12         | 2           |
| 44         | 3           |

```sql
CREATE TABLE Manager (
    manager_id SERIAL PRIMARY KEY,  -- Primary key for the manager
    AvdelningID INTEGER NOT NULL,   -- Foreign key referencing the Employee table
    FOREIGN KEY (AvdelningID) REFERENCES Employee(AvdelningID) ON DELETE CASCADE
);
```

OBS: since managers are also employees, it could be good to store manager_id as a foreign key referencing EmployeeID. 
This ensures that only existing employees can be assigned as managers.

```sql
CREATE TABLE Manager (
    manager_id INTEGER PRIMARY KEY, -- Also an EmployeeID
    AvdelningID INTEGER NOT NULL,  -- The department the manager oversees
    FOREIGN KEY (manager_id) REFERENCES Employee(EmployeeID) ON DELETE CASCADE,
    FOREIGN KEY (AvdelningID) REFERENCES Employee(AvdelningID) ON DELETE CASCADE,
    UNIQUE (AvdelningID) -- Ensures only one manager per department
);
```

## 3. Sakila exercise

In SQL course we have queried the sakila database a lot to learn various concepts such as joining, union, filtering. Now lets try to understand its data model.

<img src = "../assets/sakila_erd.png" width=1000>

Study the ERD and try to answer the following questions

a) Is this a conceptual, logical or physical ERD, motivate?
It is a logical ERD.

WHY?
- Conceptual ERD → High-level business view, no attributes.
- Logical ERD → More detailed, includes attributes, PK, FK, relationships, but no physical storage details.
- Physical ERD → Fully implementable, includes data types, constraints, and storage optimizations.

b) How many entities are in the database?

- 15 

c) Which are the composite entities?

DEFINITION:
A composite entity (also called an associative entity) is a table that connects two or more other tables in a many-to-many relationship. 
It contains foreign keys from the related tables and often has its own primary key.

The composite entities in sakilla are :
- film_category
- film_actor
- staff
- inventory
- payment
- customer


d) Try to find suitable relationship labels between entities


e) Try to write out some possible relationship statements between the entities.

1. Customer & Rental (1:M):
    - A customer can rent many films.
    - A rental is linked to exactly one customer.

Each Customer (customer_id) can have multiple Rentals (rental_id), 
but each Rental belongs to only one Customer.

2. Staff & Store (M:1):
    - A staff member works at one store.
    - A store can have multiple staff members.

Each Staff (staff_id) belongs to one Store (store_id), 
but each Store can have multiple Staff members.

3. Film & Actor (M:M)
    - A film can feature multiple actors (1:M).
    - An actor can appear in multiple films.

Each Film (film_id) can have many Actors (actor_id),
and each Actor can act in multiple Films.

4. Film & Category (M:M):
    - A film can belong to multiple categories.
    - A category can have multiple films.

Each Film (film_id) can belong to multiple Categories (category_id),
and each Category can include multiple Films.



f) Can you find if there is any errors/mistakes in this ERD?

- In Store table: manager_staff_id is a FK but there is no table where it would be a PK

- In Rental table: staff_id has no connection to the staff table
- In Rental table: customer_id has no connection to the staff table
