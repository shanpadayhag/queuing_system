import sys
import os

# MODULE IMPORTS
from PyQt5.QtGui import QGuiApplication, QIcon
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QSize

# SELF CREATED MODULE IMPORTS
from classes import create, login, queue, splashScreen
from classes.adminFunctions import admin, home, instructor, roomreserve, student, setAppointment, offer, apply, account, request
from classes.studentFunctions import studentaccount, studentapply, studenthome, studentmain, studentreserve, studentsetappointment
from classes.instructorFunctions import instructoraccount, instructorhome, instructormain, instructoroffer, instructorrequest, instructorroom

class start:
    def __init__(self):
        self.app = QGuiApplication(sys.argv)
        self.engine = QQmlApplicationEngine()
        self.app_icon = QIcon()
        
        self.set_icons()
    
    def load_ui(self):
        self.engine.load(os.path.join(os.getcwd(), "qml/main.qml"))
        self.engine.load(os.path.join(os.getcwd(), "qml/ui/login/login.qml"))
        self.engine.load(os.path.join(os.getcwd(), "qml/ui/admin/admin.qml"))
        self.engine.load(os.path.join(os.getcwd(), "qml/ui/student/student.qml"))
        self.engine.load(os.path.join(os.getcwd(), "qml/ui/instructor/instructor.qml"))

        if not self.engine.rootObjects():
            sys.exit(-1)
        sys.exit(self.app.exec_())
    
    def instructor_context(self):
        InstructorMain = instructormain.main()
        self.engine.rootContext().setContextProperty("InstructorMain", InstructorMain)

        InstructorHome = instructorhome.home()
        self.engine.rootContext().setContextProperty("InstructorHome", InstructorHome)

        InstructorRequest = instructorrequest.appointment()
        self.engine.rootContext().setContextProperty("InstructorRequest", InstructorRequest)

        InstructorOfferService = instructoroffer.service()
        self.engine.rootContext().setContextProperty(
            "InstructorOfferService", InstructorOfferService)

        InstructorRoomReservation = instructorroom.reserve()
        self.engine.rootContext().setContextProperty(
            "InstructorRoomReservation", InstructorRoomReservation)

        InstructorAccountDetails = instructoraccount.details()
        self.engine.rootContext().setContextProperty(
            "InstructorAccountDetails", InstructorAccountDetails)

        self.load_ui()
    
    def student_context(self):
        StudentMain = studentmain.main()
        self.engine.rootContext().setContextProperty("StudentMain", StudentMain)

        StudentHome = studenthome.home()
        self.engine.rootContext().setContextProperty("StudentHome", StudentHome)

        StudentReserve = studentreserve.roomreserve()
        self.engine.rootContext().setContextProperty("StudentReserve", StudentReserve)

        StudentAppointment = studentsetappointment.setAppointment()
        self.engine.rootContext().setContextProperty(
            "StudentAppointment", StudentAppointment)

        StudentDetails = studentaccount.details()
        self.engine.rootContext().setContextProperty("StudentDetails", StudentDetails)

        StudentApplyService = studentapply.service()
        self.engine.rootContext().setContextProperty(
            "StudentApplyService", StudentApplyService)

        self.instructor_context()
    
    def admin_context(self):
        AdminMain = admin.main()
        self.engine.rootContext().setContextProperty("AdminMain", AdminMain)

        AdminHome = home.home()
        self.engine.rootContext().setContextProperty("AdminHome", AdminHome)

        AdminReservation = roomreserve.roomreserve()
        self.engine.rootContext().setContextProperty("AdminReservation", AdminReservation)

        AdminStudent = student.student()
        self.engine.rootContext().setContextProperty("AdminStudent", AdminStudent)

        AdminInstructor = instructor.instructor()
        self.engine.rootContext().setContextProperty("AdminInstructor", AdminInstructor)

        AdminSetAppointment = setAppointment.setAppointment()
        self.engine.rootContext().setContextProperty(
            "AdminSetAppointment", AdminSetAppointment)

        AdminOfferService = offer.service()
        self.engine.rootContext().setContextProperty("AdminOfferService", AdminOfferService)

        AdminApplyService = apply.service()
        self.engine.rootContext().setContextProperty("AdminApplyService", AdminApplyService)

        AdminAccountDetails = account.details()
        self.engine.rootContext().setContextProperty(
            "AdminAccountDetails", AdminAccountDetails)

        AdminRequestAppointment = request.appointment()
        self.engine.rootContext().setContextProperty(
            "AdminRequestAppointment", AdminRequestAppointment)

        self.student_context()
    
    def createaccount_context(self):
        CreateAccount = create.account()
        self.engine.rootContext().setContextProperty("CreateAccount", CreateAccount)
        
        self.admin_context()
    
    def queue_context(self):
        QueueNumber = queue.number()
        self.engine.rootContext().setContextProperty("QueueNumber", QueueNumber)

        self.createaccount_context()
    
    def login_context(self):
        Login = login.login()
        self.engine.rootContext().setContextProperty("Login", Login)

        self.queue_context()
        
    def splashscreen_context(self):
        SplashScreen = splashScreen.splashScreen()
        self.engine.rootContext().setContextProperty("SplashScreen", SplashScreen)
            
        self.login_context()

    def set_icons(self):
        app_icon_dir = os.path.join(os.getcwd(), "app_icon/16x16.png")
        self.app_icon.addFile(app_icon_dir, QSize(16, 16))
        self.app_icon.addFile(app_icon_dir, QSize(24, 24))
        self.app_icon.addFile(app_icon_dir, QSize(32, 32))
        self.app_icon.addFile(app_icon_dir, QSize(48, 48))
        self.app_icon.addFile(app_icon_dir, QSize(256, 256))
        self.app.setWindowIcon(self.app_icon)

        self.splashscreen_context()