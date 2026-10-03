-- Q1. How does revenue and average purchase value differ by gender?

SELECT
    gender,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(purchase_amount), 2) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount
FROM customer_behavior
GROUP BY gender
ORDER BY total_revenue DESC;



-- Q2. Which discounted purchases exceeded the overall average purchase value?

WITH overall_metrics AS (
    SELECT
        AVG(purchase_amount) AS overall_avg_purchase
    FROM customer_behavior
)
SELECT
    c.customer_id,
    c.item_purchased,
    c.category,
    c.purchase_amount,
    ROUND(m.overall_avg_purchase, 2) AS overall_avg_purchase
FROM customer_behavior AS c
CROSS JOIN overall_metrics AS m
WHERE c.discount_applied = 'Yes'
  AND c.purchase_amount > m.overall_avg_purchase
ORDER BY c.purchase_amount DESC;



-- Q3. Which products have the highest average customer ratings?

WITH product_ratings AS (
    SELECT
        item_purchased,
        COUNT(review_rating) AS rating_count,
        ROUND(AVG(review_rating), 2) AS avg_rating
    FROM customer_behavior
    WHERE review_rating IS NOT NULL
    GROUP BY item_purchased
),
ranked_products AS (
    SELECT
        *,
        DENSE_RANK() OVER (
            ORDER BY avg_rating DESC
        ) AS rating_rank
    FROM product_ratings
)
SELECT
    rating_rank,
    item_purchased,
    rating_count,
    avg_rating
FROM ranked_products
WHERE rating_rank <= 5
ORDER BY rating_rank, item_purchased;



-- Q4. How does purchase value differ between Standard and Express shipping?

SELECT
    shipping_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(purchase_amount), 2) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount
FROM customer_behavior
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type
ORDER BY avg_purchase_amount DESC;




