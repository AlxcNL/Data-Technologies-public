# Key Value databases

1
- Geen gebruik van SQL
- ACID properties ?
- It can also be hierachrisch. A key can also be seen a 'file-path' to a value
- Example is the Windows registry. So, the concept is not new.

2
- It does not have a fixed schema, for each key the value can be stored in different data-types.
- The value can be simply a string / number / boolean / etc.
- The value can also be stored as a JSON document --> Key - document database. Ideal for non-structured/semi-structured data.

3
- We focus on MongoDB which can be installed locally as a Docker instance. 
- Three main methods (put/get/delete) to manage the data. 
- Search / quering the data
  - Comparsion operators ($eq/$ne/$gt/$lt/etc.)
  - Logical ($and/$or/$nor/$not)
  - Evaluation ($regex/$text/$where) 
  
4
- You must develop a convention for the key to 'group' related values. e.g. key 'customer:55', 'customer:60'.
- It is important to think ahead on the structure of document.
- Patterns: for schema design to support key-value
  - The Polymorphic Pattern
  - The Attribute Pattern


  
