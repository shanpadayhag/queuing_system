import os

from datetime import datetime
from classes import database


class reset:
    def __init__(self):
        self.date_today = datetime.now().strftime("%d %B %Y")
        self.date = None
        self.text_location = os.path.join(
            os.getcwd(),
            r"texts\\date.txt"
        )
        self.text_file = None

    def check_date(self):
        self.text_file = open(
            self.text_location,
            "r"
        )

        for x in self.text_file:
            self.date = x

        self.text_file.close()

        if (self.date != self.date_today):
            self.reset_number()
            self.save_date()

    def save_date(self):
        self.text_file = open(
            self.text_location,
            "w"
        )
        self.text_file.writelines(self.date_today)
        self.text_file.close()

    def reset_number(self):
        sql_statement = "UPDATE `number` SET `number` = '%s';"
        sql_data = (0,)
        database.database().setValues(sql_statement, sql_data)
