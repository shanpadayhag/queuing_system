import os
import sys
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject,  pyqtSignal, pyqtSlot
import classes.currentAccount as currentAccount
import classes.adminUIFunctions as adminUIFunctions
import classes.login as login
import classes.dbConnect as dbConnect

class automateLogIn():
    def __init__(self):
        pass

    def automateLogIn(self):
        txtLocation = str(__file__)
        txtLocationList = txtLocation.split('\\')
        del txtLocationList[-1]
        txtLocation = ''
        for x in txtLocationList:
            txtLocation += x + '\\'
        txtName = 'autoLogInWithoutEncryption.txt'
        txtLocationAndName = os.path.join(txtLocation, txtName)

        txtFile = open(txtLocationAndName, 'r')
        for x in txtFile:
            idText, passcodeText = x.split(',')
            passcodeText.strip()
        txtFile.close()

        currentAccount.accountID = int(idText)
        currentAccount.passcode = passcodeText

        if (idText == 0 or passcodeText == ''):
            return False
        else:
            return True
    
    def openQML(self):
        engine.load('qml/admin.qml')
    
    def openLogin(self):
        engine.load('qml/logIn.qml')

app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

# Instance of a Python object
Login = login.LogIn()
# Expose the python object to QML
engine.rootContext().setContextProperty('login', Login)

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


if not engine.rootObjects():
    sys.exit(-1)
sys.exit(app.exec_())
