import os
import psycopg2
from dotenv import load_dotenv
import pandas as pd


# Load environnement varaible from .env file
load_dotenv()
DATABASE = os.getenv("DATABASE")
PASSWORD = os.getenv("PASSWORD")


# Create connection objects
print(f"Connection to Database: {DATABASE}")
try:
    conn = psycopg2.connect(database=DATABASE, host="localhost", user="postgres", password=PASSWORD, port=5432)
except psycopg2.Error as e:
    print(f"Could not connect to Database: {e}")
else:
    print(f"Connection to Databse {DATABASE} was successful!")
    
# Create a Cursor objet
cursor = conn.cursor()

# Create tables
with open("create_tables.sql", "r") as f:
    tables = f.read()
cursor.execute(tables)
print("Tables created")

# Insert data
def insert_data_into_table(file_path, table_name):
    with open(file_path, "r") as f:
        next(f) # ignorer headers
        cursor.copy_from(f, table_name, sep=",")
        
insert_data_into_table("data_company/DimDate.csv", "dimdate")
insert_data_into_table("data_company/DimStation.csv", "dimstation")
insert_data_into_table("data_company/DimTruck.csv", "dimtruck")
insert_data_into_table("data_company/FactTrips.csv", "facttrips")

# Verify 
def verify_table_data(table_name):
    sql_statement = f"SELECT * FROM {table_name} LIMIT 3"
    cursor.execute(sql_statement)
    result = cursor.fetchall()
    print(f"\n{sql_statement}:")
    for row in result:
        print(row)

verify_table_data("dimdate")
verify_table_data("dimstation")
verify_table_data("dimtruck")
verify_table_data("facttrips")


# Create quaries grouping
def get_grouping_data(sql_statement):
    cursor.execute(sql_statement)
    return pd.DataFrame(cursor.fetchall()) 

sql_grouping_sets = open("grouping.sql", "r").read()
sql_rollup = open("rollup.sql", "r").read()
sql_cube = open("cube.sql", "r").read()

groupingset_data = get_grouping_data(sql_grouping_sets)
rollup_data = get_grouping_data(sql_rollup)
cube_data = get_grouping_data(sql_cube)

print(groupingset_data.head())
print(cube_data.head())

# Free ressources
cursor.close()
conn.close()