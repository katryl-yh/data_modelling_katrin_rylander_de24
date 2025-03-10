# Excercise 0

## 0. Convert a table data into json data

You have an SQL table that looks like this

```sql
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employees VALUES (1, 'Hakan', 'Hakansson', 'HR', 30000);
INSERT INTO Employees VALUES (2, 'Bob', 'Bobson', 'IT', 35000);
```

a) Start with writing out the table with the data

b) Convert this into semi-structured JSON format. Do it manually not programmatically.

### Solution

a)

| employee_id | first_name | last_name | department | salary |
| ----------- | ---------- | --------- | ---------- | ------ |
| 1           | Hakan      | Hakansson | HR         | 30000  |
| 2           | Bob        | Bobson    | IT         | 35000  |

b)

```json
{
  "Employees": [
    {
      "employee_id": 1,
      "first_name": "Hakan",
      "address": "Hakansson",
      "department": "HR",
      "salary": 30000
    },
    {
      "employee_id": 2,
      "first_name": "Bob",
      "address": "Bobson",
      "department": "IT",
      "salary": 35000
    }
  ]
}
```

## 1. Convert json-file to tables - HOSPITAL TASK

You have this json data, convert it into three tables: Hospital, Department and Doctor. Fill these tables with data. Do this manually and not programmatically.

```json
{
  "hospital": "Sjukhusstock",
  "address": "Drottninggatan 3, Stockholm",
  "departments": [
    {
      "name": "Kardiologi",
      "doctors": [
        { "id": 1, "name": "Dr. Abra Abrahamson" },
        { "id": 2, "name": "Dr. Erika Eriksson" }
      ]
    },
    {
      "name": "Neurologi",
      "doctors": [{ "id": 3, "name": "Dr. Sven Svensson" }]
    }
  ]
}
```

### Solution

Approach

- identify entities
- identify relationships and cardinalities
- create conceptual ERD
- create tables

**Initial naive conceptual ERD**

<img src = "../assets/initial_conceptual_model_ex0_task1.png" width=300>

&nbsp;

**Initial tables**

Hospital

| hospital_id | name         | address          |
| ----------- | ------------ | ---------------- |
| 1           | Sjukhusstock | Drottninggatan 3 |

Department

| department_id | name       |
| ------------- | ---------- |
| 1             | Kardiologi |
| 2             | Neurologi  |

Doctor

| doctor_id | name                |
| --------- | ------------------- |
| 1         | Dr. Abra Abrahamson |
| 2         | Dr. Erika Eriksson  |
| 3         | Dr. Sven Svensson   |

**Refined conceptual ERD with composite entities to reflect many-to-many relationships**

<img src = "../assets/v2_conceptual_hospital_ex0_1.png" width=500>

---

HospitalDepartment

| hospital_department_id | hospital_id | department_id |
| ---------------------- | ----------- | ------------- |
| 1                      | 1           | 1             |
| 2                      | 1           | 2             |

HospitalDoctor

| hospital_doctor_id | hospital_id | doctor_id |
| ------------------ | ----------- | --------- |
| 1                  | 1           | 1         |
| 2                  | 1           | 2         |
| 3                  | 1           | 3         |

DepartmentDoctor

| department_doctor_id | department_id | doctor_id |
| -------------------- | ------------- | --------- |
| 1                    | 1             | 1         |
| 2                    | 1             | 2         |
| 3                    | 2             | 3         |

Test a join:
I want info on Sjukhusstock and its departments

- hospital_department can join with department table on department_id and hospital table on hospital_id
- query name from hospital table and name from department table

```sql
SELECT h.name AS hospital_name, d.name AS department_name
FROM main.Department d
INNER JOIN main.HospitalDepartment hd
    ON d.department_id = hd.department_id
INNER JOIN main.Hospital h
    ON h.hospital_id = hd.hospital_id
WHERE h.name = 'Sjukhusstock';
```

---

## 2. Library Bookly

A library called Bookly keeps track of books and members who borrow them. Each book has a title, author, and ISBN number. Each member has a membership ID, name, and contact information. A member can borrow multiple books, but each book can be borrowed by only one member at a time.

a) Identify the entities and attributes for each entity.

b) Determine the relationship between member and books.

c) Draw a conceptual ERD using crow foots notation.

### Solution

a) Entities:

**Book**

- ISBN
- title
- author
- availability

> [!NOTE]
> ISBN is a unique number for a book, which could be used as a `primary key`, this will make it into a `natural key`

**Member**

- membership_id
- first_name
- last_name
- phone
- adress
- email

**Borrowing**

- borrowing_ID (Primary Key)
- ISBN (Foreign Key)
- membership_id (Foreigh Key)
- borrow_date
- return_date
-

b) Relationship between entities

- A Member cah have zero, one or several Borrowings
- A Borrowing can be made by one and only one Member
- A Borrowing is linked to one and only one Book
- A Book can be in zero, one or more Borrowings over time

c)

Initial conceptual ERD
<img src = "../assets/bookly_ex0_2_1.png" width=500>

<br>

Replaced many-to-many waith a bridge table (composite entity)
<img src = "../assets/bookly_ex0_2_2.png" width=500>

## 3. Conceptual ERD to words

This is an ERD conceptual diagram that a database designer and the business stakeholders agreed upon in a car rental company called Carent.

<img src = "../assets/car_rental.png" width=500>

a) Describe the entities in this conceptual ERD.

b) Write out the relationship labels.

c) Describe the relationships between the entities (one-to-many, one-to-one and many-to-many).

d) Define the relationship statement for example: "A Customer can have one or more Rentals".

### Solution

a)

- Customer is a person that can make rentals for cars.

- Car is the cars that can be rented by a person/customer

- Rental (composite entity) is a transaction between customers and cars.

Alternative to put in descriptions into the entities directly in conceptual ERD

<img src = "../assets/v2_alternative_car_rental.png" width=500>

b) See image above

c)

- Customer to Rental (one-to-many)
- Rental to Customer (many-to-one)
- Rental to Car (many-to-one)
- Car to Rental (one-to-many)

d)

- Customer can have one or more Rentals over time
- Each rental is connected to one Customer
- Each Rental is for one Car
- Each Car can be in several Rentals

## 4. Online store

You are designing a database for an online store that sells multiple products. Customers can place multiple orders, and each order contains multiple products.

a) Identify entities and their relationships

b) Create a conceptual ERD with cardinalities

Table Representation:

- 1 Customer → M Orders (1:M)
- 1 Order → M Products (1:M via Order_Product)
- 1 Product → M Orders (1:M via Order_Product)

### Solution

a)
Entities:

- Customer: Stores customer details.
- Order: Represents a purchase made by a customer.
- Product: Represents items available for sale.
- Order_Item: A bridge entity that connects orders and products (since an order can contain multiple products, and a product can be part of multiple orders).
- Category (Optional): If products are categorized (e.g., Electronics, Clothing).

**Customer**

- customer_id (Primary Key)
- first_name
- last_name
- email
- phone
- adress

**Product**

- product_id (Primary Key)
- name
- price
- stock_quantity

**Order**

- order_ID (Primary Key)
- customer_id (Foreign Key)
- order_date
- total_amount
- payment_status e.g., 'Paid', 'Pending', 'Failed'
- shipping_date
- order_status e.g., 'Processing', 'Shipped', 'Delivered', 'Cancelled'

**Order_Product (Bridge Table)**

- order_product_ID (Primary Key)
- order_ID (Foreign Key)
- product_id (Foreign Key)
- quantity

Relationships:

- A customer can place multiple orders (One-to-Many).
- An order belongs to one customer but contains multiple products (Many-to-Many), which is resolved using Order_Product.
- A product can be part of many orders (One-to-Many).
- An order can have multiple products, and a product can be in multiple orders, we need a many-to-many (Many-to-Many) relationship table.

FROM FK:
- Customer can place one or more Orders
- Order contains one or more Products
- Therefore we need Order_Line as composite entity
- Product belongs to one and only Category
- Category can have one or more products
- Order has one and only Payment
- Order has one and only Shipping

b)
Conceptual ERD with cardinalities
TODO: fix ERD
<img src = "../assets/updated_exercise_4_v3.png" width=500>

## 5. University management system

A university needs a system to manage students, courses, and professors:

- each student can enroll in multiple courses.
- each course is taught by one professor.
- a teacher can teach multiple courses.

a) Identify entities and their relationships

b) Come up with possible attributes for the entities

c) Draw conceptual ERD with cardinalities

d) Define business rules (e.g. a student can enroll in max 4 courses)

### Solution

a)
**Entities:**

- Student: Represents students enrolled in the university.
- Course: Represents the courses offered.
- Professor: Represents the faculty members.
- Enrollment: A bridge entity to handle the many-to-many relationship between Student and Course.

**Relationships and cardinalities:**

Student (1) ⟶ (M) Enrollment (M) ⟵ (1) Course

- A student can enroll in multiple courses.
- A course can have multiple students.

Professor (1) ⟶ (M) Course

- A professor can teach multiple courses
- Each course is assigned to one professor.

Department (1) ⟶ (M) Professor

- A department can have multiple professors
- A professor belongs to one department.

b)
**Student**

- student_id (PK) , university-issued number
- first_name
- last_name
- personal_number, based on the national ID
- email
- program (Degree program, e.g., Computer Science)
- status e.g. active, paused, resigned

**Course**

- course_id (PK)
- name
- credits
- professor_id (FK → Professor)

**Professor**

- professor_id (PK)
- name
- email
- department_id (FK → Department)

**Department**

- department_id (PK)
- name

**Enrollment**

- enrollment_id (PK)
- student_id (FK → Student)
- course_id (FK → Course)
- enrollment_date
- grade

c)
Conceptual ERD with cardinalities

<img src = "../assets/uni_management_system.png" width=500>

d)

**Business Rules**

- A student can enroll in a maximum of 4 courses per semester.
- A professor can teach up to 3 courses per semester.
- A course can have a maximum of 50 students enrolled.
- A student cannot enroll in the same course more than once during the same semester.
- A department must have at least one professor.

<img src = "../assets/university_ex0_5.png" width=500>

## 6. Onshop

An e-commerce platform Onshop manages customers, orders, and products.

- a customer can place multiple orders.
- each order contains multiple products.
- a product can belong to multiple categories.

a) Identify key entities and their attributes (e.g., customer_name, order_date)

b) Sketch the conceptual ERD.

c) Define business rules

### Solution

a)

**Key Entities and Attributes**

**Customer**

- customer_id (PK)
- first_name
- last_name
- email
- phone
- address
- registration_date

**Product**

- product_id (PK)
- name
- description
- price
- stock_quantity

**Category**

- category_id (PK)
- name

**Product_Category** (Bridge Table for Many-to-Many relationship between Product & Category)

- product_id (FK → Product)
- category_id (FK → Category)

**Order**

- order_id (PK)
- customer_id (FK → Customer)
- order_date
- total_amount
- status (e.g., Pending, Shipped, Delivered, Cancelled)
- payment_status (Paid, Unpaid)
- shipping_date

**Order_Item** (Bridge Table for Many-to-Many between Order & Product)

- order_item_id (PK)
- order_id (FK → Order)
- product_id (FK → Product)
- quantity
- subtotal

b)

**Conceptual ERD with Cardinalities**

- Customer (1) ⟶ (M) Order
  A customer can place multiple orders, but an order belongs to only one customer.

- Order (1) ⟶ (M) Order_Item (M) ⟵ (1) Product
  An order can have multiple products, and a product can be part of multiple orders.

- Product (1) ⟶ (M) Product_Category (M) ⟵ (1) Category
  A product can belong to multiple categories, and a category can contain multiple products.

<img src = "../assets/onshop_ex0_6.png" width=500>

c)
**Business Rules**

- A customer can place multiple orders
- A customer cannot place an order if their cart is empty (cannot place an order without at least one product).
- A product can belong to multiple categories (e.g., "Electronics" & "Accessories").
- An order can only be placed if all products in the cart are in stock.
- Stock quantity is updated when an order is placed.
- Payment must be completed before an order can be shipped.
- A product is listed under each category it belongs to.
