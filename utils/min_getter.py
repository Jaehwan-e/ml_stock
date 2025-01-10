from datetime import datetime
import pytz

def get_min():
    # Asia/Seoul 타임존 기준 현재 시간
    seoul_tz = pytz.timezone("Asia/Seoul")
    now_seoul = datetime.now(seoul_tz)
    
    # 자정부터 현재 시각까지의 총 분 계산
    total_minutes = now_seoul.hour * 60 + now_seoul.minute
    
    # 10분 단위로 내림 (가장 가까운 10의 배수)
    return total_minutes // 10 * 10
