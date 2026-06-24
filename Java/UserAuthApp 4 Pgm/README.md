# UserAuthApp
"4. Develop an application for User Authentication and Personalization using Servlet and JDBC. "
## Overview
UserAuthApp is a simple Java web application for user registration, login, and session-based personalization.

It is built using Jakarta Servlets, JSP, and MySQL, and is designed to run on Apache Tomcat 11.

## What it does
- Registers new users with name, email, password, and city.
- Authenticates existing users with email and password.
- Creates an HTTP session and stores user data.
- Displays a personalized welcome page.
- Logs out users by invalidating their session.
- Includes an inline password visibility toggle on both login and registration pages.

## Application flow
1. Open `http://localhost:8080/UserAuthApp/`.
2. Click Register to open `register.html`.
3. Submit the registration form to `RegisterServlet`.
4. After successful registration, click Login.
5. Submit login credentials to `LoginServlet`.
6. On success, the user is redirected to `welcome.jsp`.
7. Click Logout to end the session and return to `login.html`.

## Important files
- `src/com/auth/DBConnection.java`
  - handles MySQL JDBC connection setup.
  - currently connects to `jdbc:mysql://127.0.0.1:3306/userauthdb`.

- `src/com/auth/RegisterServlet.java`
  - receives registration form values.
  - inserts a new user record into the `users` table.
  - returns HTML success or error feedback.

- `src/com/auth/LoginServlet.java`
  - receives login form data.
  - validates the user against the database.
  - stores `name`, `email`, and `city` in session upon success.
  - redirects to `welcome.jsp`.

- `src/com/auth/LogoutServlet.java`
  - invalidates the current user session.
  - redirects to `login.html`.

- `login.html`
  - login form with password toggle button.

- `register.html`
  - registration form with password toggle button.

- `welcome.jsp`
  - displays session values for authenticated users.
  - redirects to login when session data is missing.

- `WEB-INF/web.xml`
  - servlet declarations and URL mappings.

- `WEB-INF/lib/mysql-connector-j-9.6.0.jar`
  - MySQL JDBC driver used by the application.

## Database setup
Create and use the database by running `userauthdb.sql` with your MySQL client.

```sql
CREATE DATABASE userauthdb;
USE userauthdb;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    city VARCHAR(100)
);
```

## Configuration
Update `src/com/auth/DBConnection.java` if your MySQL host, port, username, or password differ.
Example:

```java
private static final String URL = "jdbc:mysql://127.0.0.1:3306/userauthdb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
private static final String USER = "your_username";
private static final String PASSWORD = "your_password";
```

## Build and deployment
1. Start MySQL.
2. From the app root folder, run:
   - `build.bat`
3. Start or restart Tomcat.
4. Open in your browser:
   - `http://localhost:8080/UserAuthApp/`

## Redeploy
Use `redeploy.bat` to:
- compile the servlet sources,
- stop Tomcat,
- clear the work directory for UserAuthApp,
- start Tomcat again.

## Troubleshooting
- If the page shows "Database connection failed," verify MySQL is running and the credentials in `DBConnection.java` are correct.
- If `welcome.jsp` redirects to login, the user session was not created or expired.
- If there is a `ClassNotFoundException`, rerun `build.bat` and `redeploy.bat`.
- Ensure `mysql-connector-j-9.6.0.jar` is present in `WEB-INF/lib`.

## Notes
- Temporary test files like `DbTest.java` and `DbTest.class` have been removed.
- The application runs directly from the project root; the old `WebContent` folder has been removed.
- Password toggles now use readable text labels `[View]` and `[Hide]`.
