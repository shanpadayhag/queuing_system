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
            self.idText = x.split(',')[0]
        txtFile.close()

    @Slot()
    def returnKey(self):
        self.sqlString = "UPDATE reservedroom SET returned = 'requestReturn' WHERE account = %s AND returned = 'onHand';"
        self.sqlData = (self.idText,)
        self.fromDB.setValues(self.sqlString, self.sqlData)