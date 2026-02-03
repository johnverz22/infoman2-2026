# Lab Activity: Spring Boot and Flyway Migration Submission

## Objective

This activity focuses on demonstrating your understanding of database migration using Flyway with Spring Boot. You will submit the work you completed in the previous session related to setting up and executing database migrations.

## Instructions

1.  **Locate Your Project:** Navigate to your Spring Boot project where you implemented Flyway migrations.
2.  **Identify Key Files:**
    *   **Flyway Migration Files:** These are typically located in `src/main/resources/db/migration/` and follow a naming convention like `V1__Initial_Schema.sql`, `V2__Add_Users_Table.sql`, etc.
    *   **Application Properties:** The `application.properties` file, usually located in `src/main/resources/`, which contains your Flyway configuration.
3.  **Submit to Repository:**
    *   Create a folder named `activity4` within your personal repository (or the designated submission location).
    *   Copy all your Flyway migration `.sql` files into this `activity4` folder.
    *   Copy your `application.properties` (or `application.yml`) file into the same `activity4` folder.
    *   Ensure all necessary files are committed and pushed to your repository.

## Grading Rubric (Total: 20 Points)

*   **Migration Files Presence and Naming (5 points)**
    *   All necessary migration files (`V<VERSION>__<DESCRIPTION>.sql`) are present (3 points).
    *   Migration files adhere to Flyway's naming conventions (2 points).

*   **Migration File Content (8 points)**
    *   Each migration file contains valid SQL syntax (4 points).
    *   Migrations logically progress and apply schema changes incrementally (4 points).

*   **`application.properties` Configuration (4 points)**
    *   `application.properties` (or `application.yml`) is present and correctly configured for Flyway (2 points).
    *   Database connection details (URL, username, password) are appropriately set up (2 points).

*   **Completeness and Organization (3 points)**
    *   All requested files are submitted in the `activity3` folder (2 points).
    *   The submission is well-organized and easy to review (1 point).
