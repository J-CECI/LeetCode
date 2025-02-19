import pandas as pd

def largest_orders(orders: pd.DataFrame) -> pd.DataFrame:
    df = orders.groupby('customer_number').size().reset_index(name='count')
    df.sort_values(by='count',ascending=False,inplace=True)
    return df[['customer_number']][0:1]