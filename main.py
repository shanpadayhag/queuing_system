import sys, os

# MODULE IMPORTS
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

# SELF CREATED MODULE IMPORTS
from classes import splashScreen, login

from PyQt5.QtCore import QObject,  pyqtSignal, pyqtSlot
import classes.login as login

# INSTANCE CLASS
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

<<<<<<< HEAD
    SplashScreen = splashScreen.splashScreen()

    engine.rootContext().setContextProperty("SplashScreen", SplashScreen)
=======
    # Instance of a Python object
    Login = login.LogIn()
    # Expose the python object to QML
    engine.rootContext().setContextProperty('login', Login)
    
    engine.load('qml/logIn.qml')
>>>>>>> master

    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))
    
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
    # LOADS THE SPLASH SCREEN UI