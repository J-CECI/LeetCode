import pandas as pd

def ads_performance(ads: pd.DataFrame) -> pd.DataFrame:
    ads['clicked'] = ads['action'] == 'Clicked'
    ads['not_ingnored'] = ads['action'] != 'Ignored'
    ads_group = ads.groupby('ad_id')[['clicked','not_ingnored']].sum().reset_index()
    ads_group['ctr'] = round(100*ads_group['clicked']/ads_group['not_ingnored'],2)
    ads_group['ctr'].fillna(0,inplace=True)
    df = ads_group[['ad_id','ctr']]
    return df.sort_values(by = ['ctr','ad_id'], ascending =[False,True])
     