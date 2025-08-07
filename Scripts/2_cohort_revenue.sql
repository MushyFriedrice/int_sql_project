SELECT 	
	cohort_year,
	count(DISTINCT customerkey) AS total_customers,
	SUM(total_net_revenue ) AS total_revenue,
	SUM(total_net_revenue ) / count(DISTINCT customerkey) AS customer_revenue
FROM cohort_analysis 
GROUP BY 
	cohort_year 