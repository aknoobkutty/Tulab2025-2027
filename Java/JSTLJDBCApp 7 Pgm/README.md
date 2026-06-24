# JSTL + JDBC Student Management App

" 7 . Develop a complete data manipulation application using JSTL and JDBC.

This web application demonstrates a complete CRUD data manipulation flow using:
- JSP + JSTL for the view layer
- JDBC for database operations
- Servlets for controller logic
- A simple DAO pattern

## Structure
- `index.jsp` — home page
- `students.jsp` — list all student records
- `student-form.jsp` — add / edit student form
- `src/com/studentapp/model/Student.java` — data model
- `src/com/studentapp/util/DBConnection.java` — JDBC connection utility
- `src/com/studentapp/dao/StudentDAO.java` — database operations
- `src/com/studentapp/controller/StudentController.java` — servlet controller
- `WEB-INF/web.xml` — deployment descriptor
- `sql/studentdb.sql` — database creation script

## Setup
1. Create the database and table:
   - Run `sql/studentdb.sql` in MySQL.
2. Add the required libraries to `WEB-INF/lib` or the server classpath:
   - `mysql-connector-java-8.x.jar`
   - `jakarta.servlet.jsp.jstl-2.0.0.jar`
   - `jakarta.servlet.jsp.jstl-api-2.0.0.jar` (if needed)
3. Deploy the `JSTLJDBCApp` folder as a web application in Tomcat / any Jakarta EE container.
4. Compile the Java classes into `WEB-INF/classes`:
   - `javac -d WEB-INF/classes src/com/studentapp/**/*.java`
5. Start the server and browse `http://localhost:8080/JSTLJDBCApp`

## Notes
- The default database connection points to `jdbc:mysql://localhost:3306/studentdb`.
- Update `DBConnection.java` if your MySQL credentials differ.
- The application uses JSTL `<c:forEach>` and `<c:choose>` tags to render data cleanly.
