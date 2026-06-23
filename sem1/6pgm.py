# Program to Perform Indexing, Manipulation, and Concatenation in Pandas DataFrames 

import pandas as pd 
 
df1 = pd.DataFrame({"A":[1,2,3], "B":[4,5,6]}) 
df2 = pd.DataFrame({"A":[7,8], "B":[9,10]}) 
 
print("Row Indexing:\n", df1.iloc[1]) 
print("\nColumn Indexing:\n", df1["A"]) 
 
concat_df = pd.concat([df1, df2], ignore_index=True) 
print("\nConcatenated DataFrame:\n", concat_df)