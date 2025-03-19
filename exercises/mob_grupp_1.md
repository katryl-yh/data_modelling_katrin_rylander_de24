# Excercise mobb 

## 0. Album

An album store has this long table in excel.

<img src = "../assets/mobb_task1
.png" width=1000>

a) Find out problems with this table 

1) data redundancy 
You will get redundancy data if one artist releases more albums. 
Definition: same values repeated across multiple rows. Problems, consistency issues, increased storage usage 

2) deletion anomaly
 - definiion: deletion of a records leads to unintentional loss of data. In other you remove data you wanted to remove PLUS data that you should have kept.
 - Example: if we remove row with Abbey Road, and there is no other album by The Beatles , then we lose info about this artist.

3) Insertion anomaly 
- definition: iserting data is not possible because values on attributes are misssing (depends on the constraints an the DB).
- Example: adding a new artist without an album
Definition:  modifying data can result in inconsistencies

4) Update  anomaly 

b) Normalize this table into 3NF

Business rule: 
- in our DB we have only certified albums, there are no albums that are stored without certificaion


