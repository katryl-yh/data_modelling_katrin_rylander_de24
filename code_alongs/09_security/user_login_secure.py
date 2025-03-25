from connect_postgres import connect_postgres
from sqlalchemy import text
from pprint import pprint

username = input("Enter your username: ")
password = input("Enter your password: ")

with connect_postgres().connect() as conn:
    result = conn.execute(
        text("SELECT * FROM users WHERE username = :username AND password = :password"),
        {"username": username, "password": password}
        ).fetchall()

    #pprint(result)

    if result:
        print("\nLogin successful")
        print("Eat all ice cream you want\n")
    else: 
        print("Another failure")

# test again
# ' OR '1'='1' -- 
# password: anyhthing will do!