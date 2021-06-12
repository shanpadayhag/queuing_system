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