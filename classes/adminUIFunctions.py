import sys
from PyQt5.QtCore import QObject,  pyqtSignal, pyqtSlot
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
import classes.dbConnect as dbConnect
import classes.currentAccount as currentAccount

class accounts(QObject):
    def __init__(self):
        QObject.__init__(self)

    callTheFunctionSignal = pyqtSignal(str, int)
    clearTheModelSignal = pyqtSignal()
    @pyqtSlot(str)
    def callTheFunction(self, table):
        iList = list(self.getFromDatabase(table))
        self.clearTheModelSignal.emit()
        for x in iList:
             self.callTheFunctionSignal.emit(x[1], x[0])
    
    def getFromDatabase(self, table):
        return dbConnect.dtbs.fromDatabasetoQML(self, table)

    @pyqtSlot(str, str, str, str, str)
    def addToDatabase(self, siname, sid, sipassword, sitable, sitype):
        dbConnect.dtbs.addInDatabase(self, siname.title(), int(sid), sipassword, sitable, sitype)

    @pyqtSlot(str, str, str)
    def removeFromDatabase(self, sid, sitable, sitype):
        dbConnect.dtbs.removeInDatabase(self, int(sid), sitable, sitype)

    @pyqtSlot(int)
    def onlineStatus(self, status):
        if (currentAccount.accountType == 'admin'):
            table = 'admininfo'
            accountType = 'adminID'
        else:
            table = 'instructorinfo'
            accountType = 'instructorID'
        dbConnect.dtbs.onlineStatus(self, table, int(status), accountType)

    

class accountDetailsFunction(QObject):
    def __init__(self):
        QObject.__init__(self)

    clearModels = pyqtSignal()
    untakenCourses = pyqtSignal(str)
    @pyqtSlot()
    def courseUntaken(self):
        listCoursesUntaken = list(dbConnect.dtbs.getCourses(self))
        listCoursesTaken = list(dbConnect.dtbs.getCoursesTaken(self, currentAccount.accountID))
        self.clearModels.emit()
        if not listCoursesTaken:
            for x in listCoursesUntaken:
                self.untakenCourses.emit(x[0])
        else:
            for x in listCoursesUntaken:
                count = 0
                for y in listCoursesTaken:
                    if (x[0] == y[1]):
                        break
                    elif (count == (len(listCoursesTaken) - 1)):
                        self.untakenCourses.emit(x[0])
                    count += 1

    takenCourses = pyqtSignal(str)
    @pyqtSlot()
    def courseTaken(self):
        listCourses = list(dbConnect.dtbs.getCoursesTaken(self, currentAccount.accountID))
        if (listCourses == None):
            pass
        else:
            for x in listCourses:
                self.takenCourses.emit(x[1])

    @pyqtSlot(str)
    def changeToTaken(self, courseID):
        dbConnect.dtbs.changeToTaken(self, courseID)

    @pyqtSlot(str)
    def changeToUntaken(self, courseID):
        dbConnect.dtbs.changeToUntaken(self, courseID)

class homeFunctions(QObject):
    def __init__(self):
        QObject.__init__(self)

    clearModel = pyqtSignal()
    getCoursesData = pyqtSignal(str)
    @pyqtSlot()
    def getCourses(self):
        listCourses = list(dbConnect.dtbs.getCoursesForHome(self))
        self.clearModel.emit()
        for x in listCourses:
            self.getCoursesData.emit(x[0])

    @pyqtSlot(str, str)
    def saveCourses(self, code, name):
        dbConnect.dtbs.saveCourses(self, code, name)

    @pyqtSlot(str)
    def deleteCourse(self, codex):
        dbConnect.dtbs.deleteCourses(self, codex)

    returnKeyReturneeID = pyqtSignal(int)
    @pyqtSlot()
    def getKeyRuterneeID(self):
        keyReturneeID = list(dbConnect.dtbs.getKeyRuterneeID(self))
        for x in keyReturneeID:
            self.returnKeyReturneeID.emit(x[0])


class roomFunctions(QObject):
    def __init__(self):
        QObject.__init__(self)
    
    @pyqtSlot(str, str)
    def borrow(self, roomID, purpose):
        dbConnect.dtbs.borrowRoom(self, roomID, purpose)

    checkAvailabilitySignal = pyqtSignal(int)
    @pyqtSlot(str)
    def checkAvailability(self, roomID):
        availability = list(dbConnect.dtbs.checkAvailability(self, roomID))
        self.checkAvailabilitySignal.emit(availability[0])

class appointmentFunctions(QObject):
    def __init__(self):
        QObject.__init__(self)
    
    callTheFunctionSignal = pyqtSignal(str, int, int)
    clearTheModelSignal = pyqtSignal()
    @pyqtSlot(str)
    def callTheFunction(self, table):
        iList = list(dbConnect.dtbs.fromDatabasetoQML(self, table))
        self.clearTheModelSignal.emit()
        for x in iList:
             self.callTheFunctionSignal.emit(x[1], x[2], x[0])

    giveAdmin = pyqtSignal(str, int, int)
    @pyqtSlot()
    def getAdminDB(self):
        adminList = list(dbConnect.dtbs.getAdminDB(self))
        for x in adminList:
            self.giveAdmin.emit(x[1], x[2], x[0])

    takenCourses = pyqtSignal(str)
    @pyqtSlot(int)
    def courseTaken(self, accountID):
        listCourses = list(dbConnect.dtbs.getCoursesTaken(self, accountID))
        if (listCourses == None):
            pass
        else:
            for x in listCourses:
                self.takenCourses.emit(x[1])

class servicesFunctions(QObject):
    def __init__(self):
        QObject.__init__(self)
