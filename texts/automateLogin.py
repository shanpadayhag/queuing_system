# IMPORT MODULES
import os

class automateLogin:
    def __init__(self):
        self.idText = None
        self.passcodeText = None
        self.typeText = None

    def getID(self):
        return self.idText

    def getPasscode(self):
        return self.passcodeText

    def getType(self):
        return self.typeText

    def keepMeLoggedIn(self):
        # GETS THE FILE DIRECTORY OF THE TEXT FILE
        txtLocationAndName = os.path.join(
            os.path.dirname(__file__), 
            "../texts/fileDirectoryText.txt"
        )

        # READS THE CONTENT OF THE TEXT FILE
        txtFile = open(
            txtLocationAndName, 
            "r"
        )
        for x in txtFile:
            self.idText, self.passcodeText, self.typeText = x.split(',')
            self.typeText.strip()
        txtFile.close()

        # CHECKS IN THE DATABASE IF THE CREDENTIALS EXISTED
        # RETURNS THE VALUES
        if (int(self.idText) == 1 and self.passcodeText == "admin"):
            return True
        else:
            return False