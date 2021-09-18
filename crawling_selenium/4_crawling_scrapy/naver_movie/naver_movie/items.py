import scrapy

class NaverMovieItem(scrapy.Item):
    title = scrapy.Field()
    count = scrapy.Field()
    star = scrapy.Field()
