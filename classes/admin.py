import sys, os

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

class home(QObject):
    def __init__(self):
        QObject.__init__(self)

    @Slot()
    def homeBtn(self):
        print("you clicked home button")

if __name__ == "__main__":
    pass
else:
    pass