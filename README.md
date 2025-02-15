<h1>MDBCooker: A Script to Search for Keywords in MDB Files</h1>
MDBCooker is a bash script designed to search for a specific keyword within all tables of an MDB (Microsoft Access Database) file. It exports each table in the database to a CSV format and checks if the specified keyword is present. If a match is found, the table name is displayed; otherwise, the CSV file is deleted.

Features:

Accepts an MDB file and a keyword as arguments.
Dynamically retrieves the list of tables in the MDB file.
Exports each table to a CSV file for searching.
Searches for the provided keyword in each table.
Deletes CSV files if no match is found.
Displays matched tables with the keyword found.

<h3>Usage:</h3> 
$./mdbcooker (path_to_mdb_file) (keyword_to_search)

<h3>Example:</h3>
$./mdbcooker database.mdb "Customer" </br>
In this example, the script will search for the keyword "Customer" across all tables in the database.mdb file and display any tables where the keyword is found.
