import pandas as pd
import requests
import geohash2

def crawling_apt(addr):
    # 동이름 -> 위도, 경도
    serviceType = "아파트"
    url = "https://apis.zigbang.com/v2/search?leaseYn=N&q={}&serviceType={}".format(addr, serviceType)
    
    response = requests.get(url)
    data = response.json()["items"][0]
    lat, lng = data["lat"], data["lng"]

    # 위도, 경도 -> geohash
    geohash = geohash2.encode(lat, lng, precision=5)
    
    # geohash -> ids
    url = "https://apis.zigbang.com/property/apartments/items?domain=zigbang&geohash={}&q=type=sales%7Cprice=0~-1%7CfloorArea=0~-1".format(geohash)
    response = requests.get(url)
    datas = response.json()["items"]
    ids = [data["itemId"] for data in datas]
    
    # ids -> items : 200개씩
    dfs = []
    for idx in range(0, len(ids), 200):
        start, end = idx, idx + 200
        ids_str = str(ids[start:end]).replace(" ", "")
        url = "https://apis.zigbang.com/property/apartments/items?vritemIds={ids}&itemIds{ids}&citemIds={ids}".format(ids=ids_str)
        response = requests.get(url)
        datas = response.json()["items"]
        item_df = pd.DataFrame(datas)
        columns = ["itemId", "buildingFloor", "groupedItemFloor", "grossArea", "lat", "lng", "sales", "itemTitle"]
        item_df = item_df[columns]
        
        item_df["m2"] = item_df["grossArea"].apply(lambda data: data["m2"])
        item_df["p"] = item_df["grossArea"].apply(lambda data: data["p"])
        item_df.drop(columns=["grossArea"], inplace=True)
        
        dfs.append(item_df)
    
    result_df = pd.concat(dfs)
    result_df.reset_index(drop=True, inplace=True)
    
    return result_df
