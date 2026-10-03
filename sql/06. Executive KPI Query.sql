-- Q15. What are the core KPIs for the executive dashboard?

SELECT
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(purchase_amount), 2) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount,
    ROUND(AVG(review_rating), 2) AS avg_review_rating,
    ROUND(AVG(previous_purchases), 2) AS avg_previous_purchases,
    ROUND(
        100.0 * SUM(CASE WHEN subscription_status = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS subscriber_transaction_share_pct,
    ROUND(
        100.0 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS discounted_transaction_share_pct
FROM customer_behavior;