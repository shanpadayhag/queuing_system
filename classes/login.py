import sys, os

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

class login(QObject):
    def __init__(self):
        QObject.__init__(self)
    
    @Slot()
    def admin(self):
        print("1")

class createAccount(QObject):
    def __init__(self):
        QObject.__init__(self)

if __name__ == "__main__":
    pass
else:
    pass
import sys
from PyQt5.QtCore import QObject,  pyqtSignal, pyqtSlot
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
import classes.dbConnect as dbConnect
import classes.adminUIFunctions as adminUIFunctions
import classes.currentAccount as currentAccount

class LogIn(QObject):
    def __init__(self):
        QObject.__init__(self)

    def compareToDatabase(self, dbTable, data):
        return dbConnect.dtbs.compareInDatabase(self, dbTable, data)

    def addToDatabase(self):
        pass

    @pyqtSlot(str, str, result = str)
    def chooseSoT(self, schoolID, thePassword):
        logInInputs = (int(schoolID), thePassword)
        if (self.compareToDatabase('login', logInInputs) == None):
            pass
        else:
            currentAccount.accountID = self.compareToDatabase('login', logInInputs)[0]
            currentAccount.accountType = self.compareToDatabase('login', logInInputs)[2]
            if (dbConnect.dtbs.accountType(self, 'login', logInInputs) == 'admin'):
                engine.load('qml/admin.qml')
                return 'succeed'

app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

AdminUI = adminUIFunctions.accounts()
engine.rootContext().setContextProperty('AdminUI', AdminUI)

AccountDetails = adminUIFunctions.accountDetailsFunction()
engine.rootContext().setContextProperty('AccountDetails', AccountDetails)

Home = adminUIFunctions.homeFunctions()
engine.rootContext().setContextProperty('Home', Home)

Room = adminUIFunctions.roomFunctions()
engine.rootContext().setContextProperty('Room', Room)

Appointment = adminUIFunctions.appointmentFunctions()
engine.rootContext().setContextProperty('Appointment', Appointment)

Services = adminUIFunctions.servicesFunctions()
engine.rootContext().setContextProperty('Services', Services)

