import pandas as pd

def food_delivery(delivery: pd.DataFrame) -> pd.DataFrame:
    immediate = (delivery['order_date'] == delivery['customer_pref_delivery_date']).sum()
    total = len(delivery)
    perce = immediate/total
    percentage = round(perce*100,2)
    df = pd.DataFrame({'immediate_percentage': [percentage]})
    return df
    