import pandas as pd
import streamlit as st
import plotly.express as px
from database import view_all_data


def read():
    result = view_all_data()
    # st.write(result)
    df = pd.DataFrame(result, columns=['Train No', 'Name', 'Type', 'Source', 'Destination','Availability'])
    with st.expander("View all Trains"):
        st.dataframe(df)
