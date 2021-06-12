import sys, os

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from texts import automateLogin
from classes import login, admin

class splashScreen(QObject):
    def __init__(self):
        QObject.__init__(self)
    
    @Slot()
    def userInterface(self):
        LoggedIn = automateLogin.automateLogin()
        if (LoggedIn.keepMeLoggedIn()):
            engine.load(os.path.join(os.path.dirname(__file__), "../qml/userInterfaces/admin.qml"))
        else:
            engine.load(os.path.join(os.path.dirname(__file__), "../qml/userInterfaces/login.qml"))
            
app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

Admin = admin.home()
engine.rootContext().setContextProperty("Admin", Admin)
    
Login = login.login()
engine.rootContext().setContextProperty("Login", Login)

CreateAccount = login.createAccount()
engine.rootContext().setContextProperty("CreateAccount", CreateAccount)