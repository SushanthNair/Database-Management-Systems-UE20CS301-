import datetime

import pandas as pd
import streamlit as st
from database import *


def update():
    result = view_all_data()
    # st.write(result)
    df = pd.DataFrame(result, columns=['Train No', 'Name', 'Type', 'Source', 'Destination','Availability'])
    with st.expander("Current Trains"):
        st.dataframe(df)
    list_of_trains = [i[0] for i in view_only_train_no()]
    selected_train = st.selectbox("Train to Edit", list_of_trains)
    selected_result = get_train_no(selected_train)
    # st.write(selected_result)
    if selected_result:
        train_no = selected_result[0][0]
        train_name = selected_result[0][1]
        train_type = selected_result[0][2]
        train_source = selected_result[0][3]
        train_dest = selected_result[0][4]
        train_avail = selected_result[0][5]
        # Layout of Create

        col1, col2 = st.columns(2)
        with col1:
            new_train_no = st.text_input("Train No:", train_no)
            new_train_name = st.text_input("Name:", train_name)
        with col2:
            new_train_type = st.selectbox("Type", ["Superfast", "Fast", "Mail"])
            new_train_source = st.text_input("Source:")
            new_train_dest = st.text_input("Destination:")
        new_train_avail = st.selectbox("Availability",["Yes","No"])
        if st.button("Update Train"):
            edit_train_avail(new_train_avail, train_no)
            st.success("Successfully updated:: {} to ::{}".format(train_avail, new_train_avail))

    result2 = view_all_data()
    df2 = pd.DataFrame(result2, columns=['Train No', 'Name', 'Type', 'Source', 'Destination','Availability'])
    with st.expander("Updated data"):
        st.dataframe(df2)