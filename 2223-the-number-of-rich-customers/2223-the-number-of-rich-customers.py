import pandas as pd

def count_rich_customers(store: pd.DataFrame) -> pd.DataFrame:
    rich_count  = store[store['amount']>500]
    count  = rich_count['customer_id'].nunique()
    count = pd.DataFrame({'rich_count':[count]})
    return count 