USE brazil_fooddelivery;
DROP PROCEDURE IF EXISTS dwarehousing_ETL;
DELIMITER //
CREATE PROCEDURE dwarehousing_ETL()

BEGIN
DROP TABLE IF EXISTS dwarehousing_orders;
CREATE TABLE dwarehousing_orders AS 
SELECT

orders.order_id AS OrderID,
orders.order_amount AS OrderAmount,
orders.order_status AS OrderStatus,
orders.order_delivery_cost AS DeliveryCost,
orders.order_delivery_fee AS DeliveryFee,
orders.order_created_day AS Created_Day,
orders.order_created_month AS Created_Month,
orders.order_created_year AS Created_Year,
orders.order_moment_created AS Created_Date,
payments.payment_method AS PaymentMethod,
payments.payment_status AS PaymentStatus,
payments.payment_amount AS PaymentAmount,
deliveries.delivery_status AS DeliveryStatus,
deliveries.delivery_distance_meters AS DeliveryDistance,
deliveries.delivery_id AS DeliveryID,
stores.store_id AS StoreID,
stores.store_name AS StoreName,
stores.store_segment AS StoreSegment,
channels.channel_id AS ChannelID,
channels.channel_name AS ChannelName,
channels.channel_type AS ChannelType

FROM orders
INNER JOIN payments using(payment_order_id)
INNER JOIN deliveries using(delivery_order_id)
INNER JOIN stores using(store_id)
INNER JOIN channels using(channel_id)
ORDER BY order_id;

END //
DELIMITER ;

CALL dwarehousing_ETL();