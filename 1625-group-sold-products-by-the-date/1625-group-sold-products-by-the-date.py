import pandas as pd

def categorize_products(activities: pd.DataFrame) -> pd.DataFrame:
    group = activities.groupby('sell_date')
    stat = group.agg(
        num_sold = ('product','nunique'),
        products = ('product',lambda x:','.join(sorted(set(x))))
    ).reset_index()
    stat.sort_values('sell_date',inplace=True)
    return stat