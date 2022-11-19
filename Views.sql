-- Which month has highest number of orders and payment amount?

DROP VIEW IF EXISTS Monthly_Sales;
create view Monthly_Sales as
select Created_Month, sum(PaymentAmount) as TotalPayment , count(OrderID) as NumberOfOrders
from dwarehousing_orders as dw
group by Created_Month 
order by NumberOfOrders desc;

-- What is the average delivery distance with respect to every store in Kilometers?

DROP VIEW IF EXISTS Average_Delivery_Distance_KM;
	CREATE VIEW Average_Delivery_Distance_KM AS 
    SELECT dwarehousing_orders.storename, 
    AVG(dwarehousing_orders.DeliveryDistance/1000) AS Average_Delivery_Distance_in_KM 
    FROM dwarehousing_orders
    GROUP BY dwarehousing_orders.storename
    ORDER BY Average_Delivery_Distance_in_KM;

-- What are the 5 stores with the highest number of cancelled orders? 

DROP VIEW IF EXISTS HighestCancellation;
CREATE VIEW HighestCancellation as
SELECT Count(DeliveryStatus) AS NumberOfCancelledOrders,StoreName 
FROM dwarehousing_orders AS dw
WHERE DeliveryStatus = 'Cancelled'
GROUP BY StoreName
ORDER BY Count(DeliveryStatus) DESC LIMIT 5;

-- Sales Report for month of choice:

DROP VIEW IF EXISTS `Monthwise_Sales_Report_By_Segment`;

CREATE VIEW `Monthwise_Sales_Report_By_Segment` AS
SELECT 
        Created_month AS CreatedMonth,
        StoreSegment,
        CONCAT(Created_day, ' ', Created_month, ' ', Created_Year) AS Date_Of_Sale,
        ROUND((SELECT(SUM(PaymentAmount)/(COUNT(DISTINCT(OrderID))))),2) AS Unit_Price,
        COUNT(DISTINCT(OrderID)) AS CompletedOrders,
        SUM(PaymentAmount) AS Cumulative_Sale
FROM dwarehousing_orders
GROUP BY Created_month, Created_day, Created_year, StoreSegment;


DROP PROCEDURE IF EXISTS Sales_Report;

DELIMITER //

		CREATE PROCEDURE Sales_Report(
			Month_Of_Sale VARCHAR(15)
		)
		BEGIN

			SELECT * FROM Monthwise_Sales_Report_By_Segment
			WHERE CreatedMonth = Month_Of_Sale;

END //
DELIMITER ;

CALL Sales_Report('February');

-- 