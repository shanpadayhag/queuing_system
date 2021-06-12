import os

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from classes import database, imgto

class account(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.get_img = imgto.database()
        self.toDB = database.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None

    @Slot(str, str, str, str)
    def saveToDB(self, name, school_id, program, passcode):
        school_id = str(int(school_id))
        name = name.title()
        self.sqlString = "INSERT INTO accounts (id_school, name, type, password) VALUES (%s, %s, %s, %s)"
        self.sqlData = (school_id, name, "student", passcode)
        self.toDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "INSERT INTO studentinfo (id, program) VALUES ((SELECT id FROM accounts WHERE id_school = %s), %s)"
        self.sqlData = (school_id, program)
        self.toDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "INSERT INTO accountimg (id, img) VALUES ((SELECT id FROM accounts WHERE id_school = %s), %s)"
        with open(os.path.join(os.getcwd(), r"img/favicon.png"), "rb") as img:
            BinaryData = img.read()
        self.sqlData = (school_id, BinaryData)
        self.toDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "SELECT id FROM accounts WHERE id_school = %s"
        self.sqlData = (school_id,)
        self.sqlList = self.toDB.selectone(self.sqlString, self.sqlData)[0]
        self.get_img.getimg(self.sqlList)

    @Slot(str, str, str)
    def saveToDB_v2(self, name, school_id, passcode):
        school_id = str(int(school_id))
        name = name.title()
        self.sqlString = "INSERT INTO accounts (id_school, name, type, password) VALUES (%s, %s, %s, %s)"
        self.sqlData = (school_id, name, "instructor", passcode)
        self.toDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "INSERT INTO instructorinfo (id) VALUES ((SELECT id FROM accounts WHERE id_school = %s))"
        self.sqlData = (school_id,)
        self.toDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "INSERT INTO accountimg (id, img) VALUES ((SELECT id FROM accounts WHERE id_school = %s), %s)"
        with open(os.path.join(os.getcwd(), r"img/favicon.png"), "rb") as img:
            BinaryData = img.read()
        self.sqlData = (school_id, BinaryData)
        self.toDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "SELECT id FROM accounts WHERE id_school = %s"
        self.sqlData = (school_id,)
        self.sqlList = self.toDB.selectone(self.sqlString, self.sqlData)[0]
        self.get_img.getimg(self.sqlList)