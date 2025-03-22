### 3. Library

Task:
An album store has this long table in excel

| Album                     | Artist          | Artist Country | Label            | Length | Format  | Price  | Certified Sales | RIAA Certification |
| ------------------------- | --------------- | -------------- | ---------------- | ------ | ------- | ------ | --------------- | ------------------ |
| Thriller                  | Michael Jackson | USA            | Epic Records     | 42:19  | Vinyl   | $25.99 | 34M             | Diamond            |
| Back in Black             | AC/DC           | Australia      | Atlantic Records | 42:11  | CD      | $19.99 | 25M             | Diamond            |
| The Dark Side of the Moon | Pink Floyd      | UK             | Harvest Records  | 43:00  | Vinyl   | $22.99 | 20M             | Diamond            |
| Abbey Road                | The Beatles     | UK             | Apple Records    | 47:03  | Vinyl   | $24.99 | 12M             | Multi-Platinum     |
| 1989                      | Taylor Swift    | USA            | Big Machine      | 48:41  | Digital | $14.99 | 10M             | Diamond            |

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