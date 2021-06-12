import sys, os

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from classes import database, create, queue
from classes.adminFunctions import account, admin, apply, home, instructor, offer, request, roomreserve, setAppointment, student

class login(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.fromDB = database.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None

    def keepMeLoggedIn(self, id, school_id, name, type, passcode, imgurl):
        txtString = str(id) + ","  + school_id + ","  + name + "," + type + "," + passcode + "," + imgurl + ","
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
    
    showWindowSignal = Signal()
    @Slot()
    def showWindow(self):
        self.showWindowSignal.emit()
    
    _pop_up_signal = Signal(str)
    @Slot(str)
    def pop_up(self, message):
        self._pop_up_signal.emit(message)

    accountSignal = Signal(str)
    @Slot(str, str, result = int)
    def account(self, id, passcode):
        self.sqlData = (id,)
        self.sqlString = "SELECT id_school, password, accounts.id, name, type, imgurl FROM accounts JOIN accountimg ON accounts.id = accountimg.id WHERE id_school = %s"
        self.sqlList = self.fromDB.selectone(self.sqlString, self.sqlData)
        if (id == self.sqlList[0] and passcode == self.sqlList[1]):
            self.keepMeLoggedIn(
                self.sqlList[2], # id
                self.sqlList[0], # school_id
                self.sqlList[3], # name
                self.sqlList[4], # type 
                self.sqlList[1], # passcode 
                self.sqlList[5]  # imgurl
            )
            self.accountSignal.emit(self.sqlList[4])
            return 0

        else:
            if (self.sqlList != "-1"):
                return 2
            else:
                return 3
                