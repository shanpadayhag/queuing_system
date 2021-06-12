# IMPORT MODULES
import os

from classes import database

class automateLogin:
    def __init__(self):
        pass

    def keepMeLoggedIn(self):
        txtLocationAndName = os.path.join(
            os.getcwd(),
            r"texts\\fileDirectoryText.txt"
        )

        txtFile = open(
            txtLocationAndName,
            "r"
        )

        for x in txtFile:
            text = x.split(',')
        txtFile.close()

        sql_statement = "SELECT id_school FROM accounts WHERE id_school = %s and password = %s"
        sql_data = (text[1], text[4])
        sql_list = database.database().selectone(sql_statement, sql_data)

        if sql_list != "-1":
            return True  # Turn false to always go to log in
        else:
            return False
