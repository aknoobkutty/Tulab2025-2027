# 📘 Student Management System (Swing + JDBC)

## 📌 Overview

This project is a **Java Swing (JFC) desktop application** integrated with **MySQL using JDBC**.
It performs complete **CRUD operations (Create, Read, Update, Delete)** on student records.

Advance java Lab Program

 [ 1 . Develop a complete data manipulation application using Swing/JFC and JDBC.]

---

## 🚀 Features

* ➕ Add new student details
* 📋 View all students in a table
* ✏️ Update existing records
* ❌ Delete records
* 🔄 Auto-refresh data
* 🖱️ Click row to auto-fill form

---

## 🛠️ Technologies Used

* Java (Swing / JFC)
* JDBC (Java Database Connectivity)
* MySQL Database
* VS Code (or any Java IDE)

---

## 📂 Project Structure

```
StudentApp/
│
├── lib/
│   └── mysql-connector-j-9.6.0.jar
│
├── StudentCRUDApp.java
├── StudentCRUDApp.class
└── StudentCRUDApp$1.class
```

---

## ⚙️ Requirements

* Java JDK 8 or above
* MySQL Server installed
* MySQL Connector/J (.jar file)
* VS Code with Java Extensions

---

## 🔌 JDBC Driver Setup

1. Download MySQL Connector/J
2. Place the `.jar` file inside `lib/` folder
3. Ensure file size is ~2MB (not empty)

---

## 🗄️ Database Setup

Run the following SQL:

```sql
CREATE DATABASE testdb;
USE testdb;

CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);
```

---

## 🔐 Database Configuration

Update credentials in Java code:

```java
private static final String URL = "jdbc:mysql://localhost:3306/testdb?useSSL=false&serverTimezone=UTC";
private static final String USER = "your_username";
private static final String PASS = "your_password";
```

---

## ▶️ How to Run (VS Code Terminal)

### Compile:

```
javac -cp ".;lib/mysql-connector-j-9.6.0.jar" StudentCRUDApp.java
```

### Run:

```
java -cp ".;lib/mysql-connector-j-9.6.0.jar" StudentCRUDApp
```

> 💡 For Linux/Mac replace `;` with `:`

---

## 🧪 Sample Input

| ID | Name  | Department |
| -- | ----- | ---------- |
| 1  | Gopal | MCA        |
| 2  | Naresh | BCA        |

---

## ⚠️ Common Errors & Fixes

### ❌ Driver not found

* Cause: JDBC jar not added
* Fix: Add jar in classpath

---

### ❌ zip file is empty

* Cause: Corrupted jar
* Fix: Re-download connector

---

### ❌ Access denied for user

* Cause: Wrong MySQL password
* Fix: Update password in code

---

### ❌ Table doesn't exist

* Cause: DB not created
* Fix: Run SQL script

---

## 📈 Future Enhancements

* 🔍 Search functionality
* 🔐 Login system
* 📊 Reports generation
* 🌐 Web version (JSP/Servlet)
* 📦 MVC architecture

---

## 👨‍💻 Author

Developed as part of **Advanced Java Lab / JDBC Project**

---

## 📜 License

This project is for **educational purposes only**.
