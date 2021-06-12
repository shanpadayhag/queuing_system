from datetime import datetime

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from classes import database

class number(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.now = datetime.now()
        self.fromDB = database.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None

    signalNumber = Signal(int)
    @Slot()
    def getNumber(self):
        self.sqlString = "SELECT number FROM number"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        for x in self.sqlList:
            self.signalNumber.emit(int(x[0]))

    @Slot(int)
    def incrementNumber(self, number):
        self.sqlString = "UPDATE number SET number = %s WHERE number = %s"
        self.sqlData = ((number+1), number)
        self.fromDB.setValues(self.sqlString, self.sqlData)

    @Slot(str)
    def saveReport(self, queueNumber):
        dateToday = self.now.strftime("%d %B %Y")
        timeToday = self.now.strftime("%I:%M %p")
        self.sqlString = "INSERT INTO enrollmentreport (queuenumber, date, time) VALUES (%s, %s, %s)"
        self.sqlData = (queueNumber, dateToday, timeToday)
        self.fromDB.setValues(self.sqlString, self.sqlData)