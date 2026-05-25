-- Highest Rated Clothing Type
select p.category , round(avg(r.Rating),2) as avg_rating  from product p 
join review r on p.Item_id = r.Item_id
group by category
order by avg_rating desc;

-- Most Reviewed Category
select p.category , count(r.Review_text) as most_reviewed from product p
join review r on p.Item_id=r.Item_id
group by category
order by most_reviewed desc
limit 1;

-- Products With Low Ratings
select p.Item_id,p.class_name , r.Rating  from product p
join review r on p.Item_id=r.Item_id
where r.Rating<=2 ;

-- Average Rating by Age Group
select c.Age , round(avg(r.Rating),2) as avg_rating  from customer c
join review r on c.customer_id = r.customer_id
group by Age
order by Age;

--  Age Group giving Most Reviews
select c.Age , count(r.Review_text) as Reviews  from customer c
join review r on c.customer_id = r.customer_id
group by Age
order by Reviews desc 
limit 1;

-- Recommended vs Not Recommended Count
select Recommended_IND,count(Recommended_IND) as total_count  from review
group by Recommended_IND;

-- Average Rating for Recommended Products
select Recommended_IND ,round(avg(Rating),2) as avg_rating from review
where Recommended_IND=1;

-- Most Helpful Reviews
select Review_text,posFeedbackCount from review
order by posFeedbackCount desc
limit 10;

-- Most Popular Clothing Class
select class_name, count(class_name) as popular from product
group by class_name
order by popular desc 
limit 1;

-- Category With Highest Recommendation Percentage
select p.category,avg(r.Recommended_IND) *100 as recommendation_percentage from product p
join review r on p.Item_id = r.Item_id
group by category
order by recommendation_percentage desc;

-- Top 5 Highest Rated Products
select p.Clothing_id,p.class_name,round(avg(r.Rating),2) as avg_rating from product p 
join review r on p.Item_id=r.Item_id
group by p.Clothing_id,p.class_name
order by avg_rating desc 
limit 5;

-- Find Negative Reviews
select Review_text,Rating 
from review
where Rating<=2;
