import sys
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject,  pyqtSignal, pyqtSlot
import classes.login as login

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Instance of a Python object
    Login = login.LogIn()
    # Expose the python object to QML
    engine.rootContext().setContextProperty('login', Login)
    
    engine.load('qml/logIn.qml')

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
