import os

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot
from datetime import datetime

from classes import database


class roomreserve(QObject):
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

    availableSignal = Signal(str, int)
    @Slot()
    def checkAvailability(self):
        self.fromDB = database.database()
        self.sqlString = "SELECT * FROM rooms"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        for x in self.sqlList:
            self.availableSignal.emit(x[0], x[1])

    @Slot(str, str)
    def reserveRoom(self, room, purpose):
        dateToday = self.now.strftime("%d %B %Y")
        timeToday = self.now.strftime("%I:%M %p")

        self.sqlString = "INSERT INTO reservedroom (account, room, purpose, dateborrowed, timeborrowed) VALUES (%s, %s, %s, %s, %s)"
        self.sqlData = (self.idText, room, purpose, dateToday, timeToday)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "UPDATE rooms SET status = 0 WHERE id = %s"
        self.sqlData = (room,)
        self.fromDB.setValues(self.sqlString, self.sqlData)

    checkRecentSignal = Signal()
    @Slot()
    def checkRecent(self):
        self.sqlString = "SELECT * FROM reservedroom WHERE account = %s AND returned = 'onHand'"
        self.sqlData = (self.idText,)
        self.sqlList = self.fromDB.selectone(self.sqlString, self.sqlData)
        if (self.sqlList != "-1"):
            self.checkRecentSignal.emit()
        else:
            self.sqlString = "SELECT * FROM reservedroom WHERE account = %s AND returned = 'requestReturn'"
            self.sqlData = (self.idText,)
            self.sqlList = self.fromDB.selectone(self.sqlString, self.sqlData)
            if (self.sqlList != "-1"):
                self.checkRecentSignal.emit()
