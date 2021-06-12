import os

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from classes import database

class main(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.fromDB = database.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None
        self.text = None


    setNameSignal = Signal(str)
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

        self.setNameSignal.emit(self.text[2].split(" ")[0])
    
    showWindowSignal = Signal()
    @Slot()
    def showWindow(self):
        self.showWindowSignal.emit()
    
    @Slot()
    def goOnline(self):
        self.sqlString = "UPDATE instructorinfo SET status = '1' WHERE id = %s"
        self.sqlData = (self.text[0],)
        self.fromDB.setValues(self.sqlString, self.sqlData)
    
    @Slot()
    def goOffline(self):
        self.sqlString = "UPDATE instructorinfo SET status = '0' WHERE id = %s"
        self.sqlData = (self.text[0],)
        self.fromDB.setValues(self.sqlString, self.sqlData)
    
        self.sqlString = "SELECT programs FROM chairmans WHERE id = %s"
        self.sqlData = (self.text[0],)
        self.sqlList = self.fromDB.selectone(self.sqlString, self.sqlData)

        if self.sqlList is not []:
            if self.sqlList[0] == "CS":
                self.sqlString = "UPDATE current_queue_on_serve SET CS = %s"
                self.sqlData = ('None',)
                self.fromDB.setValues(self.sqlString, self.sqlData)

            elif self.sqlList[0] == "EMC":
                self.sqlString = "UPDATE current_queue_on_serve SET EMC = %s"
                self.sqlData = ('None',)
                self.fromDB.setValues(self.sqlString, self.sqlData)

            elif self.sqlList[0] == "IS":
                self.sqlString = "UPDATE current_queue_on_serve SET `IS` = %s"
                self.sqlData = ('None',)
                self.fromDB.setValues(self.sqlString, self.sqlData)

            elif self.sqlList[0] == "IT":
                self.sqlString = "UPDATE current_queue_on_serve SET IT = %s"
                self.sqlData = ('None',)
                self.fromDB.setValues(self.sqlString, self.sqlData)

    @Slot()
    def logout(self):
        txtString = ",,,,,,"
        txtLocationAndName = os.path.join(
            os.getcwd(), 
            r"texts/fileDirectoryText.txt"
        )
        txtFile = open(
            txtLocationAndName, 
            "w"
        )
        txtFile.writelines(txtString)
        txtFile.close()