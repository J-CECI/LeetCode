import pandas as pd

def students_and_examinations(students: pd.DataFrame, subjects: pd.DataFrame, examinations: pd.DataFrame) -> pd.DataFrame:
    exam_group = examinations.groupby(['student_id','subject_name']).size().reset_index(name='attended_exams')
    df = pd.merge(students,subjects,how='cross')
    df1 = pd.merge(df,exam_group,on=['student_id','subject_name'],how='left')
    df1['attended_exams'] = df1['attended_exams'].fillna(0).astype(int)
    df1.sort_values(['student_id','subject_name'],inplace=True)
    return df1
