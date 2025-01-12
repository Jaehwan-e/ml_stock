import asyncio
from api_caller.local_stock import (
    inquire_price,
    inquire_ccnl,
    inquire_asking_price_exp_ccn,
    inquire_investor,
    inquire_member
)
from utils.time_getter import get_min, get_yyyymmdd


async def inquire_price_data(token, stock_codes):
    """
    비동기적으로 여러 주식 코드에 대해 데이터를 가져오는 함수.
    :param token: API 호출에 필요한 인증 토큰
    :param stock_codes: 데이터를 가져올 주식 코드 리스트
    :return: 주식 코드와 관련된 데이터 또는 예외가 담긴 리스트
    """
    min = get_min()
    yyyymmdd = get_yyyymmdd()

    results = []  # 최종 결과를 저장할 리스트

    # 각 주식 코드에 대해 get_inquire_price 작업 생성
    tasks = [
        inquire_price(token, code) for code in stock_codes
    ]

    # asyncio.gather로 모든 작업을 병렬 실행
    gather_results = await asyncio.gather(*tasks, return_exceptions=True)

    # 각 작업의 결과를 처리
    for code, result in zip(stock_codes, gather_results):
        result = result['output']
        if isinstance(result, Exception):  # 작업 실패 (예외 발생)
            continue
            results.append({"code": code, "error": str(result)})  # 실패 결과 저장
        else:  # 작업 성공
            result['code'] = code  # 결과에 주식 코드 추가
            result['min'] = min  # 결과에 분 추가
            result['yyyymmdd'] = yyyymmdd
            results.append(result)  # 성공 결과 저장

    return results  # 최종 결과 반환


async def inquire_ccnl_data(token, stock_codes):
    """
    비동기적으로 여러 주식 코드에 대해 체결 데이터를 가져오는 함수.
    :param token: API 호출에 필요한 인증 토큰
    :param stock_codes: 데이터를 가져올 주식 코드 리스트
    :return: 주식 코드와 관련된 데이터 또는 예외가 담긴 리스트
    """
    min = get_min()
    yyyymmdd = get_yyyymmdd()

    results = []
    tasks = [
        inquire_ccnl(token, code) for code in stock_codes
    ]

    gather_results = await asyncio.gather(*tasks, return_exceptions=True)

    for code, result in zip(stock_codes, gather_results):
        result = result['output'][0]
        
        if isinstance(result, Exception):
            continue
            results.append({"code": code, "error": str(result)})
        else:
            result['code'] = code
            result['min'] = min
            result['yyyymmdd'] = yyyymmdd
            results.append(result)

    return results


async def inquire_asking_price_exp_ccn_data(token, stock_codes):
    """
    비동기적으로 여러 주식 코드에 대해 호가 데이터를 가져오는 함수.
    :param token: API 호출에 필요한 인증 토큰
    :param stock_codes: 데이터를 가져올 주식 코드 리스트
    :return: 주식 코드와 관련된 데이터 또는 예외가 담긴 리스트
    """
    min = get_min()
    yyyymmdd = get_yyyymmdd()

    results = []
    tasks = [
        inquire_asking_price_exp_ccn(token, code) for code in stock_codes
    ]

    gather_results = await asyncio.gather(*tasks, return_exceptions=True)

    for code, result in zip(stock_codes, gather_results):
        result = {**result['output1'], **result['output2']}

        if isinstance(result, Exception):
            continue
            results.append({"code": code, "error": str(result)})
        else:
            result['code'] = code
            result['min'] = min
            result['yyyymmdd'] = yyyymmdd
            results.append(result)

    return results


async def inquire_investor_data(token, stock_codes):
    """
    비동기적으로 여러 주식 코드에 대해 투자자 데이터를 가져오는 함수.
    :param token: API 호출에 필요한 인증 토큰
    :param stock_codes: 데이터를 가져올 주식 코드 리스트
    :return: 주식 코드와 관련된 데이터 또는 예외가 담긴 리스트
    """
    min = get_min()
    yyyymmdd = get_yyyymmdd()

    results = []
    tasks = [
        inquire_investor(token, code) for code in stock_codes
    ]

    gather_results = await asyncio.gather(*tasks, return_exceptions=True)

    for code, result in zip(stock_codes, gather_results):
        result = result['output'][0]

        if isinstance(result, Exception):
            continue
            results.append({"code": code, "error": str(result)})
        else:
            result['code'] = code
            result['min'] = min
            result['yyyymmdd'] = yyyymmdd
            results.append(result)

    return results


async def inquire_member_data(token, stock_codes):
    """
    비동기적으로 여러 주식 코드에 대해 회원 데이터를 가져오는 함수.
    :param token: API 호출에 필요한 인증 토큰
    :param stock_codes: 데이터를 가져올 주식 코드 리스트
    :return: 주식 코드와 관련된 데이터 또는 예외가 담긴 리스트
    """
    min = get_min()
    yyyymmdd = get_yyyymmdd()

    results = []
    tasks = [
        inquire_member(token, code) for code in stock_codes
    ]

    gather_results = await asyncio.gather(*tasks, return_exceptions=True)

    for code, result in zip(stock_codes, gather_results):
        result = result['output']

        if isinstance(result, Exception):
            continue
            results.append({"code": code, "error": str(result)})
        else:
            result['code'] = code
            result['min'] = min
            result['yyyymmdd'] = yyyymmdd
            results.append(result)

    return results
