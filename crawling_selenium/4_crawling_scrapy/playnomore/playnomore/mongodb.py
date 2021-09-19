import pymongo

client = pymongo.MongoClient('mongodb://54.179.203.15:27017/')
db = client.playnomore
collection = db.apparel
