import requests
import json

# send slack message function
def send_slack(msg, WEBHOOK_URL = "https://hooks.slack.com/services/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"):

    payload = {
        "text": msg,
    }
    requests.post(WEBHOOK_URL, json.dumps(payload))

# weather information function
def forcast(lat, lng, TOKEN = "ae3aebe3c0a2041ebe3818985df5b871"):
    url = "https://api.darksky.net/forecast/{}/{},{}".format(TOKEN, lat, lng)
    response = requests.get(url)
    json_obj=response.json()

    return json_obj['currently']['summary']


# Jurong West
lat, lng = 1.339636, 103.707339
msg = forcast(lat, lng)
send_slack(msg)
