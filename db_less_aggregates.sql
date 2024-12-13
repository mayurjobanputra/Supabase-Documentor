---- I need to integrate this into the main sql file.. having issues

SELECT 
    n.nspname AS schema_name,
    p.proname AS function_name,
    pg_catalog.pg_get_function_result(p.oid) AS result_type,
    pg_catalog.pg_get_function_arguments(p.oid) AS arguments,
    pg_catalog.pg_get_functiondef(p.oid) AS function_definition,
    d.description
FROM 
    pg_catalog.pg_proc p
JOIN 
    pg_catalog.pg_namespace n ON n.oid = p.pronamespace
LEFT JOIN 
    pg_catalog.pg_description d ON d.objoid = p.oid
WHERE 
    n.nspname NOT IN ('pg_catalog', 'information_schema')  -- Exclude system schemas
    AND p.prokind <> 'a'  -- Exclude aggregate functions
ORDER BY 
    schema_name, function_name;
