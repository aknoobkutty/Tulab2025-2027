# Program to Sort a Dictionary by Its Values (Ascending & Descending) 

data = {"a": 10, "b": 5, "c": 15} 
 
asc = dict(sorted(data.items(), key=lambda x: x[1])) 
desc = dict(sorted(data.items(), key=lambda x: x[1], reverse=True)) 
 
print("Ascending:", asc) 
print("Descending:", desc) 