import requests
import sys
from config import *

if len(sys.argv) > 1:
    url = sys.argv[1]
    url = url.replace('#','%23')
    getResponse = requests.get('https://exe.io/api?api={}&url={}&format=text'.format(SHORTENER_API_EXE, url))
    print(getResponse.text)