import requests
import json

class CrawlerPipeline(object):
    
    def __send_slack(self, msg):
        WEBHOOK_URL = "https://hooks.slack.com/services/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"
        payload = {
            "channel": "#rada",
            "username": "PDJ",
            "text": msg,
        }
        requests.post(WEBHOOK_URL, json.dumps(payload))
        
    def process_item(self, item, spider):
        keyword = "세트"
        print("="*100)
        print(item["title"], keyword)
        print("="*100)
        if keyword in item["title"]:
            self.__send_slack("{},{},{}".format(
                item["title"], item["s_price"], item["link"]))
        return item
