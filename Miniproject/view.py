import pandas as pd
import streamlit as st
import mysql

mydb=mysql.connector.connect(
    host='localhost',
    user='root',
    database='pes1ug20cs450'
)
cur=mydb.cursor()

def sql_excecutor(raw_code):
    cur.execute(raw_code)
    data=cur.fetchall()
    return data

def view_tables():
    airl,airp,city,cont,emp1,emp2,flight,pass1,pass2,tick=st.tabs(["Airline","Airport","City","Contains","Employee List","Job Salary","Flights","Client ids","Clients","Tickets"])

    with airl:
        st.subheader("Airline")
        query_result=sql_excecutor("select * from airline")
        query_df=pd.DataFrame(query_result)
        st.dataframe(query_df)

    with airp:
        st.subheader("Airport")
        query_result=sql_excecutor("select * from airport")
        query_df=pd.DataFrame(query_result)
        st.dataframe(query_df)
    with city:
        st.subheader("City")
        query_result=sql_excecutor("select * from city")
        query_df=pd.DataFrame(query_result)
        st.dataframe(query_df)
    with cont:
        st.subheader("Contains")
        query_result=sql_excecutor("select * from contains")
        query_df=pd.DataFrame(query_result)
        st.dataframe(query_df)
    with emp1:
        st.subheader("Employee List")
        query_result=sql_excecutor("select * from employee1")
        query_df=pd.DataFrame(query_result)
        st.dataframe(query_df)
    with emp2:
        st.subheader("Job Salary")
        query_result=sql_excecutor("select * from employee2")
        query_df=pd.DataFrame(query_result)
        st.dataframe(query_df)
    with flight:
        st.subheader("Flights")
        query_result=sql_excecutor("select * from flight")
        query_df=pd.DataFrame(query_result)
        st.dataframe(query_df)
    with pass1:
        st.subheader("Client ids")
        query_result=sql_excecutor("select * from passenger1")
        query_df=pd.DataFrame(query_result)
        st.dataframe(query_df)
    with pass2:
        st.subheader("Clients")
        query_result=sql_excecutor("select * from passenger2")
        query_df=pd.DataFrame(query_result)
        st.dataframe(query_df)
    with tick:
        st.subheader("Tickets")
        query_result=sql_excecutor("select * from ticket1")
        query_df=pd.DataFrame(query_result)
        st.dataframe(query_df)