from utils.db_queries import connect_to_database, execute_select_query
from utils.time_getter import get_yyyymmdd
from fastapi import FastAPI

from dotenv import load_dotenv
import os

load_dotenv()

app = FastAPI()

@app.get("/today")
async def get_today_count():
    connection = connect_to_database()
    if connection is None:
        return {"message": "Failed to connect to the database."}
    try:
        price_query = f"SELECT COUNT(*) FROM price WHERE yyyymmdd = '{get_yyyymmdd()}'"
        price_result = execute_select_query(connection, price_query)
        ccnl_query = f"SELECT COUNT(*) FROM ccnl WHERE yyyymmdd = '{get_yyyymmdd()}'"
        ccnl_result = execute_select_query(connection, ccnl_query)
        asking_price_exp_ccn_query = f"SELECT COUNT(*) FROM asking_price_exp_ccn WHERE yyyymmdd = '{get_yyyymmdd()}'"
        asking_price_exp_ccn_result = execute_select_query(connection, asking_price_exp_ccn_query)
        investor_query = f"SELECT COUNT(*) FROM investor WHERE yyyymmdd = '{get_yyyymmdd()}'"
        investor_result = execute_select_query(connection, investor_query)
        member_query = f"SELECT COUNT(*) FROM member WHERE yyyymmdd = '{get_yyyymmdd()}'"
        member_result = execute_select_query(connection, member_query)

        if price_result is None or ccnl_result is None or asking_price_exp_ccn_result is None or investor_result is None or member_result is None:
            return {"message": "Failed to execute the query."}
        return {f"price: {price_result[0]['COUNT(*)']}", f"ccnl: {ccnl_result[0]['COUNT(*)']}", f"asking_price_exp_ccn: {asking_price_exp_ccn_result[0]['COUNT(*)']}", f"investor: {investor_result[0]['COUNT(*)']}", f"member: {member_result[0]['COUNT(*)']}"}
    
    except Exception as e:
        return {"message": f"An error occurred: {e}"}


@app.get("/total")
async def get_total_count():
    connection = connect_to_database()
    if connection is None:
        return {"message": "Failed to connect to the database."}
    try:
        price_query = "SELECT COUNT(*) FROM price"
        price_result = execute_select_query(connection, price_query)
        ccnl_query = "SELECT COUNT(*) FROM ccnl"
        ccnl_result = execute_select_query(connection, ccnl_query)
        asking_price_exp_ccn_query = "SELECT COUNT(*) FROM asking_price_exp_ccn"
        asking_price_exp_ccn_result = execute_select_query(connection, asking_price_exp_ccn_query)
        investor_query = "SELECT COUNT(*) FROM investor"
        investor_result = execute_select_query(connection, investor_query)
        member_query = "SELECT COUNT(*) FROM member"
        member_result = execute_select_query(connection, member_query)

        if price_result is None or ccnl_result is None or asking_price_exp_ccn_result is None or investor_result is None or member_result is None:
            return {"message": "Failed to execute the query."}
        return {f"price: {price_result[0]['COUNT(*)']}", f"ccnl: {ccnl_result[0]['COUNT(*)']}", f"asking_price_exp_ccn: {asking_price_exp_ccn_result[0]['COUNT(*)']}", f"investor: {investor_result[0]['COUNT(*)']}", f"member: {member_result[0]['COUNT(*)']}"}
    
    except Exception as e:
        return {"message": f"An error occurred: {e}"}


if __name__ == "__main__":
    import uvicorn
    port = int(os.getenv('SERVER_PORT'))
    uvicorn.run("server:app", host="0.0.0.0", port=port, reload=True)
