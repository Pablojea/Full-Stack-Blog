from flask import Flask
from flask import render_template
from Dbm import Dbm

app = Flask(__name__)
db = Dbm()


@app.route('/')
@app.route('/home')
def home():
    return render_template('home.html', all_posts=db.get_all_posts())


@app.route('/login')
def login():
    return render_template('login.html')


@app.route('/singup')
def singup():
    return render_template('singup.html')


@app.route('/about')
def about():
    return render_template('about.html')


@app.route('/post')
def post():
    return render_template('post.html')


@app.route('/user')
def user():
    return render_template('user.html')


if __name__ == '__main__':
    app.run(
        debug=True,
        host='127.0.0.1',
        port=5000
    )


