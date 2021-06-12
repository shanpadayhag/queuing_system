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
        self.programText = None
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
    
    @Slot(result=str)
    def getProgram(self):
        self.sqlString = "SELECT program FROM studentinfo WHERE id = %s"
        self.sqlData = (self.idText,)
        self.programText = self.fromDB.selectone(self.sqlString, self.sqlData)[0]
        return self.programText
    
    @Slot(str, str, str, str, str, result=bool)
    def confirm_changes(self, name, id_school, password, imgUrl, program):
        try:
            self.sqlString = "UPDATE accounts a JOIN studentinfo s ON a.id = s.id SET id_school = %s, name = %s, password = %s, program = %s WHERE a.id = %s"
            self.sqlData = (id_school, name, password, program, self.idText)
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