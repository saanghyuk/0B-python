import scrapy

class PlaynomoreItem(scrapy.Item):
    title = scrapy.Field()
    price = scrapy.Field()
    img = scrapy.Field()
    link = scrapy.Field()
