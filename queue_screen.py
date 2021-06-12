# This Python file uses the following encoding: utf-8
import sys
import os
import shutil
import re

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal

from classes import database

class queue_screen(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.fromDB = database.database()
        self.sql_statement = None
        self.on_queue = None
        self.current_serving_queue = None
        self.temp = None
    
    _set_texts_signal = Signal(str, str, str, str)
    @Slot()
    def get_queues(self):
        self.sql_statement = "SELECT * FROM current_queue_on_serve"
        self.current_serving_queue = self.fromDB.selectall(self.sql_statement)[0]

        self._set_texts_signal.emit(self.current_serving_queue[0], self.current_serving_queue[1], self.current_serving_queue[2], self.current_serving_queue[3])

        self.sql_statement = "SELECT queuenumber FROM enrollmentreport WHERE status = 'onQueue' LIMIT 40"
        self.on_queue = self.fromDB.selectall(self.sql_statement)
        
        for queue in self.on_queue:
            self.temp = re.split("(\d+)", queue[0])[0]
            if self.temp == "CS":
                self.cs_data(queue[0])
            elif self.temp == "EMC":
                self.emc_data(queue[0])
            elif self.temp == "IS":
                self.is_data(queue[0])
            elif self.temp == "IT":
                self.it_data(queue[0])
    
    _emc_signal = Signal(str)
    def emc_data(self, queue):
        self._emc_signal.emit(queue)
    
    _is_signal = Signal(str)
    def is_data(self, queue):
        self._is_signal.emit(queue)
    
    _it_signal = Signal(str)
    def it_data(self, queue):
        self._it_signal.emit(queue)
    
    _cs_signal = Signal(str)
    def cs_data(self, queue):
        self._cs_signal.emit(queue)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    QueueScreen = queue_screen()
    engine.rootContext().setContextProperty("QueueScreen", QueueScreen)

    engine.load("qml/queue_screen.qml")

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
