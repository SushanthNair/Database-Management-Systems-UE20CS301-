import streamlit as st
import pandas as pd
import mysql.connector

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

def Excecute_query():

    with st.form(key='query_form'):
        raw_code=st.text_area("Sql code here")
        submit_code=st.form_submit_button("Excecute code")


    if submit_code:
        st.info("Query Submitted")
        st.code(raw_code)

        #result 
        query_result=sql_excecutor(raw_code)
        with st.expander("Table"):
            query_df=pd.DataFrame(query_result)
            st.dataframe(query_df)




    # else:
    #     st.subheader("About")


# if __name__=='__main__':
#     Excecute_query()