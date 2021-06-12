import os

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot
from datetime import datetime

from classes import database

class home(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.now = datetime.now()
        self.fromDB = database.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None
        self.text = None

    @Slot()
    def getCurrentAccount(self):
        txtLocationAndName = os.path.join(
            os.getcwd(), 
            r"texts/fileDirectoryText.txt"
        )

        txtFile = open(
            txtLocationAndName, 
            "r"
        )

        for x in txtFile:
            self.text = x.split(',')
        txtFile.close()

    @Slot()
    def returnKey(self):
        self.sqlString = "UPDATE reservedroom SET returned = 'requestReturn' WHERE account = %s AND returned = 'onHand';"
        self.sqlData = (self.text[0],)
        self.fromDB.setValues(self.sqlString, self.sqlData)

    returnKeySignal = Signal(str, str)
    returnKeySignal2 = Signal(int, int)
    @Slot()
    def displayRequests(self):
        self.sqlString = "SELECT name, room, reservedroom.id FROM reservedroom JOIN accounts ON account = accounts.id WHERE returned = 'requestReturn';"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        count = 0
        for x in self.sqlList:
            self.returnKeySignal.emit(x[0], x[1])
            self.returnKeySignal2.emit(count, x[2])
            count += 1

    @Slot(str, str)
    def keyReturned(self, id, room):
        dateToday = self.now.strftime("%d %B %Y")
        timeToday = self.now.strftime("%I:%M %p")

        self.sqlString = "UPDATE rooms r JOIN reservedroom rr ON r.id = room SET returned = 'returned', datereturned = %s, timereturned = %s, status = 1 WHERE rr.id = %s AND returned = 'requestReturn'"
        self.sqlData = (dateToday, timeToday, id)
        self.fromDB.setValues(self.sqlString, self.sqlData)

    @Slot(str, str, result=bool)
    def addCourse(self, code, name):
        code = code.upper()
        name = name.title()
        self.sqlString = "INSERT INTO courses (id, name) VALUES (%s, %s);"
        self.sqlData = (code, name)
        try:
            self.fromDB.setValues(self.sqlString, self.sqlData)
            return True
        except:
            return False

    signalCourses = Signal(str, str)
    @Slot()
    def displayCourses(self):
        self.sqlString = "SELECT * FROM courses;"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        for x in self.sqlList:
            self.signalCourses.emit(x[0], x[1])

    @Slot(str)
    def deleteCourse(self, code):
        self.sqlString = "DELETE FROM courses WHERE id = %s;"
        self.sqlData = (code,)
        self.fromDB.setValues(self.sqlString, self.sqlData)

    getQueueLineNumberSignal = Signal(str, int)
    @Slot()
    def getQueueLineNumbers(self):
        self.sqlString = "SELECT id, queuenumber FROM enrollmentreport WHERE status = 'onQueue'"
        self.sqlList = self.fromDB.selectall(self.sqlString)

        self.sqlString = "SELECT programs FROM chairmans WHERE id = %s"
        self.sqlData = (self.text[0],)
        try:
            temp = self.fromDB.selectone(self.sqlString, self.sqlData)[0]
            temp2 = temp[0] + temp[1]

            for x in self.sqlList:
                temp_string = x[1][0] + x[1][1]
                if (temp_string == temp2):
                    self.getQueueLineNumberSignal.emit(x[1], x[0])
                elif (temp_string == temp2):
                    self.getQueueLineNumberSignal.emit(x[1], x[0])
                elif (temp_string == temp2):
                    self.getQueueLineNumberSignal.emit(x[1], x[0])
                elif (temp_string == temp2):
                    self.getQueueLineNumberSignal.emit(x[1], x[0])
        except:
            pass
    
    @Slot(int)
    def accept_queue(self, id):
        self.sqlString = "UPDATE enrollmentreport SET status = %s WHERE id = '%s'"
        self.sqlData = ("done", id) 
        self.fromDB.setValues(self.sqlString, self.sqlData)