from datetime import datetime
import pytz

# 한국 시간대 설정
kst = pytz.timezone('Asia/Seoul')

def get_time_stamp():
    # 현재 시간 가져오기
    current_kst = datetime.now(kst)

    # yyyymmdd 형식으로 출력
    formatted_date = current_kst.strftime('%Y%m%d')

    # yyyymmddHHMMSS 형식으로 출력
    formatted_datetime = current_kst.strftime('%Y%m%d%H%M%S')

    return formatted_date, formatted_datetime