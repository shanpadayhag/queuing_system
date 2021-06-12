import sys
import os

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine, QQmlEngine
from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from texts import automateLogin, queue
from classes import login, create
from classes.adminFunctions import account, admin, apply, home, instructor, offer, request, roomreserve, setAppointment, student


class splashScreen(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.queue_reset()
        self.typeText = None

    @Slot()
    def keepMeLoggedIn(self):
        txtLocationAndName = os.path.join(
            os.getcwd(),
            r"texts/fileDirectoryText.txt"
        )

        txtFile = open(
            txtLocationAndName,
            "r"
        )
        for x in txtFile:
            self.typeText = x.split(',')[3]
        txtFile.close()

    @Slot(result=str)
    def userInterface(self):
        if (automateLogin.automateLogin().keepMeLoggedIn()):
            return self.typeText
        else:
            return "login"

    def queue_reset(self):
        queue.reset().check_date()
