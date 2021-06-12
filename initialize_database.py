import sys
import os
import mysql.connector

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot
from mysql.connector.locales.eng import client_error

from classes import database

class init_db(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.fromDB = database.database()
        self.conn = None 
        self.csr = None

    @Slot()
    def init_db(self):
        try:
            self.fromDB.start()
            self.fromDB.setup_rooms()
        except:
            try:
                self.create_schema()
                self.fromDB.start()
                self.fromDB.setup_rooms()
                self.fromDB.setup_queue()
                self.fromDB.setup_chairmans()
            except:
                try:
                    self.fromDB.setup_rooms()
                    self.fromDB.setup_queue()
                    self.fromDB.setup_chairmans()
                except:
                    pass
    
    def create_schema(self):
        self.conn = mysql.connector.connect(
            host='localhost',
            user='root',
            passwd='root'
        )
        self.csr = self.conn.cursor()
        self.csr.execute("CREATE DATABASE computer_studies")
        self.csr.close()
        self.conn.close()

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    InitializeDatabase = init_db()
    engine.rootContext().setContextProperty("InitializeDatabase", InitializeDatabase)

    engine.load("qml/init_db.qml")

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
