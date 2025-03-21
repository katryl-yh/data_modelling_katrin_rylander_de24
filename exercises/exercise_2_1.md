# Excercise 2

## 1. Sakila

Use the same ERD from Sakila as in exercise1 task 3.

a) Is this normalized to 3NF?

**ANSWER**

<img src = "../assets/sakila_erd.png" width=1000>

Also, check the link:
https://dataedo.com/samples/html/Sakila/doc/Sakila_8/tables/inventory_3894.html


Sakila Database Evaluation:

First Normal Form (1NF):<br>
✅ The order in which data is stored does not matter.<br>
✅ Each table has a primary key, ensuring unique identification of rows.<br>
✅ All columns contain atomic (indivisible) values.<br>
✅ Each column contains values of a single type.<br>

Second Normal Form (2NF):<br>
✅ The table is in 1NF.<br>
✅ All non-key attributes are fully functionally dependent on the entire primary key.<br>

WHY?

- The HospitalDepartment, HospitalDoctor, and DepartmentDoctor tables use composite primary keys, and all non-key attributes depend on the full key.
- No column is only dependent on part of the primary key.

Third Normal Form (3NF):<br>
✅ The table is in 2NF.<br>
✅ No transitive dependencies: Non-key attributes should only depend on the primary key and not on another non-key attribute.<br>

**_Conclusion_**
Yes, the Sakila schema fulfills 3NF!
Each table is in 1NF, 2NF, and 3NF, with:

- no redundant data
- no partial dependencies
- no transitive dependencies

b) Lets zoom in to the inventory, explain how it works for tracking films in each stores.

**ANSWER**

**_Schema of the inventory Table_**

```sql
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    film_id SMALLINT UNSIGNED NOT NULL,
    store_id TINYINT UNSIGNED NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (film_id) REFERENCES film(film_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);
```

**_Columns Explanation_**

| Column       | Type          | Description                                                                    |
| ------------ | ------------- | ------------------------------------------------------------------------------ |
| inventory_id | INT (PK)      | Unique ID for each inventory record.                                           |
| film_id      | SMALLINT (FK) | Links to the film table to specify which movie this inventory item represents. |
| store_id     | TINYINT (FK)  | Links to the store table to track which store holds this film.                 |
| last_update  | TIMESTAMP     | Stores the last update time for the inventory record.                          |

#### How It Works in Film Tracking

#### **Tracking Availability Across Stores**

- Each row in the `inventory` table represents a single physical copy of a film at a specific store.
- If a film has multiple copies, each copy gets a separate row with the same `film_id` but a unique `inventory_id`.

#### **Connecting to Rental System**

- The `rental` table references `inventory_id`, meaning when a customer rents a film, the system knows exactly which copy was rented and from which store.
- Once a rental is returned, the same inventory copy becomes available for rent again.

#### **Checking Film Stock in a Store**

To find out how many copies of a film are in a store, use the following query:

```sql
SELECT COUNT(*)
FROM inventory
WHERE film_id = 10 AND store_id = 1;
```

#### Example Scenario

Suppose The Matrix (film_id = 5) has 3 copies in Store 1 and 2 copies in Store 2.<br> The inventory table would look like:

| inventory_id | film_id | store_id |
| ------------ | ------- | -------- |
| 101          | 5       | 1        |
| 102          | 5       | 1        |
| 103          | 5       | 1        |
| 104          | 5       | 2        |
| 105          | 5       | 2        |

If a customer rents inventory_id = 101, that specific copy is now rented, but the other copies are still available.

c) Do we have a way to know if a film is rented out or not?

**ANSWER**

### How the Inventory Table Works in Sakila

- The `inventory` table keeps track of all copies of films that a store owns.
- When a customer rents a film, a record is inserted into the `rental` table, linking the inventory copy to the customer.
- The `rental` table has a `return_date` column. If `return_date IS NULL`, it means the movie is still rented out.

#### Query: Find Available Copies of Any Film

```sql
SELECT inventory_id
FROM inventory
WHERE inventory_id NOT IN (
    SELECT inventory_id
    FROM rental
    WHERE return_date IS NULL
);
```

#### How This Works

- **Subquery**: Finds all inventory copies currently rented (i.e., where `return_date IS NULL`).
- **Main query**: Selects all inventory items that are not in the list of rented copies.

#### Example Scenario

Let's say `film_id = 5` exists in the `inventory` table at `store_id = 1` with these inventory records:

| inventory_id | film_id | store_id |
| ------------ | ------- | -------- |
| 100          | 5       | 1        |
| 101          | 5       | 1        |
| 102          | 5       | 1        |

Now, if a customer rents `inventory_id = 101`, the `rental` table would have:

| rental_id | inventory_id | customer_id | rental_date | return_date |
|-----------|-------------|-------------|-------------|-------------|
| 1         | 101         | 23          | 2024-03-19  | NULL        |

---

## Query Result  

Running the query:

```sql
SELECT inventory_id 
FROM inventory 
WHERE inventory_id NOT IN (
    SELECT inventory_id 
    FROM rental 
    WHERE return_date IS NULL
);
```
### Output:

| inventory_id |
|-------------|
| 100         |
| 102         |

This means copies `100` and `102` are still available, but copy `101` is rented out.

#### More Efficient Approach: Use `LEFT JOIN` Instead of `NOT IN`  

A more optimized way to get available copies is using `LEFT JOIN` and checking for `NULL` values.

```sql
SELECT i.inventory_id 
FROM inventory i
LEFT JOIN rental r 
    ON i.inventory_id = r.inventory_id 
    AND r.return_date IS NULL
WHERE r.inventory_id IS NULL;
```
### Why This is Better?  

- `NOT IN` can be slow if the `rental` table is large.  
- `LEFT JOIN` avoids performance issues with `NULL` values.  

### Final Remarks

- the queries were run on the actual Sakila DB in dBeaver and worked as described above

