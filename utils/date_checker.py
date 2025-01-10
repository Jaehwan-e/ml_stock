from datetime import datetime
import pytz
import exchange_calendars as ecals

def is_xkrx_session_today():
    # 거래소 캘린더
    XKRX = ecals.get_calendar("XKRX")
    
    # Asia/Seoul 타임존 기준 현재 날짜
    seoul_tz = pytz.timezone("Asia/Seoul")
    today_seoul = datetime.now(seoul_tz).date()
    
    # 오늘이 세션인지 확인
    return XKRX.is_session(today_seoul)


