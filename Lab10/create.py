import streamlit as st
from database import add_data


def create():
    col1, col2 = st.columns(2)
    with col1:
        train_no = st.text_input("Train No")
        train_name = st.text_input("Name")
    with col2:
        train_type = st.selectbox("Type", ["Superfast", "Fast", "Mail"])
        train_source = st.text_input("Source")
        train_dest = st.text_input("Destination")
    train_avail = st.selectbox("Availability",["Yes","No"])
    if st.button("Add Train"):
        add_data(train_no, train_name, train_type, train_source, train_dest,train_avail)
        st.success("Successfully added Train: {}".format(train_no))