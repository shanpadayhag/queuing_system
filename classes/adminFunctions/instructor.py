import sys, os

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from classes import database, imgto

class instructor(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.fromDB = database.database()
        self.get_img = imgto.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None

    displaySignal = Signal(str, str)
    displaySignal2 = Signal(int, int)
    @Slot()
    def display(self):
        self.sqlString = "SELECT name, id_school, id FROM accounts WHERE type = 'instructor'"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        count = 0
        for x in self.sqlList:
            self.displaySignal.emit(x[0], x[1])
            self.displaySignal2.emit(count, x[2])

            count += 1
    
    @Slot(str, str)
    def addInstructor(self, school_id, name):
        school_id = str(int(school_id))
        self.sqlString = "INSERT INTO accounts (id_school, name, type) VALUES (%s, %s, 'instructor')"
        self.sqlData = (school_id, name.title())
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "INSERT INTO instructorinfo (id) VALUES ((SELECT id FROM accounts WHERE id_school = %s))"
        self.sqlData = (school_id,)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "INSERT INTO accountimg (id, img) VALUES ((SELECT id FROM accounts WHERE id_school = %s), %s)"
        with open(os.path.join(os.getcwd(), "img/favicon.png"), "rb") as img:
            binary_data = img.read()
        self.sqlData = (school_id, binary_data)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "SELECT id FROM accounts WHERE id_school = %s"
        self.sqlData = (school_id,)
        self.sqlList = self.fromDB.selectone(self.sqlString, self.sqlData)[0]
        self.get_img.getimg(self.sqlList)

    @Slot(str)
    def removeInstructor(self, id):
        self.sqlString = "DELETE FROM accountimg WHERE id = %s"
        self.sqlData = (id,)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "DELETE FROM instructorinfo WHERE id = %s"
        self.sqlData = (id,)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "DELETE FROM accounts WHERE id = %s"
        self.sqlData = (id,)
        self.fromDB.setValues(self.sqlString, self.sqlData)

    @Slot(str, str, str)
    def editInstructor(self, id, school_id, name):
        school_id = str(int(school_id))
        self.sqlString = "UPDATE accounts a JOIN instructorinfo i ON a.id = i.id SET id_school = %s, name = %s WHERE a.id = %s"
        self.sqlData = (school_id, name, id)
        self.fromDB.setValues (self.sqlString, self.sqlData)
