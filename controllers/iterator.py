import time
from datetime import datetime, timedelta
import pytz
from utils.date_checker import is_xkrx_session_today

def task():
    """
    실행할 작업을 정의합니다.
    """
    print(f"Task executed at: {datetime.now(pytz.timezone('Asia/Seoul'))}")

def iterator_10m(start_time, end_time):
    """
    10분 단위로 작업(task)을 실행하는 iterator.
    지정된 시간 범위 내에서 실행합니다.
    """
    next_run = start_time  # 작업 실행 시작 시간
    seoul_tz = pytz.timezone("Asia/Seoul")

    while next_run <= end_time:
        now = datetime.now(seoul_tz)  # 현재 시간 갱신

        # 예정된 실행 시간이 현재 시각보다 과거인 경우에도 작업 실행
        if next_run <= now:
            task()  # 작업 실행
            next_run += timedelta(minutes=10)  # 다음 실행 시점 갱신

        # 다음 실행 시점까지 대기
        sleep_time = (next_run - datetime.now(seoul_tz)).total_seconds()
        if sleep_time > 0:
            time.sleep(sleep_time)

def iterator_1d(target_date, morning_start, morning_end, afternoon_start, afternoon_end):
    """
    하루 단위로 조건을 확인하여 해당 날짜에만 iterator_10m를 실행합니다.
    """
    seoul_tz = pytz.timezone("Asia/Seoul")
    today = datetime.now(seoul_tz).date()  # 오늘 날짜
    
    if is_xkrx_session_today():
        print(f"Executing tasks for target date: {target_date}")

        # 오전 작업 실행
        now = datetime.now(seoul_tz)
        if now <= morning_end:
            iterator_10m(max(morning_start, now), morning_end)

        # 오후 작업 실행
        now = datetime.now(seoul_tz)  # 시간 갱신
        if now <= afternoon_end:
            if now < afternoon_start:
                # 오후 작업 시작 시간까지 대기
                sleep_time = (afternoon_start - now).total_seconds()
                time.sleep(sleep_time)
            iterator_10m(afternoon_start, afternoon_end)
    else:
        print(f"Today is not the target date: {today}")

def main_iterator():
    """
    전체 작업 관리.
    하루 단위 조건 체크 및 작업 실행.
    """
    seoul_tz = pytz.timezone("Asia/Seoul")
    target_date = datetime.now(seoul_tz).date()  # 예: 오늘 날짜로 테스트
    morning_start = datetime.now(seoul_tz).replace(hour=9, minute=0, second=10, microsecond=0)
    morning_end = datetime.now(seoul_tz).replace(hour=12, minute=0, second=10, microsecond=0)
    afternoon_start = datetime.now(seoul_tz).replace(hour=13, minute=30, second=10, microsecond=0)
    afternoon_end = datetime.now(seoul_tz).replace(hour=15, minute=30, second=10, microsecond=0)

    while True:
        iterator_1d(target_date, morning_start, morning_end, afternoon_start, afternoon_end)
        print(f"Waiting until next day to recheck the condition...")
        # 하루 종료 후 자정까지 대기
        now = datetime.now(seoul_tz)
        next_day = (now + timedelta(days=1)).replace(hour=0, minute=0, second=0, microsecond=0)
        sleep_time = (next_day - now).total_seconds()
        time.sleep(sleep_time)
