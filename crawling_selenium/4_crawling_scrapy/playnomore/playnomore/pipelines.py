from .mongodb import collection

class PlaynomorePipeline(object):
    
    def process_item(self, item, spider):
        
        data = { "title": item["title"], 
                 "price": item["price"],
                 "img": item["img"], 
                 "link": item["link"],
               }
        
        collection.insert(data)
        
        return item
