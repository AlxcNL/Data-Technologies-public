# Caching & Connection Pooling

## Caching (TBD)
Caching is a mechanisme to speed-up the read and write operations of data between two parts in a system, in which one part is realtivly slow compared to the other.    
To speed-up read operations fetched or computed data is stored into a temporary storage. Next time the same data is requested it can be fetched from the temporary storage instead of the slower orginal source. To speed-up write operations new or changed data is initially written into the cache and on a later moment stored in the orginal source.  

The data in a cache can become stale. Stale means that the data in the cache is outdated, inaccurate or irrelevant due to changes in the source data.
The data in a cache can also become dirty. Dirty means that the data in the source data is outdated or inaccurate and needs to be overwritten by the data in the cache.  

Met caching hebben we het dan over de caches in PostgreSQL:

| Cache-type         | Niveau        | Voorbeeld                              |
| ------------------ | ------------- | -------------------------------------- |
| OS page cache      | OS            | Filesystem houdt blokken in RAM        |
| shared\_buffers    | PostgreSQL    | Veelgebruikte tabellen/indexen         |
| work\_mem          | PostgreSQL    | Sorts, joins zonder tempfiles          |
| query result cache | Niet aanwezig | Alternatief: materialized view / Redis / memcached / pgpool |
| plan cache         | PostgreSQL    | Via prepared statements/functions      |


Datawarehousing. Tijdeijke data voorbewerken en opslaan in data. (ETL).



## Connection pooling (TBD)
PgPool or PgBouncer ?

PgPool heeft wel een query result cache




