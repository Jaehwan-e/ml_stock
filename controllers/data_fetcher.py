import asyncio
from utils.db_queries import insert_query
from api_caller.local_stock import get_inquire_price, get_inquire_ccnl, get_inquire_asking_price_exp_ccn, get_inquire_investor, get_inquire_member

async def fetch_inquire_price_data(token, stock_codes):
    result = []
    tasks = [
        get_inquire_price(token, code) for code in stock_codes
    ]
    results = await asyncio.gather(*tasks, return_exceptions=True)

    for code, result in zip(stock_codes, results):
        if isinstance(result, Exception):
            print(f"Stock Code: {code}, Failed with error: {result}")
        else:
            print(f"Stock Code: {code}, Result: {result}")

    return result