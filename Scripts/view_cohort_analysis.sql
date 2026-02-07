CREATE VIEW cohort_analysis AS  
WITH customer_review as(
	SELECT 
	s.customerkey ,
	s.orderdate ,
	SUM(s.quantity * s.netprice * s.exchangerate),
	 count(s.orderkey) AS num_orders,
	c.countryfull ,
	c.age ,
	c.givenname ,
	c.surname 
	FROM sales s 
	LEFT JOIN customer c ON c.customerkey = s.customerkey
	GROUP BY 
	c.countryfull ,
	c.age ,
	c.givenname ,
	c.surname ,
	s.customerkey,
	s.orderdate
)
SELECT 
cr.*,
MIN(cr.orderdate ) over(PARTITION BY cr.customerkey ) AS first_purchase_date,
extract(YEAR FROM MIN(cr.orderdate ) over(PARTITION BY cr.customerkey )) as cohort_year
FROM  customer_review cr

	