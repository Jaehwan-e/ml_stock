from datetime import datetime
import pytz

# 한국 시간대 설정
kst = pytz.timezone('Asia/Seoul')

def get_yyyymmdd():
    # 현재 시간 가져오기
    current_kst = datetime.now(kst)

    # yyyymmdd 형식으로 출력
    formatted_date = current_kst.strftime('%Y%m%d')

    # # yyyymmddHHMMSS 형식으로 출력
    # formatted_datetime = current_kst.strftime('%Y%m%d%H%M%S')

    return formatted_date


def get_min():
    # Asia/Seoul 타임존 기준 현재 시간
    seoul_tz = pytz.timezone("Asia/Seoul")
    now_seoul = datetime.now(seoul_tz)
    
    # 자정부터 현재 시각까지의 총 분 계산
    total_minutes = now_seoul.hour * 60 + now_seoul.minute
    
    # 10분 단위로 내림 (가장 가까운 10의 배수)
    return total_minutes // 10 * 10
