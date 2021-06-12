# This Python file uses the following encoding: utf-8
import sys
import os
import shutil

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal

from classes import database

class set_chairman(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.fromDB = database.database()
        self.sql_string = None
        self.sql_data = None 
        self.sql_list = None

    get_chairmans_signal = Signal(str, str)
    @Slot()
    def get_chairmans(self):
        self.sql_string = "SELECT programs, id_school FROM chairmans JOIN accounts ON chairmans.id = accounts.id;"
        self.sql_list = self.fromDB.selectall(self.sql_string)

        for x in self.sql_list:
            self.get_chairmans_signal.emit(str(x[1]), x[0])
    
    @Slot(str, str, str, str)
    def set_chairman(self, cs_chairman, emc_chairman, is_chairman, it_chairman):
        try:
            self.sql_string = "UPDATE `chairmans` SET `id` = (SELECT `id` FROM `accounts` WHERE `id_school` = %s) WHERE (`programs` = 'CS');"
            self.sql_data = (cs_chairman,)
            self.fromDB.setValues(self.sql_string, self.sql_data)
        except:
            pass

        try:
            self.sql_string = "UPDATE `chairmans` SET `id` = (SELECT `id` FROM `accounts` WHERE `id_school` = %s) WHERE (`programs` = 'EMC');"
            self.sql_data = (emc_chairman,)
            self.fromDB.setValues(self.sql_string, self.sql_data)
        except:
            pass

        try:
            self.sql_string = "UPDATE `chairmans` SET `id` = (SELECT `id` FROM `accounts` WHERE `id_school` = %s) WHERE (`programs` = 'IS');"
            self.sql_data = (is_chairman,)
            self.fromDB.setValues(self.sql_string, self.sql_data)
        except:
            pass
        
        try:
            self.sql_string = "UPDATE `chairmans` SET `id` = (SELECT `id` FROM `accounts` WHERE `id_school` = %s) WHERE (`programs` = 'IT');"
            self.sql_data = (it_chairman,)
            self.fromDB.setValues(self.sql_string, self.sql_data)
        except:
            pass

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    SetChairman = set_chairman()
    engine.rootContext().setContextProperty("SetChairman", SetChairman)
    engine.load("qml/set_chairman.qml")

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
