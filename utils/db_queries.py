import pymysql
from dotenv import load_dotenv
import os

# .env 파일 로드
load_dotenv()

def connect_to_database():
    """데이터베이스 연결 객체를 반환"""
    try:
        connection = pymysql.connect(
            host=os.getenv('DATABASE_HOST'),
            user=os.getenv('DATABASE_USER'),
            password=os.getenv('DATABASE_PASSWORD'),
            database=os.getenv('DATABASE_DATABASE'),
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )
        return connection
    except pymysql.MySQLError as e:
        print("Database connection failed:", e)
        return None

def execute_select_query(connection, query, params=None):
    """
    SELECT 쿼리 실행 함수.
    :param connection: 데이터베이스 연결 객체
    :param query: 실행할 SELECT 쿼리 문자열
    :param params: 쿼리 파라미터 (튜플이나 딕셔너리 형태)
    :return: 쿼리 결과 리스트 (딕셔너리 형식)
    """
    if connection is None:
        print("Database connection is not provided.")
        return None

    try:
        with connection.cursor() as cursor:
            cursor.execute(query, params)
            result = cursor.fetchall()
            return result
    except pymysql.MySQLError as e:
        print("Error executing SELECT query:", e)
        return None

def execute_insert_query(connection, query, params=None):
    """
    INSERT 쿼리 실행 함수. 다중 행 삽입 지원.
    :param connection: 데이터베이스 연결 객체
    :param query: 실행할 INSERT 쿼리 문자열
    :param params: 삽입할 데이터 (단일 행: 튜플 또는 딕셔너리, 다중 행: 리스트의 리스트 또는 딕셔너리)
    :return: 삽입된 총 행 수
    """
    if connection is None or not connection.open:
        print("Database connection is not provided or closed.")
        return None

    try:
        with connection.cursor() as cursor:
            if isinstance(params, list) and isinstance(params[0], (list, tuple)):  # 다중 행 처리
                affected_rows = cursor.executemany(query, params)
            else:  # 단일 행 처리
                affected_rows = cursor.execute(query, params)
            connection.commit()  # 변경 사항 저장
            return affected_rows
    except pymysql.MySQLError as e:
        print("Error executing INSERT query:", e)
        print("Query:", query)
        print("Params:", params)
        return None


# 사용 예시
if __name__ == "__main__":
    connection = connect_to_database()
    if connection:
        try:
            # SELECT 예시
            select_query = "SELECT * FROM my_table WHERE id = %s"
            select_params = (1,)
            results = execute_select_query(connection, select_query, select_params)
            print("SELECT 결과:", results)

            # INSERT 예시
            insert_query = "INSERT INTO my_table (col1, col2) VALUES (%s, %s)"
            insert_params = ("value1", "value2")
            rows = execute_insert_query(connection, insert_query, insert_params)
            print(f"{rows} rows inserted.")
        finally:
            connection.close()
