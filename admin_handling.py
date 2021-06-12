import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal

from classes import database

class admin_handling(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.fromDB = database.database()
        self.sql_statement = None
        self.sql_data = None
        self.sql_list = None

    getInstructorSignal = Signal(str, str)
    @Slot()
    def getInstructors(self):
        self.sql_statement = "SELECT * FROM accounts WHERE type = 'instructor'"
        self.sql_list = self.fromDB.selectall(self.sql_statement)
        for x in self.sql_list:
            self.getInstructorSignal.emit(x[1], x[0])

    getAdminSignal = Signal(str, str)
    @Slot()
    def getAdmins(self):
        self.sql_statement = "SELECT * FROM accounts WHERE type = 'admin'"
        self.sql_list = self.fromDB.selectall(self.sql_statement)
        for x in self.sql_list:
            self.getAdminSignal.emit(x[1], x[0])

    @Slot(str)
    def makeAdmin(self, id):
        self.sql_statement = "UPDATE accounts SET type = 'admin' WHERE id = %s"
        self.sql_data = (id,)
        self.fromDB.setValues(self.sql_statement, self.sql_data)

    @Slot(str)
    def makeInstructor(self, id):
        self.sql_statement = "UPDATE accounts SET type = 'instructor' WHERE id = %s"
        self.sql_data = (id,)
        self.fromDB.setValues(self.sql_statement, self.sql_data)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    AdminHandling = admin_handling()
    engine.rootContext().setContextProperty("AdminHandling", AdminHandling)
    engine.load("qml/admin_handling.qml")

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
