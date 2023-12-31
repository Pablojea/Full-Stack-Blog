import mysql.connector
import os
from Post import Post
from Comment import Comment


class Dbm:

    def __init__(self, host='localhost', user='root', database='postagram'):

        self.host = host
        self.user = user
        self.password = os.environ['mypass']
        self.database = database

        try:
            self.manager = mysql.connector.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.database
            )
            self.cursor = self.manager.cursor()
            print('DB manager instance created successfully')

        except mysql.connector.Error as err:
            print('failed to connect to database: '.format(err))

    def show_all_tables(self):
        self.manager.commit()
        self.cursor.execute('SHOW TABLES')
        for table in self.cursor:
            print(table)

    def get_all_posts(self):
        self.manager.commit()
        self.cursor.execute('SELECT * FROM posts')
        posts = []
        for row in self.cursor:
            posts.append(Post(row[0], row[1], row[2], row[3], row[4], row[5]))
        return posts

    def get_post(self, pid):
        self.manager.commit()
        query = 'SELECT * FROM posts WHERE pid = %s'
        self.cursor.execute(query, (pid,))
        for row in self.cursor:
            return Post(row[0], row[1], row[2], row[3], row[4], row[5])

    def get_post_comments(self, pid):
        self.manager.commit()
        query = 'SELECT * FROM comments WHERE pid = %s'
        self.cursor.execute(query, (pid,))
        comments = []
        for row in self.cursor:
            comments.append(Comment(row[0], row[1], row[2], row[3]))
        print('found this comments:' + str(len(comments)))
        return comments
