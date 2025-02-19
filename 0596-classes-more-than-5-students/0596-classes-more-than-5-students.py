import pandas as pd

def find_classes(courses: pd.DataFrame) -> pd.DataFrame:
    courses = courses.groupby('class').size().reset_index(name='count')
    df = courses[courses['count']>=5]
    return df[['class']]