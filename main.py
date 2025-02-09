from src.PostgreSQLContext import PostgreSQLContext


if __name__ == "__main__":
    db = PostgreSQLContext()
    (people, genders, jobTitles, educationLevels) = db.read_data("src/db/teht4.csv")
    print(people)
    print(genders)
    print(jobTitles)
    print(educationLevels)
