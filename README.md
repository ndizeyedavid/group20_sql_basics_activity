# Play with SQL Basics Group Activity (alu_db)

In repository we have a collaborative SQL script, developed in strict dependency order to match the schema we were provided with and also perform CRUD operations, and advanced multi-table JOIN queries.

## Database Schema Diagram

<img width="1448" height="312" alt="image" src="https://github.com/user-attachments/assets/52484fb1-4791-4bee-a235-4d15d5305476" />

## Team Roles

| Team Member | Table / Task Assigned               | Dependency                                   |
| ----------- | ----------------------------------- | -------------------------------------------- |
| **Elyse**   | `Classroom` Table                   | None (Independent)                           |
| **Bruce**   | `Faculty` Table                     | None (Independent)                           |
| **Juliana** | `Students` Table                    | Requires `Classroom`                         |
| **Calvin**  | `Extra_Curricular_Activities` Table | Requires `Faculty`                           |
| **David**   | `Courses` + Junction Tables         | Requires `Students`, `Courses`, `Activities` |
| **Jimmy**   | Normalization Analysis              | Requires entire database                     |

## How to Run the Script

1. Clone this repository to your local machine:

```bash
   git clone https://github.com/ndizeyedavid/group20_sql_basics_activity

```

2. Open your preferred MySQL client (e.g Database client in VScode).
3. open the `alu_db.sql` script and click the run button
