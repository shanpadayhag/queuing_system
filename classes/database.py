import mysql.connector
from mysql.connector.locales.eng import client_error


class database:
    def __init__(self):
        self.conn = None
        self.csr = None
        self.result = None

    def connect(self):
        self.conn = mysql.connector.connect(
            host='localhost',
            user='root',
            passwd='root',
            database='rappo_project_00'
        )
        self.csr = self.conn.cursor()

    def closeDB(self):
        self.csr.close()
        self.conn.close()

    def selectone(self, sqlString, sqlData):
        self.connect()

        self.csr.execute(sqlString, sqlData)
        self.result = self.csr.fetchone()

        self.closeDB()

        if (self.result == None):
            self.result = "-1"

        return self.result

    def selectall(self, sqlString):
        self.connect()

        self.csr.execute(sqlString)
        self.result = self.csr.fetchall()

        self.closeDB()

        return self.result

    def setValues(self, sqlString, sqlData):
        self.connect()

        self.csr.execute(sqlString, sqlData)
        self.conn.commit()

        self.closeDB()

    def start(self):
        self.connect()

        sql_statement = "CREATE TABLE IF NOT EXISTS `accounts` (`id` int NOT NULL AUTO_INCREMENT,`id_school` varchar(20) NOT NULL,`name` varchar(255) NOT NULL,`type` enum('student','instructor','admin') NOT NULL,`password` varchar(255) NOT NULL DEFAULT 'changePass',PRIMARY KEY (`id`),UNIQUE KEY `id` (`id_school`),UNIQUE KEY `id_UNIQUE` (`id`))"
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `accountimg` (`id` int NOT NULL,`img` mediumblob,`imgurl` varchar(255) GENERATED ALWAYS AS (concat(_utf8mb4'../../../../img/user_imgs/',`id`,_utf8mb4'.jpg')) STORED,PRIMARY KEY (`id`))"
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `studentinfo` (`id` int NOT NULL,`program` enum('Computer Science','Entertainment and Multimedia Computing','Information System','Information Technology') NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `id_UNIQUE` (`id`),CONSTRAINT `studentinfo_id` FOREIGN KEY (`id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE)"
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `instructorinfo` (`id` int NOT NULL, `status` tinyint(1) DEFAULT '0', PRIMARY KEY (`id`), UNIQUE KEY `id` (`id`), CONSTRAINT `instructorinfo_id` FOREIGN KEY (`id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE)"
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `chairmans` (`programs` varchar(45) NOT NULL, `id` int DEFAULT NULL, PRIMARY KEY (`programs`), UNIQUE KEY `programs` (`programs`), KEY `chairmans_idx` (`id`), CONSTRAINT `chairmans_id` FOREIGN KEY (`id`) REFERENCES `accounts` (`id`) ON DELETE SET NULL)"
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `courses` (`id` varchar(45) NOT NULL, `name` varchar(255) DEFAULT NULL, PRIMARY KEY (`id`), UNIQUE KEY `id` (`id`))"
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `instructorcourses` (`instructor` int NOT NULL, `course` varchar(255) NOT NULL, PRIMARY KEY (`instructor`,`course`), KEY `instructorcourses_course_idx` (`course`), CONSTRAINT `instructorcourses_course` FOREIGN KEY (`course`) REFERENCES `courses` (`id`) ON DELETE CASCADE, CONSTRAINT `instructorcourses_instructor` FOREIGN KEY (`instructor`) REFERENCES `accounts` (`id`) ON DELETE CASCADE)"
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `queue` (`number` varchar(45) NOT NULL DEFAULT '0', `date` varchar(45) NOT NULL DEFAULT '19 January 2001', PRIMARY KEY (`number`,`date`))"
        self.csr.execute(sql_statement)

        sql_statement = """CREATE TABLE IF NOT EXISTS `enrollmentreport` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `queuenumber` varchar(45) NOT NULL,
                            `date` varchar(45) NOT NULL,
                            `time` varchar(45) NOT NULL,
                            `status` enum('onQueue','done','cancelled') NOT NULL DEFAULT 'onQueue',
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `id` (`id`)
                            )"""
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `rooms` (`id` varchar(5) NOT NULL, `status` tinyint(1) NOT NULL DEFAULT '1', PRIMARY KEY (`id`), UNIQUE KEY `id` (`id`))"
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `reservedroom` (`id` int unsigned NOT NULL AUTO_INCREMENT, `account` int NOT NULL, `room` varchar(5) NOT NULL, `purpose` varchar(255) DEFAULT NULL, `dateborrowed` varchar(45) NOT NULL, `timeborrowed` varchar(45) NOT NULL, `returned` enum('onHand','requestReturn','returned') NOT NULL DEFAULT 'onHand', `datereturned` varchar(45) DEFAULT NULL, `timereturned` varchar(45) DEFAULT NULL, PRIMARY KEY (`id`), UNIQUE KEY `id` (`id`), KEY `reservedroom_account_idx` (`account`), KEY `reservedroom_room_idx` (`room`), CONSTRAINT `reservedroom_account` FOREIGN KEY (`account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE, CONSTRAINT `reservedroom_room` FOREIGN KEY (`room`) REFERENCES `rooms` (`id`))"
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `setappointment` (`id` int NOT NULL AUTO_INCREMENT, `account` int DEFAULT NULL, `date` varchar(45) DEFAULT NULL, `time` varchar(45) DEFAULT NULL, `reason` varchar(255) DEFAULT NULL, `instructor` int DEFAULT NULL, `status` enum('pending','accepted','declined') NOT NULL DEFAULT 'pending', PRIMARY KEY (`id`), KEY `setappointment_account_idx` (`account`), KEY `setappointment_instructor_idx` (`instructor`), CONSTRAINT `setappointment_account` FOREIGN KEY (`account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE, CONSTRAINT `setappointment_instructor` FOREIGN KEY (`instructor`) REFERENCES `accounts` (`id`) ON DELETE CASCADE)"
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `serviceoffered` (`id` int NOT NULL AUTO_INCREMENT, `instructor` int NOT NULL, `servicetitle` varchar(255) NOT NULL, `servicemessage` varchar(255) DEFAULT NULL, `accepted` tinyint(1) NOT NULL DEFAULT '0', PRIMARY KEY (`id`), KEY `serviceoffered_instructor_idx` (`instructor`), CONSTRAINT `serviceoffered_instructor` FOREIGN KEY (`instructor`) REFERENCES `accounts` (`id`) ON DELETE CASCADE)"
        self.csr.execute(sql_statement)

        sql_statement = "CREATE TABLE IF NOT EXISTS `acceptedservice` (`student` int NOT NULL, `service` int NOT NULL, `date` varchar(45) NOT NULL, `time` varchar(45) NOT NULL, PRIMARY KEY (`student`,`service`), KEY `acceptedservice_services_idx` (`service`), CONSTRAINT `acceptedservice_services` FOREIGN KEY (`service`) REFERENCES `serviceoffered` (`id`) ON DELETE CASCADE, CONSTRAINT `acceptedservice_student` FOREIGN KEY (`student`) REFERENCES `accounts` (`id`) ON DELETE CASCADE)"
        self.csr.execute(sql_statement)
        
        sql_statement = """CREATE TABLE IF NOT EXISTS `current_queue_on_serve` (
                            `CS` varchar(10) NOT NULL,
                            `EMC` varchar(45) NOT NULL,
                            `IS` varchar(45) NOT NULL,
                            `IT` varchar(45) NOT NULL,
                            PRIMARY KEY (`CS`,`EMC`,`IS`,`IT`)
                        )"""
        self.csr.execute(sql_statement)
        self.closeDB()

    def setup_rooms(self):
        self.connect()

        self.csr.execute("INSERT INTO `rooms` (`id`) VALUES ('FH101');")
        self.csr.execute("INSERT INTO `rooms` (`id`) VALUES ('FH102');")
        self.csr.execute("INSERT INTO `rooms` (`id`) VALUES ('FH201');")
        self.csr.execute("INSERT INTO `rooms` (`id`) VALUES ('FH202');")
        self.csr.execute("INSERT INTO `rooms` (`id`) VALUES ('FH301');")
        self.csr.execute("INSERT INTO `rooms` (`id`) VALUES ('FH302');")
        self.conn.commit()

        self.closeDB()

    def setup_queue(self):
        self.connect()

        self.csr.execute("INSERT INTO `queue` (`number`, `date`) VALUES ('0', '0');")
        self.conn.commit()

        self.closeDB()

    def setup_chairmans(self):
        self.connect()

        self.csr.execute(
            "INSERT INTO `chairmans` (`programs`, `id`) VALUES ('CS', NULL);")
        self.csr.execute(
            "INSERT INTO `chairmans` (`programs`, `id`) VALUES ('EMC', NULL);")
        self.csr.execute(
            "INSERT INTO `chairmans` (`programs`, `id`) VALUES ('IS', NULL);")
        self.csr.execute(
            "INSERT INTO `chairmans` (`programs`, `id`) VALUES ('IT', NULL);")
        self.conn.commit()

        self.closeDB()
    
    def setup_queue_screen(self):
        self.connect()

        self.csr.execute("INSERT INTO `current_queue_on_serve` (`CS`, `EMC`, `IS`, `IT`) VALUES ('None', 'None', 'None', 'None');")
        self.conn.commit()

        self.closeDB()