--Q1. ¿Cuáles son los ingresos totales generados por clientes hombres frente a mujeres?
SELECT gender, SUM(purchase_amount) AS REVENUE
FROM [dbo].[customer]
GROUP BY gender
--Q2. ¿Qué clientes utilizaron un descuento pero aun así gastaron más que el monto promedio de compra?
SELECT customer_id, purchase_amount
FROM [dbo].[customer]
WHERE discount_applied = 'YES' AND purchase_amount >= (SELECT AVG(purchase_amount) FROM [dbo].[customer])
--Q3. ¿Cuáles son los 5 productos principales con la calificación promedio de reseñas más alta?
SELECT TOP 5 item_purchased, ROUND(AVG(review_rating),2) AS "Average Product Rating"
FROM [dbo].[customer]
GROUP BY item_purchased
ORDER BY AVG(review_rating) DESC
--Q4. Compara los montos promedio de compra entre el envío estándar y el envío exprés.
SELECT shipping_type, AVG(purchase_amount) AS Purchase_amount_avg
FROM [dbo].[customer]
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type
--Q5. ¿Los clientes suscritos gastan más? Compara el gasto promedio y los ingresos totales entre suscriptores y no suscriptores.
SELECT subscription_status, COUNT(customer_id) AS TOTAL_CUSTOMERS, AVG(purchase_amount) AS AVG_SPEND, SUM(purchase_amount) AS TOTAL_REVENUE
FROM [dbo].[customer]
GROUP BY subscription_status
ORDER BY TOTAL_REVENUE, AVG_SPEND DESC;
--Q6. ¿Qué 5 productos tienen el porcentaje más alto de descuentos aplicados?
--Agrupar los artículos y calcular el porcentaje de veces que se aplicó un descuento con respecto al número total de veces que se
-- vendió ese artículo.Interpretación, si un sombrero se vendió 10 veces, el 50% de las veces es decir 5 se vendió con descuento.
SELECT TOP 5 item_purchased, ROUND(100 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/COUNT(*), 2) AS DISCOUNT_RATE
FROM [dbo].[customer]
GROUP BY item_purchased
ORDER BY DISCOUNT_RATE DESC;
--Q7. Segmenta a los clientes en Nuevos, Recurrentes y Leales según su número total de compras anteriores, y muestra el recuento de cada segmento.
WITH CUSTOMER_TYPE AS (
SELECT customer_id, previous_purchases,
CASE 
     WHEN previous_purchases = 1 THEN 'NEW'
     WHEN previous_purchases BETWEEN 2 AND 10 THEN 'RETURNING'
     ELSE 'LOYAL'
     END AS CUSTOMER_SEGMENT                   --Terminaremos llamandolo segmento de clientes
FROM [dbo].[customer]
)

SELECT CUSTOMER_SEGMENT, COUNT(*) AS 'NUMBER OF CUSTOMER'
FROM CUSTOMER_TYPE
GROUP BY CUSTOMER_SEGMENT
--Q8. ¿Cuáles son los 3 productos más comprados dentro de cada categoría?
WITH ITEM_COUNTS AS (
SELECT category, item_purchased, COUNT(customer_id) AS TOTAL_ORDERS,
ROW_NUMBER() OVER (PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS ITEM_RANK
FROM [dbo].[customer]
GROUP BY category, item_purchased
)
SELECT ITEM_RANK, category,item_purchased, TOTAL_ORDERS
FROM ITEM_COUNTS
WHERE ITEM_RANK <= 3;
--Q9. ¿Los clientes que son compradores frecuentes (más de 5 compras anteriores) también tienen probabilidades de suscribirse?
SELECT subscription_status, COUNT(customer_id) AS repeat_buyers
FROM [dbo].[customer]
WHERE previous_purchases > 5
GROUP BY subscription_status
--Q10. ¿Cuál es la contribución a los ingresos de cada grupo de edad?
SELECT age_group, SUM(purchase_amount) AS TOTAL_RENEVUE
FROM [dbo].[customer]
GROUP BY age_group
ORDER BY TOTAL_RENEVUE DESC;