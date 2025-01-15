import asyncio
from datetime import datetime, timedelta
import pytz
from api_caller.token import get_token
from utils.date_checker import is_xkrx_session_today
from controllers.data_saver import save_all_data

async def task(token, stock_codes):
    """
    실행할 작업을 정의합니다.
    """
    print(f"Task started at: {datetime.now(pytz.timezone('Asia/Seoul'))}")
    await save_all_data(token, stock_codes)
    print(f"Task completed at: {datetime.now(pytz.timezone('Asia/Seoul'))}")

async def iterator_10m(start_time, end_time, token, stock_codes):
    """
    10분 단위로 작업(task)을 실행하는 iterator.
    지정된 시간 범위 내에서 실행합니다.
    """
    seoul_tz = pytz.timezone("Asia/Seoul")
    now = datetime.now(seoul_tz)

    # 현재 시간 기준으로 가장 가까운 10분 단위의 10초 설정
    next_run = now + timedelta(minutes=10 - now.minute % 10)
    next_run = next_run.replace(second=10, microsecond=0)

    while next_run <= end_time:
        now = datetime.now(seoul_tz)  # 현재 시간 갱신

        if next_run <= now:
            await task(token, stock_codes)  # 비동기 작업 실행

            # 다음 실행 시간을 가장 가까운 10분 단위로 설정
            next_run += timedelta(minutes=10)

        # 다음 실행 시점까지 대기
        sleep_time = (next_run - datetime.now(seoul_tz)).total_seconds()
        if sleep_time > 0:
            await asyncio.sleep(sleep_time)

async def main_iterator(token, stock_codes):
    """
    전체 작업 관리.
    조건을 확인하여 작업 실행.
    """
    seoul_tz = pytz.timezone("Asia/Seoul")

    while True:
        now = datetime.now(seoul_tz)

        # 작업 시간 설정
        start = now.replace(hour=9, minute=0, second=10, microsecond=0)
        end = now.replace(hour=15, minute=30, second=10, microsecond=0)
        # morning_start = now.replace(hour=9, minute=0, second=10, microsecond=0)
        # morning_end = now.replace(hour=12, minute=0, second=10, microsecond=0)
        # afternoon_start = now.replace(hour=13, minute=30, second=10, microsecond=0)
        # afternoon_end = now.replace(hour=15, minute=30, second=10, microsecond=0)

        if is_xkrx_session_today():  # 주식 거래일인지 확인
            print("Today is a valid trading session.")
            token = get_token(token)

            # 작업 실행
            now = datetime.now(seoul_tz)  # 현재 시간 갱신
            if now < start:
                # 작업 시작 시간까지 대기
                sleep_time = (start - now).total_seconds()
                print(f"Waiting {int(sleep_time // 3600)} hours {int((sleep_time % 3600) // 60)} minutes {int(sleep_time % 60)} seconds for morning session to start...")
                await asyncio.sleep(sleep_time)
                now = datetime.now(seoul_tz)  # 대기 후 시간 갱신

            if start <= now <= end:
                print(f"Starting session at {now}")
                await iterator_10m(max(start, now), end, token, stock_codes)


            # # 오전 작업 실행
            # now = datetime.now(seoul_tz)  # 현재 시간 갱신
            # if now < morning_start:
            #     # 오전 작업 시작 시간까지 대기
            #     sleep_time = (morning_start - now).total_seconds()
            #     print(f"Waiting {int(sleep_time // 3600)} hours {int((sleep_time % 3600) // 60)} minutes {int(sleep_time % 60)} seconds for morning session to start...")
            #     await asyncio.sleep(sleep_time)
            #     now = datetime.now(seoul_tz)  # 대기 후 시간 갱신

            # if morning_start <= now <= morning_end:
            #     print(f"Starting morning session at {now}")
            #     await iterator_10m(max(morning_start, now), morning_end, token, stock_codes)

            # # 오후 작업 실행
            # now = datetime.now(seoul_tz)  # 시간 갱신
            # if now <= afternoon_end:
            #     if now < afternoon_start:
            #         # 오후 작업 시작 시간까지 대기
            #         sleep_time = (afternoon_start - now).total_seconds()
            #         print(f"Waiting {sleep_time} seconds for afternoon session to start...")
            #         await asyncio.sleep(sleep_time)
            #         now = datetime.now(seoul_tz)  # 대기 후 시간 갱신
            #     print(f"Starting afternoon session at {now}")
            #     await iterator_10m(afternoon_start, afternoon_end, token, stock_codes)
        else:
            print("Today is not a valid trading session.")

        print("Waiting until next day to recheck the condition...")
        # 하루 종료 후 자정까지 대기
        now = datetime.now(seoul_tz)
        next_day = (now + timedelta(days=1)).replace(hour=0, minute=0, second=0, microsecond=0)
        sleep_time = (next_day - now).total_seconds()
        await asyncio.sleep(sleep_time)
