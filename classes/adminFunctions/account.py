import os

from PyQt5.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot

from classes import database, imgto

class details(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.fromDB = database.database()
        self.add_img = imgto.database()
        self.sqlString = None
        self.sqlData = None
        self.sqlList = None
        self.idText = None
        self.school_id_text = None
        self.nameText = None
        self.passcodeText = None
        self.typeText = None
        self.imgText = None

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
            self.idText, self.school_id_text, self.nameText, self.typeText, self.passcodeText, self.imgText, dummy_value = x.split(',')
        txtFile.close()

    def updateTextFile(self, id, name, passcode, type, imgurl):
        txtString = self.idText + ","  + id + ","  + name + "," + type + "," + passcode + "," + imgurl + ","
        txtLocationAndName = os.path.join(
            os.getcwd(),
            r"texts/fileDirectoryText.txt"
        )
        txtFile = open(
            txtLocationAndName,
            "w"
        )
        txtFile.writelines(txtString)
        txtFile.close()

    @Slot(result=str)
    def getName(self):
        return self.nameText

    @Slot(result=str)
    def getID(self):
        return self.school_id_text

    @Slot(result=str)
    def getPass(self):
        return self.passcodeText

    @Slot(result=str)
    def getImg(self):
        return self.imgText

    displayCoursesFinalSignal = Signal(str)
    @Slot()
    def displayCoursesFinal(self):
        self.sqlString = "SELECT course FROM instructorcourses WHERE instructor = '" + self.idText + "'"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        for x in self.sqlList:
            self.displayCoursesFinalSignal.emit(x[0])

    displayHandledSignal = Signal(str)
    @Slot()
    def displayHandled(self):
        self.sqlString = "SELECT course FROM instructorcourses WHERE instructor = '" + self.idText + "'"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        for x in self.sqlList:
            self.displayHandledSignal.emit(x[0])

    displayNotHandledSignal = Signal(str)
    @Slot()
    def displayNotHandled(self):
        self.sqlString = "SELECT id FROM (SELECT * FROM instructorcourses WHERE instructor = '" + self.idText + "') AS courses_untaken RIGHT JOIN courses ON course = id WHERE instructor IS NULL;"
        self.sqlList = self.fromDB.selectall(self.sqlString)
        for x in self.sqlList:
            self.displayNotHandledSignal.emit(x[0])

    @Slot(str)
    def addToNotHandled(self, code):
        self.sqlString = "DELETE FROM instructorcourses WHERE instructor = %s and course = %s"
        self.sqlData = (self.idText, code)
        self.fromDB.setValues(self.sqlString, self.sqlData)

    @Slot(str)
    def addToHandled(self, code):
        self.sqlString = "INSERT INTO instructorcourses (instructor, course) VALUES (%s, %s)"
        self.sqlData = (self.idText, code)
        self.fromDB.setValues(self.sqlString, self.sqlData)

    @Slot(str, str, str, str, result=bool)
    def confirm_changes(self, name, id_school, password, imgUrl):
        try:
            self.sqlString = "UPDATE accounts SET id_school = %s, name = %s, password = %s WHERE id = %s"
            self.sqlData = (id_school, name, password, self.idText)
            self.fromDB.setValues(self.sqlString, self.sqlData)

            self.add_img.saveimg(imgUrl.replace("file:///", ""), self.idText)
            self.add_img.getimg(self.idText)

            self.sqlString = "SELECT imgurl FROM accountimg WHERE id = %s"
            self.sqlData = (self.idText,)
            self.sqlList = self.fromDB.selectone(self.sqlString, self.sqlData)
            self.updateTextFile(id_school, name, password, self.typeText, self.sqlList[0])
            self.getCurrentAccount()

            return True 
            
        except: 
            return False