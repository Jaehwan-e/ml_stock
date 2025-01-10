from dotenv import load_dotenv
import os
import yagmail

# .env 파일 로드
load_dotenv()

# 환경 변수에서 메일 주소와 비밀번호 가져오기
MAIL_ADDRESS = os.getenv("MAIL_ADDRESS")
MAIL_PASSWORD = os.getenv("MAIL_PASSWORD")

# 이메일 전송 함수 정의
def send_email(subject: str, contents: str, to: str = MAIL_ADDRESS):
    """
    이메일을 전송하는 함수.

    :param subject: 이메일 제목
    :param contents: 이메일 내용
    :param to: 수신자 이메일 주소 (기본값은 발신자 메일 주소)
    :return: None
    """
    try:
        # yagmail SMTP 객체 생성
        yag = yagmail.SMTP(MAIL_ADDRESS, MAIL_PASSWORD)
        
        # 이메일 전송
        yag.send(to=to, subject=subject, contents=contents)
    except Exception as e:
        print(f"이메일 전송 실패: {e}")
