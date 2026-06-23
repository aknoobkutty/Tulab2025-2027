# Program to Implement Merge Operations (Inner, Outer, Left, Right Join) in Pandas

import pandas as pd 
 
df1 = pd.DataFrame({"id":[1,2,3], "name":["A","B","C"]}) 
df2 = pd.DataFrame({"id":[2,3,4], "salary":[2000,3000,4000]}) 
 
print("Inner Join:\n", pd.merge(df1, df2, on="id", how="inner")) 
print("\nOuter Join:\n", pd.merge(df1, df2, on="id", how="outer")) 
print("\nLeft Join:\n", pd.merge(df1, df2, on="id", how="left")) 
print("\nRight Join:\n", pd.merge(df1, df2, on="id", how="right")) 