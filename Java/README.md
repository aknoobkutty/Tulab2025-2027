# Advanced Java Lab Projects

This workspace contains a set of Advanced Java lab programs demonstrating desktop Swing applications, JavaBeans, event handling, JDBC, JSP/Servlet web applications, JSTL, DAO patterns, and session management.

## Workspace Overview

Projects included:

- `EventSetBeanDemo` - custom JavaBean event listener demo
- `IntrestCalculator` - Swing interest calculator (simple and compound)
- `JavaBeansGUIBean` - Swing JavaBean GUI component demo
- `NotepadApp` - simple Swing notepad with file operations
- `StudentApp` - Swing CRUD student management desktop app with JDBC
- `JSTLJDBCApp` - JSP/JSTL + Servlet + JDBC student management app
- `OnlineBankingApp` - JSP banking demo with session handling
- `OnlineExamApp` - JSP/Servlet online exam app with MySQL
- `ShoppingCart` - JSP shopping cart web app with JDBC
- `UserAuthApp` - JSP/Servlet user registration and login app

## Prerequisites

For all projects:

- Java JDK installed and `javac` / `java` available on `PATH`
- MySQL server installed and running for JDBC-based apps
- Apache Tomcat 11.x (or compatible Servlet/JSP container) for web apps
- MySQL JDBC driver (`mysql-connector-java-*.jar`) available in web app `WEB-INF/lib`

## How to Use This Workspace

### 1. Desktop Java Applications

These are plain Java Swing/JFC programs.

#### EventSetBeanDemo

Concept:
- Demonstrates custom event handling in JavaBeans.
- A bean fires events and a listener receives them.

How to run:

```bash
cd EventSetBeanDemo
javac EventSetBeanDemo.java
java EventSetBeanDemo
```

Expected result:
- The program prints bean state changes and received event messages.

#### IntrestCalculator

Concept:
- Swing GUI for calculating simple interest and compound interest.
- Uses input fields and buttons with event listeners.

How to run:

```bash
cd IntrestCalculator
javac InterestCalculator.java
java InterestCalculator
```

#### JavaBeansGUIBean

Concept:
- Builds a reusable JavaBean Swing component.
- Exposes bean properties like button text and colors.
- Demonstrates property getters/setters and GUI binding.

How to run:

```bash
cd JavaBeansGUIBean
javac -d out src/com/example/javabeans/*.java
java -cp out com.example.javabeans.BeanDemo
```

#### NotepadApp

Concept:
- Simple text editor built with Swing.
- Supports New, Open, Save, Save As, Cut, Copy, Paste, Select All.
- Uses `JFileChooser` and file I/O.

How to run:

```bash
cd NotepadApp
javac NotepadApp.java
java NotepadApp
```

#### StudentApp

Concept:
- Swing desktop CRUD application for student data.
- Uses JDBC to connect to a MySQL database.
- Demonstrates table display and record operations.

How to run:

1. Configure the MySQL database in `StudentCRUDApp.java`.
2. Compile and run with the Connector/J jar in the classpath:

```bash
cd StudentApp
javac -cp ".;lib/mysql-connector-j-9.6.0.jar" StudentCRUDApp.java
java -cp ".;lib/mysql-connector-j-9.6.0.jar" StudentCRUDApp
```

> On macOS/Linux use `:` instead of `;` in the classpath:
>
> ```bash
> javac -cp ".:lib/mysql-connector-j-9.6.0.jar" StudentCRUDApp.java
> java -cp ".:lib/mysql-connector-j-9.6.0.jar" StudentCRUDApp
> ```

3. Make sure the MySQL database exists and the table is created.

### 2. Web Applications

These apps must be deployed to Tomcat or a compatible Jakarta EE container.

General web app setup:

1. Create the required MySQL database using the provided SQL script.
2. Update connection settings in each app's `DBConnection.java` file.
3. Place the required JDBC and JSTL JAR files into `WEB-INF/lib`.
4. Compile Java source files into `WEB-INF/classes`.
5. Deploy the folder to Tomcat's `webapps` directory and start Tomcat.

#### JSTLJDBCApp

Concept:
- Student management system using JSP, JSTL, servlets, and JDBC.
- Uses MVC-style DAO and controller patterns.

Key files:
- `index.jsp`
- `student-form.jsp`
- `students.jsp`
- `src/com/studentapp/controller/StudentController.java`
- `src/com/studentapp/dao/StudentDAO.java`
- `src/com/studentapp/util/DBConnection.java`
- `sql/studentdb.sql`

How to run:

- Deploy `JSTLJDBCApp` to Tomcat.
- Compile classes into `WEB-INF/classes`.
- Open: `http://localhost:8080/JSTLJDBCApp`

#### OnlineBankingApp

Concept:
- Simple banking demo with login, deposit, withdraw, and logout.
- Uses JSP pages and session storage.

Key files:
- `index.jsp`
- `dashboard.jsp`
- `process.jsp`
- `logout.jsp`
- `WEB-INF/web.xml`

How to run:

- Deploy `OnlineBankingApp` to Tomcat.
- Open: `http://localhost:8080/OnlineBankingApp/`

#### OnlineExamApp

Concept:
- Online exam application with question retrieval from MySQL.
- Uses servlet controller, JSP rendering, and JSTL.

Key files:
- `index.jsp`
- `exam.jsp`
- `result.jsp`
- `src/com/examapp/controller/ExamController.java`
- `src/com/examapp/dao/QuestionDAO.java`
- `src/com/examapp/util/DBConnection.java`
- `sql/online_exam.sql`

How to run:

- Create the database using `sql/online_exam.sql`.
- Deploy to Tomcat.
- Open: `http://localhost:8080/OnlineExamApp`

#### ShoppingCart

Concept:
- Shopping cart example built with JSP and JDBC.
- Uses JSP pages for UI and DAO-style database access.

Key files:
- `index.jsp`, `home.jsp`, `cart.jsp`, `addToCart.jsp`, `removeFromCart.jsp`, `checkout.jsp`
- `src/dao/DBConnection.java`
- `Shopping.sql`

How to run:

- Create the database and tables from `Shopping.sql`.
- Deploy to Tomcat.
- Open: `http://localhost:8080/ShoppingCart/`

#### UserAuthApp

Concept:
- User registration and login with session-based personalization.
- Uses JSP pages, servlets, and MySQL.

Key files:
- `register.html`
- `login.html`
- `welcome.jsp`
- `src/com/auth/RegisterServlet.java`
- `src/com/auth/LoginServlet.java`
- `src/com/auth/LogoutServlet.java`
- `src/com/auth/DBConnection.java`
- `WEB-INF/web.xml`
- `userauthdb.sql`

How to run:

- Create the database using `userauthdb.sql`.
- Update JDBC settings in `DBConnection.java`.
- Use `build.bat` to compile and `redeploy.bat` to redeploy.
- Open: `http://localhost:8080/UserAuthApp/`

## Database Notes

For the JDBC-based web and desktop apps, run the appropriate SQL script before starting the app:

- `JSTLJDBCApp/sql/studentdb.sql`
- `OnlineExamApp/sql/online_exam.sql`
- `ShoppingCart/Shopping.sql`
- `UserAuthApp/userauthdb.sql`
- `StudentApp` requires a database and student table; configure the JDBC URL in `StudentCRUDApp.java`

## Common Troubleshooting

- If a servlet or JSP page fails, check the Tomcat logs under `logs/`.
- If you see `ClassNotFoundException` for the JDBC driver, confirm the `mysql-connector-java` JAR is in `WEB-INF/lib`.
- If MySQL connection fails, verify the database name, username, and password in `DBConnection.java`.
- If GUI apps do not launch, ensure the `java` command is using a valid JDK.

## Recommended Workflow

1. Pick the app you want to run.
2. Read that app's own `README.md` for detailed instructions.
3. Configure database credentials as needed.
4. Compile and execute the app.

## Notes

- Desktop apps are self-contained and require only the Java runtime and, where applicable, the JDBC driver.
- Web apps require Tomcat and may require additional JSTL JARs for JSP pages.
- This root README provides a high-level overview; individual project folders contain specific setup details.
