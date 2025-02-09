from src.PostgreSQLContext import PostgreSQLContext


if __name__ == "__main__":
    db = PostgreSQLContext()
    db.handle_process()
    employees = db.fetch_employees()
    print(employees)
