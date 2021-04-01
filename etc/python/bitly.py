import requests
import sys
import bitlyshortener
from config import *

if len(sys.argv) > 1:
    tokens_pool = [SHORTENER_API_BIT]
    shortener = bitlyshortener.Shortener(tokens=tokens_pool, max_cache_size=256)
    listUrl = [sys.argv[1]]
    GenUrl = shortener.shorten_urls(listUrl)
    if GenUrl:
        for GetUrl in GenUrl:
            print(GetUrl)