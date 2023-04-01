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

def insert_table():
    col1,col2=st.columns(2)
    with col1:
        flight_code = st.text_input("Flight Code")
        src = st.text_input("Source")
        dst = st.text_input("Destination")
        arr = st.text_input("Arrival Time")
        dep = st.text_input("Departure Time")
        
    with col2:
        status = st.text_input("Status")
        duration = st.text_input("Duration")
        flight_type = st.text_input("Flight Type")
        layover_time = st.text_input("Layover Time")
        no_stops = st.text_input("No of stops")
        airline_id = st.text_input("Airline ID")
    if st.button("Add Flight") and flight_code and src and dst and arr and dep and status and duration and flight_type and layover_time and airline_id:
            cur.execute('INSERT INTO flight(flight_code,source,destination,arrival,departure,duration,status,flighttype,layover_time,no_of_stops,airlineid) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)',(flight_code,src,dst,arr,dep,status,duration,flight_type,layover_time,no_stops,airline_id))
            mydb.commit()
            st.info("Query Submitted")
    query_result=sql_excecutor("select * from flight")
    query_df=pd.DataFrame(query_result)
    st.dataframe(query_df)