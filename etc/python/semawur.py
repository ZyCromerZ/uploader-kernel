import requests
import sys
from config import *

if len(sys.argv) > 1:
    url = sys.argv[1]
    url = url.replace('#','%23')
    print('https://semawur.com/st/?api={}%26url={}'.format(SHORTENER_API_SEMAWUR, url) )
    # getResponse = requests.get('https://semawur.com/st/?api={}&url={}'.format(SHORTENER_API_SEMAWUR, url) ,allow_redirects=True)
    # if getResponse.history:
    #     for resp in getResponse.history:
    #         if resp.status_code == 301:
    #             print(resp.url)