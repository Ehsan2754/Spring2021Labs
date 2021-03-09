import psycopg2;
from geopy.geocoders import Nominatim
conn = None
CMD = 'get_addr'


UPDATE = '''UPDATE address set la ={0} ,
lo = {1} 
WHERE address_id ={2};'''


try:
    print('Connecting to the PostgreSQL database...')
    conn = psycopg2.connect(
        host="localhost",
        port=5000,
        database="postgres",
        user="postgres",
        password="postgres")
    cur = conn.cursor()
    cur.callproc(CMD)
    # print(cur.fetchall())
    for item in cur.fetchall():
        geolocator = Nominatim(user_agent=item[0])
        addr = ''
        for i in item[:-1]: addr+= str(i)+" "
        addr = addr[:-1]
        location = geolocator.geocode(addr)
        if(location):
            cur.execute(UPDATE.format(location.longitude,location.latitude,item[0]))
        else:
            cur.execute(UPDATE.format(0.0,0.0,item[0]))
        if(location):print(location.longitude,location.latitude)
    conn.commit()
    cur.close()
except Exception as ex:
    print(">>ERROR:\t"+str(ex))
finally:
    if conn is not None: conn.close()
