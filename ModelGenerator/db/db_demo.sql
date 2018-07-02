SELECT * FROM t_topic ORDER BY reply_count DESC LIMIT 1,25
UPDATE t_topic SET user_id = (id%4)+1;
UPDATE t_topic SET category_id = (id%10)+1;

SELECT t_topic.*,t_category.`name`AS category_name FROM t_topic
INNER JOIN t_category
ON t_topic.category_id=t_category.`id`
ORDER BY reply_count DESC LIMIT 1,25