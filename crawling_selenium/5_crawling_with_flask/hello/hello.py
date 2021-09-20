from flask import *

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

@app.route("/user/<name>")
def user(name):
    return render_template('index.html', name=name)

@app.route('/api/data')
def api_data():
    data = {"noel":25, "mei": 25}
    return jsonify(data)

app.run(debug=True)
