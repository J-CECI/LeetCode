import pandas as pd

def sales_person(sales_person: pd.DataFrame, company: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    df = pd.merge(orders,company,on='com_id')
    red_order = df[df['name']=='RED']
    id = red_order.sales_id.unique()
    valid_person = sales_person[~sales_person['sales_id'].isin(id)]
    return valid_person[['name']]