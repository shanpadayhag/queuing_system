import sys
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject,  pyqtSignal, pyqtSlot

class LogIn(QObject):
    def __init__(self):
        QObject.__init__(self)

    @pyqtSlot(str, str, result = str)
    def chooseSoT(self, schoolID, thePassword):
        if (schoolID == 'admin' and thePassword == ''):
            return '1'
        elif (schoolID == 'instructor' and thePassword == ''):
            return '2'
        elif (schoolID == 'student' and thePassword == ''):
            return '3'
        else:
            print(schoolID, thePassword)
            return '0'

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    #Instance of a Python object
    login = LogIn()

    #Expose the python object to QML
    engine.rootContext().setContextProperty('login', login)

    engine.load('qml/logIn.qml')

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
