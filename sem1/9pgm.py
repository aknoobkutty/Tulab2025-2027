# Program for Data Visualization Using Matplotlib and 
# Seaborn (Histogram, KDE, Boxplot, Countplot, Heatmap, 
# etc.) 

import matplotlib.pyplot as plt 
import seaborn as sns 
import pandas as pd 
 
# Manual sample dataset 
data = pd.DataFrame({ 
    "marks": [45, 67, 89, 70, 56, 92, 77], 
    "age":   [18, 19, 18, 20, 19, 21, 18], 
    "gender": ["M","F","M","F","M","F","M"] 
}) 
plt.figure(); sns.histplot(data["marks"]); plt.show() 
plt.figure(); sns.boxplot(x=data["marks"]); plt.show() 
plt.figure(); sns.kdeplot(data["marks"]); plt.show() 
plt.figure(); sns.stripplot(x="gender", y="marks", data=data); plt.show() 
plt.figure(); sns.pairplot(data); plt.show() 
plt.figure(); sns.countplot(x="gender", data=data); plt.show() 
 
# FIXED Heatmap 
plt.figure() 
numeric_data = data.select_dtypes(include=['number']) 
sns.heatmap(numeric_data.corr(), annot=True) 
plt.show()