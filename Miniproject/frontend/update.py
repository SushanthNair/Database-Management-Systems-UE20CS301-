import pandas as pd
import streamlit as st
import mysql

mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    database='pes1ug20cs450'
)
cur = mydb.cursor()

def sql_excecutor(raw_code):
    cur.execute(raw_code)
    data=cur.fetchall()
    return data

def update_table():
    col1,col2 = st.columns(2)
    with col1:
        pass_no = st.text_input("Passport Number")
        fname = st.text_input("First Name")
        lname = st.text_input("Last name")
        M = st.text_input("Middle name")
    with col2:
        addr = st.text_input("Address")
        phone = st.text_input("Phone")
        age = st.text_input("Age")
        sex = st.text_input("Sex")

    if st.button("Update Passenger") and pass_no:
        cur.execute('UPDATE passenger2 SET fname=%s,M=%s, lname=%s, address=%s, phone=%s,age=%s,sex=%s WHERE passportno=%s',(fname,M,lname,addr,phone,age,sex,pass_no))
        mydb.commit()
        st.info("Query Submitted")

        query_result=sql_excecutor("select * from passenger2")
        query_df=pd.DataFrame(query_result)
        st.dataframe(query_df)