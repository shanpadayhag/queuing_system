import mysql.connector
from mysql.connector.locales.eng import client_error

class database:
    def __init__(self):
        self.conn = None
        self.csr = None
        self.sqlString = None
        self.sqlData = None

    def connect(self):
        self.conn = mysql.connector.connect(
            host = 'localhost',
            user = 'root',
            passwd = 'root',
            database = 'computer_studies'
        )
        self.csr = self.conn.cursor()

    def closeDB(self):
        self.csr.close()
        self.conn.close()
    
    def saveimg(self, imgUrl, id):
        self.connect()

        with open(imgUrl, "rb") as img:
            BinaryData = img.read()
        self.sqlString = "UPDATE accountimg SET img = %s WHERE id = %s"
        self.csr.execute(self.sqlString, (BinaryData, id))
        self.conn.commit()

        self.closeDB()
    
    def getimg(self, id):
        self.connect()

        self.sqlString = "SELECT img FROM accountimg WHERE id = %s"
        self.csr.execute(self.sqlString, (id,))
        result = self.csr.fetchone()[0]

        self.closeDB()

        StoreFilePath = "img/user_imgs/{0}.jpg".format(str(id))

        with open (StoreFilePath, "wb") as img:
            img.write(result)
            img.close()
