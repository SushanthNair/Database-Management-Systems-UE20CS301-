# pip install mysql-connector-python
import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="123",
    database="train"
)
c = mydb.cursor()


def create_table():
    c.execute('CREATE TABLE IF NOT EXISTS TRAINS(train_no TEXT, train_name TEXT, train_type TEXT, train_source TEXT, train_dest TEXT,'
              'train_avail TEXT)')


def add_data(dealer_id, dealer_name, dealer_city, dealer_pin, dealer_street,train_avail):
    c.execute('INSERT INTO TRAINS(train_no, train_name, train_type, train_source, train_dest,train_avail) VALUES (%s,%s,%s,'
              '%s,%s,%s)',
              (dealer_id, dealer_name, dealer_city, dealer_pin, dealer_street,train_avail))
    mydb.commit()


def view_all_data():
    c.execute('SELECT * FROM TRAINS')
    data = c.fetchall()
    return data


def view_only_train_no():
    c.execute('SELECT train_no FROM TRAINS')
    data = c.fetchall()
    return data


def get_train_no(train_no):
    c.execute('SELECT * FROM TRAINS WHERE train_no="{}"'.format(train_no))
    data = c.fetchall()
    return data


def edit_train_avail(new_train_avail, train_no,):
    c.execute('UPDATE TRAINS SET train_avail=%s WHERE train_no=%s', (new_train_avail,train_no))
    mydb.commit()
    c.execute('SELECT * FROM TRAINS')
    data = c.fetchall()


def delete_data(train_no):
    c.execute('DELETE FROM TRAINS WHERE train_no="{}"'.format(train_no))
    mydb.commit()