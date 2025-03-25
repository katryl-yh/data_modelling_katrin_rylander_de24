from connect_postgres import connect_postgres
from sqlalchemy import text
from read_sql import read_sql_file
from pprint import pprint

create_users_sql = read_sql_file ("create_user.sql")

#pprint(create_users_sql)

with connect_postgres().connect() as conn:
    conn.execute(text(create_users_sql))

    conn.commit()

