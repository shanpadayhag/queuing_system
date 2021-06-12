import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    function openWindow(appWindow) {
        if (appWindow === "login") {
            Login.showWindow()
        } else if (appWindow === "admin") {
            AdminMain.showWindow()
            AdminMain.getCurrentAccount()
            AdminMain.goOnline()
        } else if (appWindow === "student") {
            StudentMain.showWindow()
            StudentMain.getCurrentAccount()
        } else if (appWindow === "instructor") {
            InstructorMain.showWindow()
            InstructorMain.getCurrentAccount()
            InstructorMain.goOnline()
        }
    }

    function setUIName(name) {
        AdminMain.getCurrentAccount()
    }
    
    Connections {
        target: Login
    }
    
    Connections {
        target: AdminMain
    }
    
    Connections {
        target: StudentMain
    }
    
    /*Connections {
        target: InstructorMain
    }*/
}