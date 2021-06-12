# This Python file uses the following encoding: utf-8
import sys
import os
import shutil

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot

from classes import database, imgto

class save_img(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.fromDB = database.database()
        self.get_img = imgto.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None
    
    @Slot()
    def save_img(self):
        folder_dir = os.path.join(os.getcwd(), "img/user_imgs")

        try:
            shutil.rmtree(folder_dir)
        except FileNotFoundError:
            print("File not found")

        try:
            os.makedirs(folder_dir)
        except FileExistsError:
            print("File already exists")

        self.sqlString = "SELECT id FROM accountimg"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        for x in self.sqlList:
            self.get_img.getimg(x[0])

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    SaveImg = save_img()
    engine.rootContext().setContextProperty("SaveImg", SaveImg)

    engine.load("qml/save_img.qml")

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
