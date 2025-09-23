# Key Value databases

1
- Geen gebruik van SQL
- ACID properties ?
- It can also be hierachrisch. A key can also be seen a 'file-path' to a value
- Example is the Windows registry. So, the concept is not new.

2
- You must develop a convention for the key to 'group' related values. e.g. key 'customer:55', 'customer:60'.
- It does not have a schema, the value can be stored in different data-types.
-   The value can be simply a string / number / boolean / etc.
-   The value can also be stored as a JSON document --> Key - document database. Ideal for non-structured/semi-structured data.\

3  
- Three main methods (put/get/delete) to manage the data. 
- What is the difference with a cache
  
