import requests

from dotenv import load_dotenv
import os

# .env 파일 로드
load_dotenv()


def get_token(token):
    # 토큰 폐기
    revoke_token(token)

    # 요청 URL과 헤더 설정
    url = "https://openapivts.koreainvestment.com:9443/oauth2/tokenP"
    headers = {
        "Content-Type": "application/json; charset=UTF-8"
    }

    # 요청 본문 데이터
    payload = {
        "grant_type": "client_credentials",
        "appkey": os.getenv("APP_KEY"),
        "appsecret": os.getenv("APP_SECRET")
    }

    try:
        # POST 요청 보내기
        response = requests.post(url, headers=headers, json=payload)

        # 응답 처리
        if response.status_code == 200:
            data = response.json()
            access_token = data.get("access_token")
            if access_token:
                return access_token
            else:
                print("Access token not found in response.")
                return None
        else:
            print(f"Failed to get access token. HTTP Status: {response.status_code}, Response: {response.text}")
            return None

    except requests.exceptions.RequestException as e:
        print("An error occurred while making the request:", e)
        return None
    

def revoke_token(token):
    # 요청 URL과 헤더 설정
    url = "https://openapi.koreainvestment.com:9443/oauth2/revokeP"
    headers = {
        "Content-Type": "application/json; charset=UTF-8"
    }

    # 요청 본문 데이터
    payload = {
        "appkey": os.getenv("APP_KEY"),
        "appsecret": os.getenv("APP_SECRET"),
        "token": token
    }

    try:
        # POST 요청 보내기
        response = requests.post(url, headers=headers, json=payload)

        # 응답 처리
        if response.status_code == 200:
            return True
        else:
            print(f"Failed to get access token. HTTP Status: {response.status_code}, Response: {response.text}")
            return None

    except requests.exceptions.RequestException as e:
        print("An error occurred while making the request:", e)
        return None