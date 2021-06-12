import os

from datetime import datetime
from classes import database


class reset:
    def __init__(self):
        self.date_today = datetime.now().strftime("%d %B %Y")
        self.fromDB = database.database()
        self.date = None
        self.sql_statement = None
        self.sql_data = None

    def check_date(self):
        self.sql_statement = "SELECT date FROM queue"
        self.sql_data = self.fromDB.selectall(self.sql_statement)[0][0]
        if (self.date_today != self.sql_data):
            self.save_date(self.date_today)
            self.reset_number()

    def save_date(self, date_today):
        self.sql_statement = "UPDATE queue SET date = %s;"
        self.sql_data = (date_today,)
        self.fromDB.setValues(self.sql_statement, self.sql_data)

    def reset_number(self):
        self.sql_statement = "UPDATE `queue` SET `number` = '%s';"
        self.sql_data = (0,)
        self.fromDB.setValues(self.sql_statement, self.sql_data)

        self.sql_statement = "UPDATE enrollmentreport SET status = %s WHERE status = 'onQueue'"
        self.sql_data = ('cancelled',)
        self.fromDB.setValues(self.sql_statement, self.sql_data)
