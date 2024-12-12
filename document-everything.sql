-- RUN This in SQL in Supabase
---------------------------------

-- Document all your tables
SELECT 
    json_build_object('type', 'Table', 'table_name', table_name, 'column_name', column_name, 'data_type', data_type) AS json_output
FROM 
    information_schema.columns 
WHERE 
    table_schema = 'public'

UNION ALL

-- Document all your indexes
SELECT 
    json_build_object('type', 'Index', 'index_name', t.relname, 'column_name', a.attname, 'table_name', t2.relname) AS json_output
FROM 
    pg_index i
JOIN 
    pg_class t ON t.oid = i.indexrelid
JOIN 
    pg_attribute a ON a.attnum = ANY(i.indkey) AND a.attrelid = t.oid
JOIN 
    pg_class t2 ON t2.oid = i.indrelid
WHERE 
    t2.relkind = 'r' AND t2.relnamespace = 'public'::regnamespace

UNION ALL

-- Document all your RLS
SELECT 
    json_build_object('type', 'RLS Policy', 'policy_name', policyname, 'table_name', tablename, 'is_permissive', permissive, 'applicable_roles', roles, 'policy_qual', qual, 'with_check', with_check) AS json_output
FROM 
    pg_policies
WHERE 
    schemaname = 'public'

UNION ALL

-- Document all your DB Functions
SELECT 
    json_build_object('type', 'Function', 'routine_name', routine_name, 'return_type', data_type) AS json_output
FROM 
    information_schema.routines 
WHERE 
    specific_schema = 'public'

UNION ALL

-- Document all your Triggers
SELECT 
    json_build_object('type', 'Trigger', 'trigger_name', tgname, 'table_name', relname, 'trigger_type', tgtype) AS json_output
FROM 
    pg_trigger t
JOIN 
    pg_class c ON c.oid = t.tgrelid
WHERE 
    c.relnamespace = 'public'::regnamespace

UNION ALL

-- Document all your Buckets
SELECT 
    json_build_object('type', 'Bucket', 'bucket_name', name, 'created_at', created_at) AS json_output
FROM 
    storage.buckets;
