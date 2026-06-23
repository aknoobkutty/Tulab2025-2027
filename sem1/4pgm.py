# Program to Create a Pandas DataFrame from multiprocessing.dummy import Array
import numpy as np 
import pandas as pd 
 
arr = np.array([[10, 20], [30, 40], [50, 60]]) 
df = pd.DataFrame(arr, index=["Row1", "Row2", "Row3"], columns=["Col1", "Col2"]) 
print(df)