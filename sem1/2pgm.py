# Program to Concatenate Multiple Dictionaries in Python 

dict1 = {"a": 1, "b": 2} 
dict2 = {"c": 3, "d": 4} 
dict3 = {"e": 5} 
 
new_dict = {**dict1, **dict2, **dict3} 
print(new_dict)