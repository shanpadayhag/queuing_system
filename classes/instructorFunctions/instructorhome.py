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

    @Slot()
    def returnKey(self):
        self.sqlString = "UPDATE reservedroom SET returned = 'requestReturn' WHERE account = %s AND returned = 'onHand';"
        self.sqlData = (self.idText,)
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

    @Slot(int, str)
    def keyReturned(self, id, room):
        dateToday = self.now.strftime("%d %B %Y")
        timeToday = self.now.strftime("%I:%M %p")

        self.sqlString = "UPDATE rooms r JOIN reservedroom rr ON r.id = room SET returned = 'returned', datereturned = %s, timereturned = %s, status = 1 WHERE rr.id = '%s' AND returned = 'requestReturn'"
        self.sqlData = (dateToday, timeToday, id)
        self.fromDB.setValues(self.sqlString, self.sqlData)