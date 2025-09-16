## Resources for further learning
For more in depth information about Indexing, Materialized views, Query optimization and Caching, the following resources could help.


### Caching

#### 🔬 Vendor Sources

| Source | Vendor / Author | Summary |
|--------|-----------------|---------|
| [Database Caching Strategies Using Redis (AWS Whitepaper)](https://docs.aws.amazon.com/whitepapers/latest/database-caching-strategies-using-redis/caching-patterns.html) | AWS / Redis | Explains cache-aside and write-through with pros/cons. |
| [Redis – Caching Solutions](https://redis.io/solutions/caching/) | Redis | Defines cache-aside, write-through, and write-behind. |
| [Azure Architecture Center – Cache-Aside Pattern](https://learn.microsoft.com/en-us/azure/architecture/patterns/cache-aside) | Microsoft Azure | Focuses on cache-aside (lazy loading) pattern. |
| [Amazon ElastiCache – Caching Strategies](https://docs.aws.amazon.com/AmazonElastiCache/latest/dg/Strategies.html) | AWS / ElastiCache | Covers write-through and lazy loading strategies. |
| [A Hitchhiker’s Guide to Caching Patterns](https://hazelcast.com/blog/a-hitchhikers-guide-to-caching-patterns/) | Hazelcast | Overview of cache-aside, read-through, and write-through. |
| [Top 5 Caching Strategies Explained](https://blog.algomaster.io/p/top-5-caching-strategies-explained) | Algomaster (blog) | Explicitly describes write-around strategy. |

> 💡 **Note:**  
> The terms *cache-aside*, *write-through*, *write-back*, and *write-around* are widely used in practice, but they are **not formally standardized**. Different vendors (AWS, Redis, Azure, Hazelcast) may use slightly different descriptions. Always specify what you mean in your own design or documentation.

#### 🔬 Academic & Peer-Reviewed Sources

| Source | Venue / Year | Summary |
|--------|--------------|---------|
| [A Qualitative Study of Application-Level Caching — Mertz & Nunes](https://arxiv.org/abs/2011.00242) | arXiv preprint, 2020 | Empirical study of how developers implement and maintain cache-aside patterns in real-world projects. |


