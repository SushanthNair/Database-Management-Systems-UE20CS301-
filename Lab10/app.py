# Importing pakages
import streamlit as st
import mysql.connector

from create import create
from database import create_table
from delete import delete
from read import read
from update import update
'''
mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "123"
    )
c = mydb.cursor()
print(mydb)
c.execute("CREATE DATABASE train")
'''

def main():
    st.title("Train App(PES1UG20CS450)")
    menu = ["Add", "View", "Edit", "Remove"]
    choice = st.sidebar.selectbox("Menu", menu)

    create_table()
    if choice == "Add":
        st.subheader("Enter Dealer Details:")
        create()

    elif choice == "View":
        st.subheader("View created tasks")
        read()

    elif choice == "Edit":
        st.subheader("Update created tasks")
        update()

    elif choice == "Remove":
        st.subheader("Delete created tasks")
        delete()

    else:
        st.subheader("About tasks")


if __name__ == '__main__':
    main()