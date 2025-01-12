from utils.db_queries import connect_to_database, execute_select_query
from utils.time_getter import get_yyyymmdd
from fastapi import FastAPI

app = FastAPI()

@app.get("/today")
async def get_today_count():
    connection = connect_to_database()
    if connection is None:
        return {"message": "Failed to connect to the database."}
    try:
        query = f"SELECT COUNT(*) FROM ccnl WHERE yyyymmdd = '{get_yyyymmdd()}'"
        result = execute_select_query(connection, query)
        if result is None:
            return {"message": "Failed to execute the query."}
        return {f"today rows: {result[0]['COUNT(*)']}"}
    except Exception as e:
        return {"message": f"An error occurred: {e}"}

@app.get("/total")
async def get_total_count():
    connection = connect_to_database()
    if connection is None:
        return {"message": "Failed to connect to the database."}
    try:
        query = f"SELECT COUNT(*) FROM ccnl"
        result = execute_select_query(connection, query)
        if result is None:
            return {"message": "Failed to execute the query."}
        return {f"total rows: {result[0]['COUNT(*)']}"}
    except Exception as e:
        return {"message": f"An error occurred: {e}"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("server:app", host="0.0.0.0", port=8000, reload=True)
