from connect_postgres import connect_postgres
from sqlalchemy import text
from pprint import pprint

username = input("Enter your username: ")
password = input("Enter your password: ")

with connect_postgres().connect() as conn:
    result = conn.execute(
        text(
            f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'"
            )
        ).fetchall()

    #pprint(result)

    if result:
        print("\nLogin successful")
        print("Eat all ice cream you want\n")
    else: 
        print("Another failure")


# Approach 1: We know the name of the user!
# username: alice' OR '1'='1 
# password: anyhthing will do!
# 
# Approach 2: We do now know the name of the user
# ' OR '1'='1' --   we have the first part that is TRUE and we comment out the rest from AND onwards
#   


# postgres doesn't allow multiple statements, but mysql does and duckdb does
# '; DROP TABLE users;--

  