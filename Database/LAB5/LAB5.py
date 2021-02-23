from faker import Faker as fk
import psycopg2 as db
from random import seed
from random import randint

fake = fk()
N = 50
USER="postgres"
PWD="787898"
DB="myDB"
ADDR="localhost"
PORT="5432"
TABLE_CR_CMD= '''  CREATE TABLE MUTANTS (
        ID INT PRIMARY KEY NOT NULL,
         Name TEXT NOT NULL,
         Address TEXT NOT NULL,
        Age INT NOT NULL,
        Review TEXT); '''
try:
    connection = db.connect(database=DB, user=USER,password=PWD,host=ADDR,port=PORT)
    print(">>\t Connected to database %s" %DB)
    cursor = connection.cursor()
    cursor.execute(TABLE_CR_CMD)
    for i in range(N):
        cursor.execute(" INSERT INTO MUTANTS (ID,Name,Address,Age,Review) VALUES ('" + str(
            i) + "','" + fake.name() + "','" + fake.address() + "','" + str(randint(18, 90)) + "','" +  fake.text() + "')")
        connection.commit()
        print("\t>> RECORD %d added"%i)
except Exception as ex:
    print(">> Error in connection!\t"+str(ex))
