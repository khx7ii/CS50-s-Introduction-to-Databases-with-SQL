# From the Deep
## Random Partitioning

Random partitioning involves dividing data into segments randomly without considering any specific attribute or criteria. This method ensures that the data is spread evenly across different partitions, which can help in balancing the load when querying. However, it might lead to inefficiencies in querying because related data might end up in different partitions, requiring additional resources to combine results from multiple partitions.

**Advantages**:
- Data is evenly distributed across all boats, balancing storage and processing loads.

**Disadvantages**:
- Queries for specific time ranges require searching all boats, leading to inefficiency.

## Partitioning by Hour

Partitioning by hour is a time-based partitioning method where data is divided into partitions based on the hour it was generated or received. This is particularly useful for time-series data, where queries are often time-bound (e.g., retrieving data from a specific hour).

**Advantages**:
- Queries for time ranges are efficient, only requiring execution on a specific boat (depending on the time).

**Disadvantages**:
- Imbalanced load across boats due to uneven distribution of observations over the day.

## Partitioning by Hash Value

Partitioning by hash value involves using a hash function to determine the partition into which a piece of data will go. The hash function typically applies to a key attribute, ensuring that data with the same key attribute ends up in the same partition.

**Advantages**:
- Even distribution of data across boats, ensuring balanced storage and compute resources.
- Queries for specific timestamps can be efficiently routed to a single boat.

**Disadvantages**:
- Range queries are inefficient, as the query must run across all boats.
