import sys
from PyQt5.QtCore import QObject,  pyqtSignal, pyqtSlot
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
import classes.dbConnect as dbConnect

class createAccount(QObject):
    def __init__(self):
        QObject.__init__(self)

    @pyqtSlot(str, str, str, str, str)
    def saveToDatabaseFromPythonStudent(self, name, id, passcode, table, atype):
        dbConnect.dtbs.addInDatabase(self, name.title(), int(id), passcode, table, atype)

