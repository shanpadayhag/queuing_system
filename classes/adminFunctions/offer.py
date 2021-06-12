import sys, os

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from classes import database

class service(QObject):
    def __init__(self):
        QObject.__init__(self)
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
    displaySignal2 = Signal(int, int)
    @Slot()
    def display(self):
        self.sqlString = "SELECT id, servicetitle, servicemessage FROM serviceoffered WHERE instructor = " + self.idText + " AND accepted = '0'"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        count = 0
        for x in self.sqlList:
            self.displaySignal.emit(x[1], x[2])
            self.displaySignal2.emit(count, x[0])
            count += 1

    @Slot(str, str)
    def addService(self, title, message):
        title = title.title()
        self.sqlString = "INSERT INTO serviceoffered (instructor, servicetitle, servicemessage) VALUES (%s, %s, %s)"
        self.sqlData = (self.idText, title, message)
        self.fromDB.setValues(self.sqlString, self.sqlData)
    
    @Slot(int, str, str)
    def editService(self, id, title, message):
        title = title.title()
        self.sqlString = "UPDATE serviceoffered SET servicetitle = %s, servicemessage = %s WHERE id = %s"
        self.sqlData = (title, message, id)
        self.fromDB.setValues(self.sqlString, self.sqlData)

    @Slot(int)
    def removeService(self, id):
        self.sqlString = "DELETE FROM serviceoffered WHERE id = %s"
        self.sqlData = (id,)
        self.fromDB.setValues(self.sqlString, self.sqlData)