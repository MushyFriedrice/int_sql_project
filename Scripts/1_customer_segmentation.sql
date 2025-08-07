WITH customer_ltv AS (
SELECT 
	customerkey,
	cleaned_name,
	sum(total_net_revenue) AS total_ltv
FROM cohort_analysis 
GROUP BY 
	customerkey,
	cleaned_name
), customer_segments as(
	SELECT 
		PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_ltv) AS ltv_25th_percentile,
		PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_ltv) AS ltv_75th_percentile
	FROM customer_ltv 
), segment_value as(
	SELECT 
		c.*,
		CASE 
			WHEN c.total_ltv < cs.ltv_25th_percentile THEN '1_low_value'
			WHEN c.total_ltv < cs.ltv_75th_percentile THEN '2_mid_value'
			ELSE '3_high_value'
		END AS customer_segment
	FROM customer_ltv c,
		customer_segments cs
)
SELECT 
	customer_segment,
	sum(total_ltv) AS total_spent,
	count(customerkey) AS total_people,
	sum(total_ltv)/count(customerkey) AS avg_spent
FROM segment_value 
GROUP BY customer_segment 
ORDER BY customer_segment DESC 