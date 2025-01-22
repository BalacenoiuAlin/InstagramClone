SET SQL_SAFE_UPDATES = 0;

CREATE DATABASE instagram;
USE instagram;

CREATE TABLE users
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

DESC users;

DROP TABLE users;

CREATE TABLE photos
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

DROP TABLE photos;

DESC photos;

CREATE TABLE comments 
(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

DROP TABLE comments;

DESC comments;

CREATE TABLE likes
(
	user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

DROP TABLE likes;

DESC likes;

CREATE TABLE follows
(
	follower_id INT,
    followee_id INT,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

DROP TABLE follows;

DESC likes;

CREATE TABLE tags
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

DROP TABLE tags;

DESC tags;

CREATE TABLE photo_tags
(
	photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(photo_id, tag_id)
);

DROP TABLE photo_tags;

DESC photo_tags;
    
    