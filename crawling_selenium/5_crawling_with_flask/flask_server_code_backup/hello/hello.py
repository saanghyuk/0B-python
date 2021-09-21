from flask import *
import os
import pickle
import numpy as np

app = Flask(__name__)




path= os.path.dirname(os.path.realpath(__file__))
with open("{}/model/clf.pkl".format(path), "rb") as f:
    model = pickle.load(f)

    

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

@app.route('/api/predic')
def predic():
    result = {"code": 200}  
    
    sentence = request.values.get("sentence")
    print(sentence)
    result['sentence'] = sentence
    result['category']= ["정치", "경제", "사회", "생활/문화", "세계", "IT/과학"]
    result["result"] = np.round_(model.predict_proba([sentence])[0]*100, 2).tolist()
    
    print(result)
    print(type(result))
    
    return jsonify(result)

app.run(debug=True)
