-- Q5. How does purchasing behavior differ between subscribers and non-subscribers?

SELECT
    subscription_status,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount,
    ROUND(SUM(purchase_amount), 2) AS total_revenue,
    ROUND(AVG(previous_purchases), 2) AS avg_previous_purchases
FROM customer
GROUP BY subscription_status
ORDER BY avg_purchase_amount DESC;



-- Q6. Which products have the highest discount utilization?

SELECT
    item_purchased,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)
        AS discounted_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS discount_utilization_pct,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount
FROM customer
GROUP BY item_purchased
HAVING COUNT(*) >= 20
ORDER BY discount_utilization_pct DESC
LIMIT 5;



-- Q7. How are customers distributed across engagement segments?

WITH customer_segments AS (
    SELECT
        customer_id,
        previous_purchases,
        CASE
            WHEN previous_purchases = 1 THEN 'New'
            WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
            ELSE 'Loyal'
        END AS customer_segment
    FROM customer
)
SELECT
    customer_segment,
    COUNT(*) AS transaction_count,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(AVG(previous_purchases), 2) AS avg_previous_purchases
FROM customer_segments
GROUP BY customer_segment
ORDER BY
    CASE customer_segment
        WHEN 'New' THEN 1
        WHEN 'Returning' THEN 2
        WHEN 'Loyal' THEN 3
    END;



-- Q8. What are the top 3 products by transaction volume within each category?

WITH product_volume AS (
    SELECT
        category,
        item_purchased,
        COUNT(*) AS total_transactions
    FROM customer
    GROUP BY category, item_purchased
),
ranked_products AS (
    SELECT
        category,
        item_purchased,
        total_transactions,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_transactions DESC
        ) AS product_rank
    FROM product_volume
)
SELECT
    category,
    product_rank,
    item_purchased,
    total_transactions
FROM ranked_products
WHERE product_rank <= 3
ORDER BY category, product_rank, item_purchased;