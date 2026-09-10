# Learning SQL for Data Analysis

Welcome to the **Learning SQL for Data Analysis** repository! This collection provides comprehensive SQL scripts, queries, and learning resources designed to help you master SQL concepts and apply them to real-world data analysis tasks.

## Table of Contents
- [About the Project](#about-the-project)
- [Features](#features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## About the Project
This repository contains a series of SQL files covering a wide range of topics, from basic syntax to advanced queries, joins, subqueries, indexing, stored procedures, and more. It's an ideal resource for:
- Beginners looking to learn SQL fundamentals.
- Data analysts seeking practical query examples.
- Anyone preparing for SQL interviews or certifications.

## Features
- **Comprehensive SQL Scripts**: Over 30 `.sql` files covering essential concepts.
- **Organized by Topic**: Files are grouped by themes such as `JOIN`, `GROUP BY`, `Indexes`, `Transactions`, etc.
- **Ready-to-Run**: Scripts can be executed directly on MySQL or compatible databases.
- **Revision Sheets**: Includes markdown revision sheets summarizing key concepts.

## Getting Started
### Prerequisites
- MySQL (or compatible) database server installed.
- Basic command-line access to run SQL scripts.

### Installation
1. Clone this repository:
```bash
git clone https://github.com/Omkatkar007/learning-SQL-for-data-analysis.git
```
2. Navigate to the project directory:
```bash
cd learning-SQL-for-data-analysis
```
3. (Optional) Create a new MySQL database to test the scripts:
```sql
CREATE DATABASE sql_learning;
USE sql_learning;
```

## Usage
Run any SQL file using the MySQL client. Example:
```bash
mysql -u your_user -p sql_learning < "JOINs.sql"
```
Explore the files to see examples of:
- Simple SELECT queries.
- Complex joins (`INNER`, `LEFT`, `RIGHT`, `FULL`).
- Aggregations with `GROUP BY` and `HAVING`.
- Window functions, subqueries, and CTEs.
- Index creation and performance tuning.
- Stored procedures and functions.
- Transaction management (`START TRANSACTION`, `COMMIT`, `ROLLBACK`).

## Contributing
Contributions are welcome! Feel free to:
- Add new SQL examples or improve existing ones.
- Enhance documentation or add more revision notes.
- Submit bug fixes or performance improvements.

### How to Contribute
1. Fork the repository.
2. Create a new branch for your changes:
```bash
git checkout -b feature/your-feature-name
```
3. Commit your changes with a clear message.
4. Push to your fork and open a Pull Request.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
**Om Katkar** – [GitHub](https://github.com/Omkatkar007)

Project Link: https://github.com/Omkatkar007/learning-SQL-for-data-analysis
