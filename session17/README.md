# notes for session 17 Polybase

## Usecase

A key use case for data virtualization with the PolyBase feature is to allow the data to stay in its original location and format. You can virtualize the external data through the SQL Server instance, so that it can be queried in place like any other table in SQL Server. This process minimizes the need for ETL processes (ETL is a process that extracts, transforms, and loads data from multiple sources to a data warehouse or other unified data repository.) for data movement. This data virtualization scenario is possible with the use of PolyBase connectors.



## PolyBase uses
### PolyBase enables the following scenarios in SQL Server:

* Query data stored in Hadoop from a SQL Server instance or PDW. Users are storing data in cost-effective distributed and scalable systems, such as Hadoop. PolyBase makes it easy to query the data by using T-SQL.

* Query data stored in Azure blob storage. Azure blob storage is a convenient place to store data for use by Azure services. PolyBase makes it easy to access the data by using T-SQL.

* Import data from Hadoop, Azure blob storage, or Azure Data Lake Store. Leverage the speed of Microsoft SQL's columnstore technology and analysis capabilities by importing data from Hadoop, Azure blob storage, or Azure Data Lake Store into relational tables. There is no need for a separate ETL or import tool.

* Export data to Hadoop, Azure blob storage, or Azure Data Lake Store. Archive data to Hadoop, Azure blob storage, or Azure Data Lake Store to achieve cost-effective storage and keep it online for easy access.

* Integrate with BI tools. Use PolyBase with Microsoft's business intelligence and analysis stack, or use any third-party tools that are compatible with SQL Server.