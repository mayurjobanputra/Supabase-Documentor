-- RUN This in SQL in Supabase
---------------------------------

-- Document all your tables
SELECT 
    json_build_object(
        'type', 'Table', 
        'table_name', table_name, 
        'column_name', column_name, 
        'data_type', data_type
    ) AS json_output
FROM 
    information_schema.columns 
WHERE 
    table_schema = 'public'

UNION ALL

-- Document all field-level constraints
SELECT 
    json_build_object(
        'type', 'Constraint', 
        'table_name', kcu.table_name,
        'column_name', kcu.column_name,
        'constraint_type', tc.constraint_type,
        'constraint_name', tc.constraint_name
    ) AS json_output
FROM 
    information_schema.key_column_usage kcu
JOIN 
    information_schema.table_constraints tc ON kcu.constraint_name = tc.constraint_name
WHERE 
    tc.table_schema = 'public'

UNION ALL

-- Document allowed values from all CHECK constraints in the public schema
SELECT 
    json_build_object(
        'type', 'Allowed Value', 
        'table_name', c.conname,  -- The constraint name is used here for clarity
        'constraint_definition', pg_get_constraintdef(c.oid)  -- Get the definition of the constraint
    ) AS json_output
FROM 
    pg_constraint c
WHERE 
    c.contype = 'c'  -- 'c' stands for CHECK constraints
    AND c.conrelid IN (SELECT oid FROM pg_class WHERE relnamespace = 'public'::regnamespace)

UNION ALL

-- Document all indexes
SELECT 
    json_build_object(
        'type', 'Index', 
        'index_name', t.relname, 
        'column_name', a.attname, 
        'table_name', t2.relname
    ) AS json_output
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

-- Document all RLS policies
SELECT 
    json_build_object(
        'type', 'RLS Policy', 
        'policy_name', policyname, 
        'table_name', tablename, 
        'is_permissive', permissive, 
        'applicable_roles', roles, 
        'policy_qual', qual, 
        'with_check', with_check
    ) AS json_output
FROM 
    pg_policies
WHERE 
    schemaname = 'public'

UNION ALL

-- Document all DB Functions
SELECT 
    json_build_object(
        'type', 'Function', 
        'routine_name', routine_name, 
        'return_type', data_type
    ) AS json_output
FROM 
    information_schema.routines 
WHERE 
    specific_schema = 'public'

UNION ALL

-- Document all Triggers
SELECT 
    json_build_object(
        'type', 'Trigger', 
        'trigger_name', tgname, 
        'table_name', relname, 
        'trigger_type', tgtype
    ) AS json_output
FROM 
    pg_trigger t
JOIN 
    pg_class c ON c.oid = t.tgrelid
WHERE 
    c.relnamespace = 'public'::regnamespace

UNION ALL

-- Document all Buckets
SELECT 
    json_build_object(
        'type', 'Bucket', 
        'bucket_name', name, 
        'created_at', created_at
    ) AS json_output
FROM 
    storage.buckets;
