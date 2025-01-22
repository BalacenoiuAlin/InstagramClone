-- Select the first 5 users of instagram
SELECT * 
FROM users 
ORDER BY created_at ASC
LIMIT 5; 

-- Most popular registration date
SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- Inactive users that never posted a photo
SELECT username, image_url 
FROM users
LEFT JOIN photos 
	ON users.id = photos.user_id
WHERE image_url IS NULL;

-- Most likes on a single photo (user, photo)
SELECT 
	users.username,
	photos.id, 
	photos.image_url, 
	COUNT(*) AS likes
FROM photos
INNER JOIN likes
	ON likes.photo_id = photos.id
INNER JOIN users
	ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY likes DESC
LIMIT 1;

-- Average user post
SELECT 
	(SELECT Count(*) FROM   photos) / (SELECT Count(*) FROM   users) AS avg; 
    
-- 5 most used hashtags
SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 

-- Users that liked every single photo 

SELECT * FROM likes;

SELECT 
	username,
    COUNT(*) AS total
FROM users
JOIN likes
	ON likes.user_id = users.id
GROUP BY username
HAVING total = (SELECT COUNT(*) FROM photos);
	

