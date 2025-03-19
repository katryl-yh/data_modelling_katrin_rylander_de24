# Excercise 2

## 0. Ezecream orders

Our beloved ice cream company Ezecream has a Sales table that looks like this

| order_id | order_date | customer_id | customer_name  | customer_address | product_id | product_name | quantity |
| -------- | ---------- | ----------- | -------------- | ---------------- | ---------- | ------------ | -------- |
| 101      | 2024-04-05 | 05          | Ragnar Lodbrok | Kattegatt 3      | 3          | Blåbärsmagi  | 20       |
| 101      | 2024-04-05 | 05          | Ragnar Lodbrok | Kattegatt 3      | 5          | Lakritsdröm  | 15       |
| 101      | 2024-04-05 | 05          | Ragnar Lodbrok | Kattegatt 3      | 1          | Lichipichi   | 35       |
| 105      | 2025-01-10 | 15          | Feliz Fernadu  | Madridugatan 2   | 8          | Gitlass      | 30       |
| ...      | ...        | ...         | ...            | ...              | ...        | ...          | ...      |

a) Find different problems with this table, so that Ezecream will take you in for internship to fix it for them.

**ANSWER**
We could identify the following problems:

1. data redundancy

- Definition: same values repeated across multiple rows which leads to problems with data consistency and increased storage usage.
  Example: look order 101: name + address repeated 3 times.

2. insertion anomaly

- Definition: An insertion anomaly occurs when adding a new record is impossible or requires unnecessary data (depends on the constraints in the database).
- Example:A new customer cannot be added unless they have placed an order.

3. update anomaly

- Definition: updating/modifying a value in one row leads to inconsistencies with other rows. In other words one would have to update same info in several places.
- Example: If we need update name/address of a customer that is present in several rows, we would have to manually update it in each row linked to this customer or create inconsistent data.

4. deletion anomaly

- Definition: deletion of a record leads to unintentional loss of data. In other words: you remove data you wanted to remove PLUS data that you should have kept.
- Example: If a product is only stored in the Sales table and we delete the last order for that product, we lose all knowledge of that product.

---

b1) Does this table satisfy 1NF, 2NF? Motivate.

**ANSWER**

**checklist 1NF**
✅ row order doesn't matter
✅ Primary Key (PK) exists in each table
NOTE: We assume a composite key (order_id, product_id).
However, this prevents the same customer from adding the same product to an order with a different quantity.
✅ No repeting groups  
✅ Unifor column data (atomic values, one data type per attribute)

The table satisfies 1NF: all attributes are atomic and uniquely identified by the PK.

**checklist 2NF**
✅ 1NF is satisfied
🔴 Non prime attributes must be functionally dependent on entire PK,not just part of it:

- Problem: customer_name and customer_address depend only on customer_id,
  not on the full composite key (order_id, product_id).
- Conclusion: This means partial dependency exists, so the table violates 2NF and needs normalization.

**How to check the last step:**

- Identify the Primary Key (PK): (order_id, product_id).
- Identify non-key columns (columns not in the PK).
- Check if each non-key column fully depends on the entire PK.
- If any column depends only on part of the PK, then ❌ 2NF is not satisfied.

---

b2) Normalize this table to 3NF, make conceptual diagram and relational schema notation for each relation. Relational schema notation is `RelationName(attribute1, attribute2, ...)`

**ANSWER**
We should divide the Sales table into the following entities:

**Customer**

- customer_id (PK)
- customer_name
- customer_address

**Order**

- order_id (PK)
- order_date
- customer_id (FK → Customer)

**Product**

- product_id (PK)
- product_name

**Order_Detail**

- Composite primary key (order_id, product_id), (PK)
- order_id (PK, FK → Order)
- product_id (PK, FK → Product)
- quantity

**conceptual ERD**

<img src = "../assets/ex2_0_ezecream_ERD.png">

**_Relationel schema notation_**

- Customer(customer_id, customer_name, customer_address)
- Product(product_id, product_name)
- Order(order_id, order_date, customer_id)
- Order_Detail(order_id, product_id, quantity)
  (PK: (order_id, product_id), FK: order_id → Order, product_id → Product)

---

c) Now also add price attribute. Think about what would happen when price increases or decreases.
**ANSWER**

The outcome is different, depending where we add the price attribute.
Possible solutions are:

- A: Store price in the Product table.
  Works well if prices never change.
  Problem: If prices increase or decrease, historical orders would be incorrect because they would always show the latest price instead of the original purchase price.

- B: Store price in Order_Detail.
  Best if prices change over time, as it ensures that each order keeps the price valid at the time of purchase.
  Works well for: Tracking historical sales correctly.

- C: Create a separate Price_List entity.
  Why? If you need to keep track of historical price changes separately, you can store price updates in a dedicated table.
  Implementation:
- Price_List(product_id (PK, FK → Product), price, update_date (PK))
  Stores all historical prices.
- Order_Detail(order_id, product_id, quantity, price) (stores price at purchase time)
  Advantage: This structure allows both tracking old orders correctly and keeping a history of past prices.

### NOTE:

- price in Price_List = Historical price of a product on a certain date

  | product_id | price | update_date |
  | ---------- | ----- | ----------- |
  | 3          | 10.00 | 2024-01-01  |
  | 3          | 12.50 | 2024-06-01  |
  | 5          | 8.00  | 2024-03-15  |

- price in Order_Detail = Final price at the time of purchase

  | order_id | product_id | price | quantity |
  | -------- | ---------- | ----- | -------- |
  | 101      | 3          | 10.00 | 1        |
  | 102      | 3          | 12.50 | 2        |
  | 103      | 5          | 8.00  | 4        |

---

d) Write SQL code to get the total price for Ragnar Lodbrok.
Insert data into your tables and test it out.
