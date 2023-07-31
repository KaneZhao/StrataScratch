"""
You have been asked to find the job titles of the highest-paid employees.

Your output should include the highest-paid title or multiple titles with the same salary.
"""
# Import your libraries
import pandas as pd

# Start writing code
# worker.head()
df1 = pd.merge(worker, title, left_on='worker_id', right_on='worker_ref_id')
max_val = max(df1['salary'])

df1.loc[df1['salary'] == max_val]['worker_title'].head()