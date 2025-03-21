### 3. Library
Task:
- A library system have members, a way to borrow books.
- There are several libraries that have books in their inventory.
- Also keep track of authors for the books.
- Libraries can also be in different "stadsdelar" (city districts OR simply districs).

### Solution:
Here is an initial, logical ERD diagram for the library:
https://lucid.app/lucidchart/839938a4-9034-4347-8ac3-cf80b23ee55f/edit?invitationId=inv_9c3dd72d-0e65-45b5-89f4-70c2afc098ff&page=0_0#

#### Entities 

**Member** 
- **_member_id_** (PK)
- member_name
- email 
- address_id 
- library_id 

**Personal_info** 
- ***personal_number*** (PK)
- member_id (FK) 

**Address**
- ***address_id*** (PK) 
- street 
- street_number 
- district_id (FK)

**District** 
- ***district_id*** (PK) 
- district_name
- city

**Library**
- ***library_id*** (PK) 
- library_name 
- address_id (FK)

**Inventory**
- ***inventory_id*** (PK) 
- book_id (FK) 
- library_id (FK) 

**Borrowing** 
- ***borrowing_id*** (PK)
- member_id (FK) 
- inventory_id (FK) 
- borrow_date 
- return_date 

**Book** 
- ***book_id*** (PK) 
- book_title 
- loan_duration 
- ISBN 

**Author** 
- ***author_id*** (PK) 
- author_name 

**BookAuthor** 
- author_id (FK) 
- book_id (FK) 

**Category** 
- ***category_id*** (PK) 
- category_name 

**BookCategory** 
- book_id (FK) 
- category_id (FK) 

## Problem:
Library - invertory relationship:
**Scenario A**
One inventory belongs to one library, in other words only the books that are physically present in the library can be borrowed.

**Scenario B**
The libraries have a shared inventory online, which means that the members can put a reservation on a book that is physically stored in another location and this book will be delivered to their local library where they can borrow it.

How to adapt my ERD for Scenario A?

How to adapt my ERD for Scenario B?

Compare in a table advantages and disadvantages of each solution when it comes to database design.