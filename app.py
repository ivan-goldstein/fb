from flask import Flask
from datetime import datetime
from zoneinfo import ZoneInfo

server_timezone = "Europe/Berlin"
new_timezone = "Asia/Tbilisi"

app = Flask(__name__)

@app.route('/')
def hello_world():
    current_time = datetime.now(ZoneInfo(server_timezone))
    t = current_time.astimezone(ZoneInfo(new_timezone))
    return "Dear Guest, welcome on this simple web page showing the time: " + str(t)

if __name__ == '__main__':
    app.run()
