WITH customer_last_purchase as(	
	SELECT 
		customerkey,
		cleaned_name,
		orderdate,
		row_number() OVER (PARTITION BY customerkey ORDER BY orderdate DESC) AS rn,
		first_purchase_date,
		cohort_year
	FROM cohort_analysis 
), churned_customer as(
	SELECT 
		cohort_year,
		customerkey,
		cleaned_name,
		orderdate AS last_purchase,
		CASE 
			WHEN orderdate < (SELECT max(orderdate) FROM sales) - INTERVAL '6 months' THEN 'Churned'
			ELSE 'Active'
		END AS customer_status
	FROM customer_last_purchase 
	WHERE rn = 1
		and first_purchase_date < (SELECT max(orderdate) FROM sales) - INTERVAL '6 months'
)
	SELECT
	cohort_year,
	customer_status, 
	count(customerkey) AS num_customers,
	sum(count(customerkey)) over(PARTITION BY cohort_year) AS total_customers,
	round(count(customerkey)/sum(count(customerkey)) over(PARTITION BY cohort_year), 2) AS status_percentage
FROM churned_customer 
GROUP BY customer_status ,
		cohort_year
	


	