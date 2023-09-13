CREATE TABLE IF NOT EXISTS users
(
	uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email VARCHAR(40) NOT NULL,
    password VARCHAR(40) NOT NULL    
);

INSERT INTO USERS VALUES (1, 'admin@admin.com', 'admin');

CREATE TABLE IF NOT EXISTS posts
(
	pid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    brief VARCHAR(300),
    body VARCHAR(1000),
    image VARCHAR(1000),
    uid INT,
    FOREIGN KEY (uid) REFERENCES users(uid)
);

INSERT INTO posts VALUES(
1, 'TITLE1', 'BRIEF1', 'BODY1', NULL, 1
);

CREATE TABLE IF NOT EXISTS comments
(
	cid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    pid INT,
    uid INT,
    body VARCHAR(1000),
    FOREIGN KEY (pid) REFERENCES posts(pid),
    FOREIGN KEY (uid) REFERENCES users(uid)
);

INSERT INTO COMMENTS VALUES(1, 1, 1, 'COMMENT1');
INSERT INTO COMMENTS VALUES(2, 1, 1, 'COMMENT2');

INSERT INTO posts(title, brief, body, image, uid) VALUES( 
 'This is the first post ever in the blog!',
 'This applications purpose is solely to test some webdev stuff in python',
 'This applications purpose is solely to test some webdev stuff in python,This applications purpose is solely to test some webdev stuff in python
 This applications purpose is solely to test some webdev stuff in pythonThis applications purpose is solely to test some webdev stuff in python
 This applications purpose is solely to test some webdev stuff in pythonThis applications purpose is solely to test some webdev stuff in pythonThis applications purpose is 
 solely to test some webdev stuff in python',
 'https://news.bit2me.com/wp-content/uploads/2023/04/Twitter-cambio-su-logotipo-al-de-Dogecoin.webp',
 1
);

INSERT INTO posts(title, brief, body, image, uid) VALUES( 
 'This is the secont post ever in the blog!',
 'This applications purpose is solely to test some webdev stuff in python',
 'This applications purpose is solely to test some webdev stuff in python,This applications purpose is solely to test some webdev stuff in python
 This applications purpose is solely to test some webdev stuff in pythonThis applications purpose is solely to test some webdev stuff in python
 This applications purpose is solely to test some webdev stuff in pythonThis applications purpose is solely to test some webdev stuff in pythonThis applications purpose is 
 solely to test some webdev stuff in python',
 'https://image.ondacero.es/clipping/cmsimages01/2023/04/04/3F0B5016-E35C-4604-B621-9EF27EFD7C4C/que-dogecoin-nuevo-logo-que-elon-musk-puesto-twitter_97.jpg?crop=488,275,x0,y50&width=1600&height=900&optimize=high&format=webply',
 1
);
INSERT INTO posts(title, brief, body, image, uid) VALUES( 
 'Thn the blog!',
 'This ao test some webdev stuff in python',
 'This applicationt some webdev stuff in python,This applications purpose is solely to test some webdev stuff in python
 This appliconThis applications purpose is solely to test some webdev stuff in python
 This athonThis applications purpose is solely to test some webdev stuff in pythonThis applications purpose is 
 solely to test some webdev stuff in python',
 'https://image.ondacero.es/clipping/cmsimages01/2023/04/04/3F0B5016-E35C-4604-B621-9EF27EFD7C4C/que-dogecoin-nuevo-logo-que-elon-musk-puesto-twitter_97.jpg?crop=488,275,x0,y50&width=1600&height=900&optimize=high&format=webply',
 1
);

SELECT * FROM POSTS;
DELETE FROM posts WHERE pid = 2;
DELETE FROM comments WHERE pid = 2;

SELECT * FROM comments;
INSERT INTO COMMENTS(pid, uid, body) VALUES(3, 1, 'Nice 1 post !');
INSERT INTO COMMENTS(pid, uid, body) VALUES(3, 1, 'Nice 2 post !');
INSERT INTO COMMENTS(pid, uid, body) VALUES(3, 1, 'Nice 3 post !');
INSERT INTO COMMENTS(pid, uid, body) VALUES(3, 1, 'Nice 4 post !');
INSERT INTO COMMENTS(pid, uid, body) VALUES(3, 1, 'Nice 5 post !');

COMMIT;
