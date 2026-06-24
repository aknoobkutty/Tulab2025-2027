# ShoppingCart Web Application

" 5 Develop a simple Shopping Cart using JSP and JDBC. " 

## Overview

This is a simple Java web application for a shopping cart built with JSP and servlets. It uses MySQL for the database connection and is designed to run on Apache Tomcat.

## Prerequisites

- Apache Tomcat 11.x installed
- Java JDK 17+ installed
- MySQL server installed and running
- MySQL Connector/J JDBC driver
g
## Project Structure

- `index.jsp`, `home.jsp`, `cart.jsp`, `addToCart.jsp`, `removeFromCart.jsp`,   `checkout.jsp` — JSP pages for the UI
- `src/dao/DBConnection.java` — database connection helper
- `WEB-INF/web.xml` — web application descriptor
- `WEB-INF/lib/mysql-connector-j-9.6.0.jar` — MySQL JDBC driver
- `WEB-INF/classes/` — compiled Java classes
- `Shopping.sql` — database schema/sample SQL

## Tomcat Environment Setup

1. Install Apache Tomcat and note its installation path.
   - Example: `<TOMCAT_HOME>`
2. Set the `CATALINA_HOME` environment variable (optional but recommended):
   - Open System Properties > Advanced > Environment Variables
   - Add a new user/system variable:
     - Name: `CATALINA_HOME`
     - Value: `<TOMCAT_HOME>`
3. Add Tomcat bin folder to `PATH` (optional):
   - `<TOMCAT_HOME>/bin`

## Database Setup

1. Start MySQL server.
2. Create the database and tables used by the application.
3. Use the `Shopping.sql` file if it contains schema definitions.

Example SQL commands:

```sql
CREATE DATABASE shopping;
USE shopping;
-- Add tables here if needed, e.g. products, orders, users
```

4. Verify the MySQL JDBC URL and credentials in `src/dao/DBConnection.java`:

```java
Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/shopping",
    "your_username",
    "your_password"
);
```

5. If your MySQL username/password differ, update the values in `DBConnection.java`.

## Build and Deploy

### Option 1: Using Tomcat deployment folder

1. Compile the Java source file:

```bash
cd "<TOMCAT_HOME>/webapps/ShoppingCart"
javac -cp "WEB-INF/lib/mysql-connector-j-9.6.0.jar" -d WEB-INF/classes src/dao/DBConnection.java
```

2. Ensure the compiled class exists in:

- `WEB-INF/classes/dao/DBConnection.class`

3. Start Tomcat using `startup.bat` or from the services interface.
4. Access the app in your browser at:

```
http://localhost:8080/ShoppingCart/
```

### Option 2: Package as a WAR file

1. Create a WAR file containing the application contents.
2. Deploy the WAR to Tomcat by placing it in `CATALINA_HOME/webapps/`.
3. Restart Tomcat.

## Important Notes

- The application expects JSP files to be served from the root of the webapp folder.
- Keep the JDBC driver jar in `WEB-INF/lib/`.
- The `WEB-INF/classes` folder must contain compiled Java classes from `src/`.

## Troubleshooting

- `ClassNotFoundException: com.mysql.cj.jdbc.Driver`:
  - Ensure `mysql-connector-j-9.6.0.jar` is in `WEB-INF/lib`.
- `Communications link failure` or connection refused:
  - Confirm MySQL is running and the URL is correct.
- `HTTP 404` for pages:
  - Verify the application is deployed to Tomcat and the URL path is correct.

## Summary

1. Set `Path in ENV` to your Tomcat installation.
2. Configure MySQL and create the `shopping` database.
3. Place `mysql-connector-j-9.6.0.jar` in `WEB-INF/lib`.
4. Compile Java source into `WEB-INF/classes`.
5. Start Tomcat and open `http://localhost:8080/ShoppingCart/`.
