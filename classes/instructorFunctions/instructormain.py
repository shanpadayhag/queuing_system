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
        self.split_name = None 
        self.set_name = None
        self.idText = None
        self.school_id = None
        self.nameText = None
        self.passcodeText = None
        self.typeText = None
        self.imgText = None


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
            self.idText, self.school_id, self.nameText, self.typeText, self.passcodeText, self.imgText, dummy_value = x.split(',')
        txtFile.close()

        self.setNameSignal.emit(self.nameText.split(" ")[0])
    
    showWindowSignal = Signal()
    @Slot()
    def showWindow(self):
        self.showWindowSignal.emit()
    
    @Slot()
    def goOnline(self):
        self.sqlString = "UPDATE instructorinfo SET status = '1' WHERE id = %s"
        self.sqlData = (self.idText,)
        self.fromDB.setValues(self.sqlString, self.sqlData)
    
    @Slot()
    def goOffline(self):
        self.sqlString = "UPDATE instructorinfo SET status = '0' WHERE id = %s"
        self.sqlData = (self.idText,)
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