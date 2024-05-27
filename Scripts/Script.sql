USE university; -- Replace YourDatabaseName with the name of your database

SELECT 
    [name] AS TriggerName,
    OBJECT_SCHEMA_NAME(parent_id) AS SchemaName,
    OBJECT_NAME(parent_id) AS TableName,
    [type_desc] AS TriggerType,
    create_date AS CreationDate,
    modify_date AS LastModifiedDate,
    OBJECT_DEFINITION(object_id) AS Definition
FROM sys.triggers;
