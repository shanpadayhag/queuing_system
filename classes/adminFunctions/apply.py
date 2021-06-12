import os

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot
from datetime import datetime

from classes import database

class service(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.now = datetime.now()
        self.fromDB = database.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None
        self.idText = None

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
            self.idText = x.split(',')[0]
        txtFile.close()

    displaySignal = Signal(str, str)
    displaySignal2 = Signal(int, str)
    displaySignal3 = Signal(int, int)
    @Slot()
    def display(self):
        self.sqlString = "SELECT servicetitle, servicemessage, name, s.id FROM serviceoffered s JOIN accounts a ON instructor = a.id WHERE accepted = '0'"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        count = 0
        for x in self.sqlList:
            self.displaySignal.emit(x[0], x[1])
            self.displaySignal2.emit(count, x[2])
            self.displaySignal3.emit(count, x[3])

            count += 1
    
    @Slot(int)
    def acceptService(self, id):
        self.sqlString = "UPDATE serviceoffered SET accepted = 1 WHERE id = %s"
        self.sqlData = (id,)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "INSERT INTO acceptedservice (student, service, date, time) VALUES (%s, %s, %s, %s)"
        dateToday = self.now.strftime("%d %B %Y")
        timeToday = self.now.strftime("%I:%M %p")
        self.sqlData = (self.idText, id, dateToday, timeToday)
        self.fromDB.setValues(self.sqlString, self.sqlData)