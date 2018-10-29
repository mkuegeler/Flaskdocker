# Flask sample web app
# start with python2 server.py

from flask import Flask, request
app = Flask(__name__, static_url_path='')

@app.route('/')
def root():
    return app.send_static_file('index.html')

if __name__ == '__main__':
  app.run(debug=True, host='0.0.0.0')