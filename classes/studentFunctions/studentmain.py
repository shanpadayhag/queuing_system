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
        self.idText = None
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
            self.nameText = x.split(',')[2]
        txtFile.close()

        if (len(self.nameText.split()) > 2):
            self.setNameSignal.emit(self.nameText.split()[1])
        elif (len(self.nameText.split()) == 2 or len(self.nameText.split()) == 1): 
            self.setNameSignal.emit(self.nameText.split()[0])
        else:
            self.setNameSignal.emit("User")

    
    showWindowSignal = Signal()
    @Slot()
    def showWindow(self):
        self.showWindowSignal.emit()

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