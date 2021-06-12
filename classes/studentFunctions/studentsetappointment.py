import os

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from classes import database

class setAppointment(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.fromDB = database.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None
        self.idText = None
        self.dayDictionary = {
            "0": "Sunday",
            "1": "Monday",
            "2": "Tuesday",
            "3": "Wednesday",
            "4": "Thursday",
            "5": "Friday",
            "6": "Saturday"
        }
        self.monthDictionary = {
            "0": "January",
            "1": "February",
            "2": "March",
            "3": "April",
            "4": "May",
            "5": "June",
            "6": "July",
            "7": "August",
            "8": "September",
            "9": "October",
            "10": "November",
            "11": "December",
        }
        self.timeDictionary = {
            "1": "pm",
            "2": "pm",
            "3": "pm",
            "4": "pm",
            "5": "pm",
            "6": "am",
            "7": "am",
            "8": "am",
            "9": "am",
            "10": "am",
            "11": "am",
            "12": "nn",
        }

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
        txtFile.close()

    displayInstructorSignal = Signal(str, int)
    displayInstructorSignal2 = Signal(int, int)
    displayInstructorSignal3 = Signal(int, str)
    @Slot()
    def displayInstructors(self):
        self.sqlString = "SELECT name, accounts.id, status, imgurl FROM accounts JOIN instructorinfo ON accounts.id = instructorinfo.id JOIN accountimg ON accounts.id = accountimg.id WHERE type = 'instructor' or type = 'admin'"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        count = 0
        for x in self.sqlList:
            self.displayInstructorSignal.emit(x[0], x[1])
            self.displayInstructorSignal2.emit(count, x[2])
            self.displayInstructorSignal3.emit(count, x[3])

            count += 1
    
    displayCoursesSignal = Signal(str)
    @Slot(str)
    def displayCourses(self, id):
        self.sqlString = "SELECT course FROM instructorcourses WHERE instructor = '" + id + "'"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        for x in self.sqlList:
            self.displayCoursesSignal.emit(x[0])

    @Slot(str, str, str, str)
    def setAppointment(self, dateSelected, timeSelected, reason, instructor):
        day, date, month, year = dateSelected.split(",")
        hour = timeSelected.split(":")[0]
        
        dateSelected = self.dayDictionary[day] + ", " + date + " "  + self.monthDictionary[month] + " "  + year
        timeSelected += " " + self.timeDictionary[hour]

        self.sqlString = "INSERT INTO setappointment (account, date, time, reason, instructor) VALUES (%s, %s, %s, %s, %s)"
        self.sqlData = (self.idText, dateSelected, timeSelected, reason, instructor)
        self.fromDB.setValues(self.sqlString, self.sqlData)