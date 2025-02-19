import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    newdf = customers.merge(orders,left_on= 'id', right_on= 'customerId',how = 'left')
    newdf = newdf[newdf['customerId'].isna()]
    newdf = newdf[['name']].rename(columns={'name':'Customers'})
    return newdf