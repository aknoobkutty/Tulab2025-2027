# Online Examination Application
"8. Develop an on-line examination applicationusing JSTL and JDBC. "

This is a sample online examination application implemented using JSTL, JDBC, servlets, and JSP.

## Overview

The application loads a set of exam questions from a MySQL database and renders them using JSTL. The user submits answers and receives an immediate score report.

## Project Structure

- `index.jsp` — home page with a link to start the exam
- `exam.jsp` — renders exam questions using JSTL
- `result.jsp` — displays score and per-question results
- `WEB-INF/web.xml` — servlet mapping
- `src/com/examapp/controller/ExamController.java` — servlet controller
- `src/com/examapp/dao/QuestionDAO.java` — JDBC data access for questions
- `src/com/examapp/model/Question.java` — question model
- `src/com/examapp/util/DBConnection.java` — JDBC connection utility
- `sql/online_exam.sql` — database schema and sample data

## Requirements

- Apache Tomcat 11 or compatible Jakarta EE 10 container
- MySQL 8.x (or compatible MySQL/MariaDB server)
- JDBC driver: `mysql-connector-java-8.x.jar`
- JSTL libraries: `jakarta.servlet.jsp.jstl-2.0.0.jar` and `jakarta.servlet.jsp.jstl-api-2.0.0.jar`

## Database Setup

1. Create the database and table by running `sql/online_exam.sql` in MySQL.
2. Update database credentials in `src/com/examapp/util/DBConnection.java` if needed.

Example MySQL commands:

```sql
SOURCE /path/to/OnlineExamApp/sql/online_exam.sql;
```

## Deploying the App

1. Copy the `OnlineExamApp` folder to your Tomcat `webapps` directory.
2. Add the required JAR files to `OnlineExamApp/WEB-INF/lib` or to Tomcat's shared `lib` folder.
3. Compile the Java sources into `WEB-INF/classes`:

```bash
cd <TOMCAT_HOME>/webapps/OnlineExamApp
javac -d WEB-INF/classes src/com/examapp/controller/ExamController.java src/com/examapp/dao/QuestionDAO.java src/com/examapp/model/Question.java src/com/examapp/util/DBConnection.java
```

4. Start Tomcat and open:

```
http://localhost:8080/OnlineExamApp
```

## Run the App Properly

1. Make sure MySQL is running and `online_exam` exists.
2. Make sure the JDBC driver and JSTL JARs are in `WEB-INF/lib`.
3. Compile the Java sources after any change:

```bash
cd <TOMCAT_HOME>/webapps/OnlineExamApp
mkdir -p WEB-INF/classes
javac -d WEB-INF/classes src/com/examapp/controller/ExamController.java src/com/examapp/dao/QuestionDAO.java src/com/examapp/model/Question.java src/com/examapp/util/DBConnection.java
```

4. Restart Tomcat to ensure the updated servlet classes are loaded:

```bash
cd <TOMCAT_HOME>/bin
./shutdown.sh
./startup.sh
```

5. Open the browser and go to:

```
http://localhost:8080/OnlineExamApp
```

6. If you see an error, check `logs\localhost.<date>.log` and `logs\catalina.<date>.log` for details.

## Notes

- The default database connection URL points to `jdbc:mysql://localhost:3306/online_exam`.
- The passing score is configured as 60% of the total questions.
- If JSTL tags are not found, ensure the JSTL JAR files are present in `WEB-INF/lib`.
