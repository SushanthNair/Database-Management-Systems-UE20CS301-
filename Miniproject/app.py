import streamlit as st
from query import Excecute_query
import mysql.connector
from view import view_tables
from insert import insert_table
from delete import delete_table
from update import update_table
mydb=mysql.connector.connect(
    host='localhost',
    user='root',
    database='pes1ug20cs450'
)


def main():
    st.title("Airport Database")
    tb,ins,upd,dele,eq = st.tabs(["Read Tables","Insert into Flight Schedule","Update Passenger Details","Delete Employees","Execute Query",])

    with tb:
        st.subheader("Tables")
        view_tables()
    with ins:
        st.subheader("Insert")
        insert_table()
    with upd:
        st.subheader("Update")
        update_table()
    with dele:
        st.subheader("Delete")
        delete_table()
    with eq:
        st.subheader("Execute Query")
        Excecute_query()
if __name__ == '__main__':
    main()