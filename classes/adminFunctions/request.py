import os, smtplib

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from classes import database, emailfunction

class appointment(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.sendMail = emailfunction.emailfunction()
        self.day = None
        self.date = None
        self.month = None 
        self.year = None
        self.hour = None 
        self.minute = None
        self.fromDB = database.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None
        self.server = None
        self.idText = None
        self.nameText = None
        # self.sender_email = None
        
    @Slot()
    def getCurrentAccount(self):
        txtLocationAndName = os.path.join(
            os.getcwd(), 
            r"texts/fileDirectoryText.txt"
        )

        txtFile = open(
            txtLocationAndName, 
            "r"
        )

        for x in txtFile:
            self.idText = x.split(',')[0]
            self.nameText = x.split(',')[2]
        txtFile.close()

        # self.sender_email = "HiraethDesu@gmail.com" # self.idText + "@xu.edu.ph"
    
    displayClearSignal = Signal()
    displaySignal = Signal(str, str)
    displaySignal2 = Signal(int, str)
    displaySignal3 = Signal(int, str)
    displaySignal4 = Signal(int, str)
    displaySignal5 = Signal(int, int)
    displaySignal6 = Signal(int, str)
    @Slot()
    def display(self):
        self.displayClearSignal.emit()
        self.sqlString = "SELECT imgurl, name, accounts.id_school, program, date, time, reason, setappointment.id FROM setappointment JOIN accounts ON setappointment.account = accounts.id JOIN accountimg ON setappointment.account = accountimg.id LEFT JOIN studentinfo ON setappointment.account = studentinfo.id WHERE instructor = '" + self.idText + "' AND status = 'pending';"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        count = 0
        for x in self.sqlList:
            self.sqlString = x[4] + " at " + x[5]

            self.displaySignal.emit(x[1], x[2])
            self.displaySignal2.emit(count, x[3])
            self.displaySignal3.emit(count, self.sqlString)
            self.displaySignal4.emit(count, x[6])
            self.displaySignal5.emit(count, x[7])
            self.displaySignal6.emit(count, x[0])
            
            count += 1

    @Slot(int)
    def acceptRequest(self, id):
        self.sqlString = "UPDATE setappointment SET status = 'accepted' WHERE id = %s"
        self.sqlData = (id,)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "SELECT name FROM accounts WHERE id = (SELECT account FROM setappointment WHERE id = %s)"
        self.sqlData = (id,)
        name = self.fromDB.selectone(self.sqlString, self.sqlData)[0]
        name = name.split()[0]

        self.sendMail.sendemail_accepted("shanpadayhag@gmail.com", name, id)

    @Slot(int)
    def declineRequest(self, id):
        self.sqlString = "UPDATE setappointment SET status = 'declined' WHERE id = %s"
        self.sqlData = (id,)
        self.fromDB.setValues(self.sqlString, self.sqlData)

        self.sqlString = "SELECT name FROM accounts WHERE id = (SELECT account FROM setappointment WHERE id = %s)"
        self.sqlData = (id,)
        name = self.fromDB.selectone(self.sqlString, self.sqlData)[0]
        name = name.split()[0]

        self.sendMail.sendemail_declined("shanpadayhag@gmail.com", name, id)


