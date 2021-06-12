import mysql.connector
import classes.currentAccount as currentAccount

class dtbs:
    def __init__(self):
        pass

    def databaseConnection(self):
        self.conn = mysql.connector.connect(
            host = 'localhost',
            user = 'root',
            passwd = 'root',
            database = 'ccsstudents'
        )
        self.csr = self.conn.cursor()

    def compareInDatabase(self, dbTable, dbData):
        dtbs.databaseConnection(self)
        if (dbTable == 'login'):
            sqlString = "SELECT * FROM login where ID = %s and Password = %s"
            self.csr.execute(sqlString, dbData)
            accDetails = self.csr.fetchone()

            self.csr.close()
            self.conn.close()

            return accDetails

    def accountType(self, dbTable, dbData):
        dtbs.databaseConnection(self)
        if (dbTable == 'login'):
            sqlString = "SELECT Type FROM login where ID = %s and Password = %s"
            self.csr.execute(sqlString, dbData)
            type = self.csr.fetchone()
        
            self.csr.close()
            self.conn.close()

            return type[0]

    def addInDatabase(self, name, id, passcode, table, atype):
        dtbs.databaseConnection(self)

        dbData = (id, passcode, atype)
        sqlString = "INSERT INTO login (ID, Password, Type) VALUES (%s, %s, %s)"
        self.csr.execute(sqlString, dbData)
        
        dbData = (id, name)
        sqlString = "INSERT INTO " + table + " (" + atype + "ID, " + atype + "Name) VALUES (%s, %s)"
        self.csr.execute(sqlString, dbData)

        self.conn.commit()
    
        self.csr.close()
        self.conn.close()

    def fromDatabasetoQML(self, table):
        dtbs.databaseConnection(self)

        sqlString = 'SELECT * FROM ' + table
        self.csr.execute(sqlString)

        result = self.csr.fetchall()

        self.csr.close()
        self.conn.close()

        return result

    def removeInDatabase(self, id, table, type):
        dtbs.databaseConnection(self)
        
        dbData = (id,)
        sqlString = "DELETE FROM " + table + " WHERE " + type + "ID = '%s'"
        self.csr.execute(sqlString, dbData)
        sqlString = "DELETE FROM login WHERE ID = %s"
        self.csr.execute(sqlString, dbData)

        self.conn.commit()
    
        self.csr.close()
        self.conn.close()

    def getCourses(self):
        dtbs.databaseConnection(self)

        sqlString = "SELECT * FROM coursesubject"
        self.csr.execute(sqlString)

        result = self.csr.fetchall()

        self.csr.close()
        self.conn.close()

        return result 

    def getCoursesTaken(self, accountID):
        dtbs.databaseConnection(self)

        dbData = (accountID,)
        sqlString = "SELECT * FROM accountcourse WHERE accountID = %s"
        self.csr.execute(sqlString, dbData)

        result = self.csr.fetchall()

        self.csr.close()
        self.conn.close()

        return result 

    def changeToTaken(self, courseID):
        dtbs.databaseConnection(self)

        dbData = (currentAccount.accountID, courseID)
        sqlString = "INSERT INTO accountcourse (accountID, courseID) VALUES (%s, %s)"

        self.csr.execute(sqlString, dbData)

        self.conn.commit()

        self.csr.close()
        self.conn.close()

    def changeToUntaken(self, courseID):
        dtbs.databaseConnection(self)

        dbData = (courseID,)
        sqlString = "DELETE FROM accountcourse WHERE courseID = %s"

        self.csr.execute(sqlString, dbData)

        self.conn.commit()

        self.csr.close()
        self.conn.close()
    
    def getCoursesForHome(self):
        dtbs.databaseConnection(self)

        sqlString = "SELECT * FROM coursesubject"
        self.csr.execute(sqlString)

        result = self.csr.fetchall()

        self.csr.close()
        self.conn.close()

        return result 

    def saveCourses(self, code, name):
        dtbs.databaseConnection(self)

        dbData = (code, name)
        sqlString = "INSERT INTO coursesubject (courseID, courseName) VALUES (%s, %s)"
        self.csr.execute(sqlString, dbData)

        self.conn.commit()
    
        self.csr.close()
        self.conn.close()

    def deleteCourses(self, codex):
        dtbs.databaseConnection(self)

        dbData = (codex,)
        sqlString = "DELETE FROM coursesubject WHERE courseID = %s"
        self.csr.execute(sqlString, dbData)

        self.conn.commit()
    
        self.csr.close()
        self.conn.close()
    
    def borrowRoom(self, roomID, purpose):
        dtbs.databaseConnection(self)

        dbData = (currentAccount.accountID, roomID, purpose)
        sqlString = "INSERT INTO keyborrower (accountID, roomID, purpose) VALUES (%s, %s, %s)"
        self.csr.execute(sqlString, dbData)

        dbData = (roomID,)
        sqlString = "UPDATE roomstatus SET availability = 0 WHERE roomID = %s"
        self.csr.execute(sqlString, dbData)

        self.conn.commit()
    
        self.csr.close()
        self.conn.close()

    def checkAvailability(self, roomID):
        dtbs.databaseConnection(self)

        dbData = (roomID,)
        sqlString = "SELECT availability FROM roomstatus WHERE roomID = %s"
        self.csr.execute(sqlString, dbData)

        result = self.csr.fetchone()
    
        self.csr.close()
        self.conn.close()

        return result

    def getKeyRuterneeID(self):
        dtbs.databaseConnection(self)

        dbData = (currentAccount.accountID,)
        sqlString = "SELECT accountID FROM keyborrower WHERE accountID = %s"
        self.csr.execute(sqlString, dbData)

        result = self.csr.fetchall()

        self.csr.close()
        self.conn.close()

        return result

    def getAdminDB(self):
        dtbs.databaseConnection(self)

        sqlString = "SELECT * FROM admininfo"
        self.csr.execute(sqlString)

        result = self.csr.fetchall()

        self.csr.close()
        self.conn.close()

        return result

    def onlineStatus(self, table, status, accountType):
        dtbs.databaseConnection(self)

        dbData = (status, currentAccount.accountID)
        print(status, currentAccount.accountID, accountType, table)
        sqlString = "UPDATE " + table + " SET status = '%s' WHERE " + accountType + " = '%s'"
        self.csr.execute(sqlString, dbData)

        self.csr.commit()

        self.csr.close()
        self.conn.close()
