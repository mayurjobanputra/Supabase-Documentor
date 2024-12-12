# Supabase Database Documentation Generator

## Overview
This documentation provides an overview of how to document your Supabase PostgreSQL database schema by retrieving comprehensive information about:
- Tables and their columns
- Field-level constraints (including allowed values from check constraints)
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

## Downloading the Results
You have the option to download the results as either CSV or JSON:

- **As CSV**: 
    1. After running the SQL query, you should see the output in JSON format in the output pane in rows.
    2. Click on the "Export" button or a similar option available in the Supabase UI, typically found in the results section.
    3. ![Export CSV Example](https://github.com/user-attachments/assets/1ddcaba1-b55b-4001-bb1a-af53bb2c1392)
    4. Choose **CSV** as the file format when prompted.
    5. Complete the export process to download the CSV file to your local machine.
  
- **As JSON**:
    - If you prefer to use this information in generative development AI applications like Windsurf, you can directly copy the JSON output from the SQL results. Windsurf and similar apps do not currently connect natively with Supabase, so having the JSON format allows you to integrate your database schema easily. Drop the json output into a .md file somewhere in your repo.

## Notes
- Ensure that you have the necessary role permissions to access the database schema and execute the queries.
- The output format is JSON for each entry; exporting will convert this into CSV format appropriately. If you choose to use the JSON format, you can adapt it for use in external applications.

## Contributing
If you have suggestions for improvements or additional features, feel free to open an issue or submit a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
