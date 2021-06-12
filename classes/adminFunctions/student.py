import os

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from classes import database, imgto

class student(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.get_img = imgto.database()
        self.fromDB = database.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None

    displaySignal = Signal(str, str)
    displaySignal2 = Signal(int, str)
    displaySignal3 = Signal(int, int)
    @Slot()
    def display(self):
        self.sqlString = "SELECT name, id_school, program, a.id FROM accounts a JOIN studentinfo s ON a.id = s.id WHERE type = 'student'"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        count = 0
        for x in self.sqlList:
            self.displaySignal.emit(x[0], x[1])
            self.displaySignal2.emit(count, x[2])
            self.displaySignal3.emit(count, x[3])

            count += 1
    
    @Slot(str, str, str)
    def addAccount(self, name, id_school, program):
        id_school = str(int(id_school))
        self.sqlString = "INSERT INTO accounts (id_school, name, type) VALUES (%s, %s, 'student')"
        self.sqlData = (id_school, name.title())
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "INSERT INTO studentinfo (id, program) VALUES ((SELECT id FROM accounts WHERE id_school = %s), %s)"
        self.sqlData = (id_school, program)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "INSERT INTO accountimg (id, img) VALUES ((SELECT id FROM accounts WHERE id_school = %s), %s)"
        with open(os.path.join(os.getcwd(), "img/favicon.png"), "rb") as img:
            binary_data = img.read()
        self.sqlData = (id_school, binary_data)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "SELECT id FROM accounts WHERE id_school = %s"
        self.sqlData = (id_school,)
        self.sqlList = self.fromDB.selectone(self.sqlString, self.sqlData)[0]
        self.get_img.getimg(self.sqlList)
    
    @Slot(str)
    def removeStudent(self, id):
        self.sqlString = "DELETE FROM studentinfo WHERE id = %s"
        self.sqlData = (id,)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "DELETE FROM accountimg WHERE id = %s"
        self.sqlData = (id,)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "DELETE FROM accounts WHERE id = %s"
        self.sqlData = (id,)
        self.fromDB.setValues(self.sqlString, self.sqlData)
    
    @Slot(str, str, str, str)
    def editStudent(self, id, school_id, name, program):
        self.sqlString = "UPDATE accounts a JOIN studentinfo s ON a.id = s.id SET id_school = %s, name = %s, program = %s WHERE a.id = %s"
        self.sqlData = (str(int(school_id)), name.title(), program, id)
        self.fromDB.setValues(self.sqlString, self.sqlData)
