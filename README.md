# Supabase Database Documentation Generator

## Overview
This documentation provides an overview of how to document your Supabase PostgreSQL database schema by retrieving comprehensive information about:
- Tables and their columns
- Indexes defined on those tables
- Row-Level Security (RLS) policies
- Database functions
- Triggers
- Storage buckets

**Note**: This script does **not** retrieve any data from the tables; it only collects metadata about the database schema and structure. The output will be in JSON format, allowing for easy interpretation of the different types of database components.

## Using the Script
1. **Log in to Supabase**: Access your Supabase project dashboard.
2. **Open the SQL Editor**: Navigate to the SQL editor in your Supabase project.
3. **Copy and Paste the SQL Script**: Copy the SQL at `document-everything.sql` in this repository.
4. **Execute the Query**: Click the "Run" button to execute the query. The results will appear in the output panel.

## Downloading the Results as CSV
![image](https://github.com/user-attachments/assets/1ddcaba1-b55b-4001-bb1a-af53bb2c1392)

1. **Exporting the Results**:
   - After running the SQL query, you should see the output in JSON format in the output pane in rows.
   - Click on the "Export" button or a similar option available in the Supabase UI, typically found in the results section.

2. **Select File Format**: Choose **CSV** as the file format when prompted.
3. **Download the File**: Complete the export process to download the CSV file to your local machine.

## Notes
- Ensure that you have the necessary role permissions to access the database schema and execute the queries.
- The output format is JSON for each entry; exporting will convert this into CSV format appropriately.

## Contributing
If you have suggestions for improvements or additional features, feel free to open an issue or submit a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
