README.md
# Periodic Table Database & Lookup Script

This project is part of the freeCodeCamp Relational Database curriculum.  
It builds a normalized PostgreSQL database of chemical elements and a Bash script (`element.sh`) that queries it to display element information.

---

## 📋 Project Overview

- **Database:** `periodic_table` (PostgreSQL)
- **Tables:** `elements`, `properties`, `types`
- **Languages/Tools:** SQL, Bash, Git
- **Goal:** Query information about any chemical element by atomic number, symbol, or name.

---

## 🗄️ Database Features

- **Normalized Schema:**  
  - `elements` table holds atomic number, symbol, and name  
  - `properties` table holds mass, melting/boiling points, and type (via `type_id`)  
  - `types` table holds element categories (metal, nonmetal, metalloid)

- **Data Integrity:**  
  - `symbol` and `name` columns are `NOT NULL` and `UNIQUE`  
  - Foreign keys enforce relationships between tables  
  - Removed non-existent element with `atomic_number = 1000`  

---

## 🖥️ Bash Script (`element.sh`)

Run the script from the command line:

```bash
./element.sh 1
./element.sh H
./element.sh Hydrogen

Example Output
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.


If no argument is provided:

Please provide an element as an argument.


If the element does not exist:

I could not find that element in the database.

🔧 Installation & Setup

Clone this repository:

git clone https://github.com/<your-username>/periodic_table.git
cd periodic_table


Restore the database:

psql -U postgres < periodic_table.sql


Make the script executable (if not already):

chmod +x element.sh


Run the script with an argument:

./element.sh Ne

📜 License

This project is part of the freeCodeCamp
 Relational Database curriculum.
You are free to use, share, and modify it for educational purposes.
