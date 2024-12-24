from flask import Flask
from time import gmtime, strftime
import time

app = Flask(__name__)

@app.route('/')
def hello_world():
    t = time.strftime("%a, %d %b %Y %I:%M:%S %p %Z", time.gmtime())
    return "Dear Guest, welcome on this simple web page showing the time: " + t

if __name__ == '__main__':
    app.run()
