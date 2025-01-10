# from utils.email_sender import send_email
# from api_caller.token import get_token
# from api_caller.local_stock import get_inquire_price, get_inquire_ccnl, get_inquire_asking_price_exp_ccn, get_inquire_investor, get_inquire_member
# from utils.time_stamp_getter import get_time_stamp

# from utils.db_queries import connect_to_database

# # 제목과 내용을 입력받아 이메일 전송
# subject = "테스트 이메일 제목"
# contents = "테스트 이메일 내용."

# # 함수 호출
# send_email(subject=subject, contents=contents)

# token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0b2tlbiIsImF1ZCI6ImQ3YWQ3MjY0LWJlNjctNGJmYi1iNmFhLTQ5MjdiODI5MWQxNSIsInByZHRfY2QiOiIiLCJpc3MiOiJ1bm9ndyIsImV4cCI6MTczNjQ4MjYxMSwiaWF0IjoxNzM2Mzk2MjExLCJqdGkiOiJQUzhXNWdRaUYxbUN4UUlPOEFlZjF0bWxWbjJWb0lHSTh5eUsifQ.npqBdaB78abIPtqSxwjIBzPD-knOLmFcNKu2tNmLCJIHf2J38j9Kl84vYRy2lVLaJu7U8pJ9tWsXDsQ_yhFLTw"
# get_inquire_price(token, "005930")
# get_inquire_ccnl(token, "005930")
# data = get_inquire_asking_price_exp_ccn(token, "005930")
# get_inquire_investor(token, "005930")
# get_inquire_member(token, "005930")

# time, datetime = get_time_stamp()
# print(time)
# print(datetime)



# from utils.db_queries import execute_select_query, execute_insert_query  # 함수 import

# # SELECT 쿼리 실행
# select_query = "SELECT * FROM users WHERE age > %s;"
# select_params = (30,)
# users = execute_select_query(select_query, select_params)
# print("Users:", users)

# # INSERT 쿼리 실행
# insert_query = "INSERT INTO users (name, age, email) VALUES (%s, %s, %s);"
# insert_params = ("Jane Doe", 28, "janedoe@example.com")
# rows_inserted = execute_insert_query(insert_query, insert_params)
# print(f"Rows inserted: {rows_inserted}")

from utils.min_getter import get_min

print(get_min())
