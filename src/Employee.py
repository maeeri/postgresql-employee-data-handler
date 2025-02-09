class Employee:
    age: int
    gender: str
    educationLevel: str
    jobTitle: str
    yearsOfExperience: float
    salary: float

    def __init__(
        self, age, gender, educationLevel, jobTitle, yearsOfExperience, salary
    ):
        self.age = self.str_to_int(age)
        self.gender = self.replace_empty(gender)
        self.educationLevel = self.normalize_education_level(
            self.replace_empty(educationLevel)
        )
        self.jobTitle = self.replace_empty(jobTitle)
        self.yearsOfExperience = self.str_to_float(yearsOfExperience)
        self.salary = self.str_to_float(salary)

    def str_to_int(self, input):
        try:
            return int(input)
        except:
            return 0

    def str_to_float(self, input):
        try:
            return float(input)
        except:
            return 0.0

    def replace_empty(self, input):
        if input == "":
            input = "N/A"
        return input

    def normalize_education_level(self, input):
        match input.lower():
            case "phd":
                return "PhD"
            case "master's" | "master's degree":
                return "Master''s Degree"
            case "bachelor's" | "bachelor's degree":
                return "Bachelor''s Degree"
            case "high school":
                return "High School"
            case _:
                return "N/A"
