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

def delete_table():
    col1,col2 = st.columns(2)
    with col1:
        query_result=sql_excecutor("select * from employee1")
        query_df=pd.DataFrame(query_result)
        with st.expander("Employee Table"):
            st.dataframe(query_df)
        fl_code = st.text_input("Employee Code",key="abc")    
        if st.button("Remove Employee") and fl_code:
            cur.execute("DELETE FROM employee1 WHERE ssn = '"+str(fl_code)+"'",)
            mydb.commit()
            st.info("Query Submitted")
    with col2:
        query_result1=sql_excecutor("select * from employee1")
        query_df1=pd.DataFrame(query_result1)
        with st.expander("New Employee Table"):
            st.dataframe(query_df1)