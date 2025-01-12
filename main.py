import asyncio

from utils.db_queries import connect_to_database, execute_select_query
from controllers.iterator import main_iterator
from utils.email_sender import send_email

async def main():
    """
    fetch_inquire_price_data 함수를 호출하는 비동기 메인 함수.
    """
    # 데이터베이스 연결
    connection = connect_to_database()
    if connection is None:
        print("Failed to connect to the database.")
        return

    try:
        # 주식 코드 조회
        result = execute_select_query(connection, "SELECT * FROM korean_stocks;")
        stock_codes = [item['code'] for item in result]

        # 토큰 값 설정
        token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0b2tlbiIsImF1ZCI6IjFlNTdjOWNjLWQ2ZTQtNDQ4Zi04NzJiLTA2YjRkNTA2NGMyMSIsInByZHRfY2QiOiIiLCJpc3MiOiJ1bm9ndyIsImV4cCI6MTczNjY3ODk2NiwiaWF0IjoxNzM2NTkyNTY2LCJqdGkiOiJQUzhXNWdRaUYxbUN4UUlPOEFlZjF0bWxWbjJWb0lHSTh5eUsifQ.aEb5nPg3laJAzRoEZs32qAnxJZaTGVPkjO_8LoR5kKQeXy94Hk83wLB1kIxSVsPdoJ7UXZEZcyHg8k7h9udbDw"

        # 모든 데이터 저장
        await main_iterator(token, stock_codes)

    
    except Exception as e:
        print(f"An error occurred: {e}")
        send_email("An error occurred in the main.py", f"An error occurred: {e}")


    finally:
        connection.close()


# 최상위 이벤트 루프 실행
if __name__ == "__main__":
    asyncio.run(main())
