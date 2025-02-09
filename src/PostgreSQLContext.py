from src.Employee import Employee
import psycopg2
import contextlib
import csv


class PostgreSQLContext:
    @contextlib.contextmanager
    def connect(self):
        conn = None
        try:
            # replace with relevant info when testing
            conn = psycopg2.connect(
                database="EmployeesDb",
                user="app_user",
                password="qwerty",
                host="localhost",
                port="5432",
            )
            yield conn
        finally:
            if conn is not None:
                conn.close()

    def read_data(self, path):
        genders = []
        jobTitles = []
        educationLevels = []
        people = []
        i = 0
        with open(path, "r") as file:
            lines = csv.reader(file, delimiter=",")
            for line in lines:
                if i == 0:
                    i += 1
                    continue
                employee = Employee(
                    line[0], line[1], line[2], line[3], line[4], line[5]
                )
                people.append(employee)
                genders.append(employee.gender)
                jobTitles.append(employee.jobTitle)
                educationLevels.append(employee.educationLevel)
        genders = set(genders)
        jobTitles = set(jobTitles)
        educationLevels = set(educationLevels)
        return (people, genders, jobTitles, educationLevels)
