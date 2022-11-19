# Data Engineering Project 1 - Brazil Goods and Deliveries Dataset

The following information is regarding a delivery company in Brazil that delivers both, Food and Goods. The dataset used for this report is ‘Delivery Center: Food & Goods orders in Brazil’ from Kaggle, which has also been uploaded to GitHub for reference. 

## About the Data: 
This dataset contains 7 different tables; 1-fact table and 6-dimension tables named Orders, Deliveries, Drivers, Payments, Stores, Channels and Hubs. The data contains information from 396 different stores during the timeline of January ‘2021 – April ‘2021 and it has recorded a total of 361794 orders. 

## Goal: 
The aim task was to clean and load the data first. After loading, the creation of an optimized central data warehouse was required to perform a smooth and fruitful analysis using the various tables provided by the organization. Furthermore, assessing which variables to utilize and creating data marts. Each step has been explained thoroughly in the report. 

## Operational Layer: 
The data contains seven different tables: Orders, Payments, Deliveries, Drivers, Channels, Stores and Hubs. This data contains observations of 396 stores over the timeline of 
01-01-2021 – 01-04-2021. These tables were joined together and relationships between the tables was created accordingly. The foundation of this layer was mapping out all the existing relationships between the tables and create new ones where deemed necessary. Every table contained a foreign key and a primary key which makes its mapping convenient for the analyst. The keys were defined for every table in addition to specifying which tables can’t have NULL values which led to the schema being finalized for analysis. For reference, EER diagram for the data has been attached below. As it is visible in the diagram, all relationships between tables are one-to-many relationships.  

<img width="986" alt="EER Diagram" src="https://user-images.githubusercontent.com/112099406/202851106-a16f9c06-6fb8-46f1-a44d-e5d87560b06a.png">

## Analytics: 

![ETL](https://user-images.githubusercontent.com/112099406/202851116-264295e3-8c68-4282-acd1-4e8b6f59b515.png)

## Analytical Layer: 
As we move onto the next step, an analytical layer was created which contained the Data Warehouse which was named ‘Dwarehousing_orders’. The ETL pipeline below provides a better understanding of the analytical process from start to end. 

<img width="1251" alt="Tables" src="https://user-images.githubusercontent.com/112099406/202851122-8916cc21-7884-49ed-8257-4656413b91bc.png">

## Data-Warehouse:
My data warehouse consists of 5 dimensions that are comprised of every field that was considered important to carry out the analysis. A stored procedure was created that aimed at joining the tables using inner joins. 

## Data marts: 
Our final step was creating data marts so we can have multiple views that answered our questions and provided valuable information to make key business decisions. 

## View one: Average delivery distance in kilometers. 
This view helps us in understanding which store has the longest delivery distance and provides us information regarding the average distance of each store.

<img width="476" alt="Average delivery distance by stores" src="https://user-images.githubusercontent.com/112099406/202851169-12bcb010-7a05-482b-abe1-cc0c5ca45d45.png">

## View two: Highest cancellation.
The view illustrates the top 5 stores that have the highest number of cancellations. This is very important to understand the root cause of those cancellations and will benefit us in identification and rectification of the problem. 

<img width="392" alt="Highest cancellations by store" src="https://user-images.githubusercontent.com/112099406/202851180-f8acc8ff-d0e5-4bb6-8c38-cc45c10105e2.png">

## View three: Monthly sales.
This view provides us with information regarding sales of all the months ordering them in descending order with respect to the total revenue generated.

<img width="448" alt="Monthly sales" src="https://user-images.githubusercontent.com/112099406/202851190-8027b7f2-ba80-4b32-ba1f-12420202481e.png">

## View four: Month wise sales report categorized by segment. 
A stored procedure was created for this view so we can input our desired month call it accordingly. It contains variables like date of sale, store segment, unit price, number of completed orders and cumulative sale. 

<img width="751" alt="Month wise sales report by segment" src="https://user-images.githubusercontent.com/112099406/202851196-5a0c25a5-789c-4d4c-b9eb-7272b62ad1b5.png">

##### These views provide a better understanding of the dataset and will assist in making key decisions regarding the business while understanding the shortcomings and building a strategy to rectify them. 

