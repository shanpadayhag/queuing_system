import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "controls"

Window {
    id: mainWindow
    width: 1101 //1101 // 1853
    height: 857 //857 // 1000
    minimumWidth: 800
    minimumHeight: 500
    visible: true
    color: "#00000000"
    title: qsTr("")
    Component.onCompleted: {
        x = Screen.width / 2 - width / 2
        y = Screen.height / 2 - height / 2
    }

    flags: Qt.Window | Qt.FramelessWindowHint

    property int windowStatus: 0
    QtObject {
            id: internal
            function maximizeRestore() {
                if (windowStatus == 0) {
                    mainWindow.showMaximized()
                    windowStatus = 1
                } else {
                    mainWindow.showNormal()
                    windowStatus = 0
                }
            }
            function ifMaximizedWindowRestore() {
                if(windowStatus == 1) {
                    mainWindow.showNormal()
                    windowStatus = 0
                }
            }
            function ifMinimizedWindowRestore() {
                windowStatus = 0
            }
        }

    Rectangle {
        id: windowDesign
        color: "#13141f"
        radius: 10
        anchors.bottom: parent.bottom
        anchors.fill: parent
        antialiasing: true
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0

        Rectangle {
            id: leftMenu
            width: 244
            color: "#11121b"
            radius: 10
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            clip: true

            ScrollView {
                id: scrollView
                clip: true
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: label.bottom
                anchors.bottom: parent.bottom
                antialiasing: false
                anchors.topMargin: 20
                ScrollBar.vertical.interactive: true
                contentHeight: 400

                LeftMenuBtn {
                    id: homeBtn
                    x: 0
                    isActiveMenu: true
                    width: 250
                    height: 56
                    opacity: 1
                    text: "Home"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pointSize: 12
                    antialiasing: false
                    btnColorClicked: "#1a1a40"
                    btnColorDefault: "#00000000"
                    anchors.topMargin: 10
                    btnColorMouseOver: "#b3202056"
                    anchors.leftMargin: 0
                    onClicked: {
                        homeBtn.isActiveMenu = true
                        setAppointmentBtn.isActiveMenu = false
                        requestAppointmentBtn.isActiveMenu = false
                        specialServicesBtn.isActiveMenu = false
                        roomReservationBtn.isActiveMenu = false
                        studentAccountsBtn.isActiveMenu = false
                        instructorAccountsBtn.isActiveMenu = false
                        roomStatusBtn.isActiveMenu = false
                        applyServicesBtn.isActiveMenu = false
                        stackViewLabel.text = '| Home'
                        stackView.push(Qt.resolvedUrl("pages/admin/home.qml"))
                    }
                }


                LeftMenuBtn {
                    id: setAppointmentBtn
                    x: 0
                    width: 250
                    height: 56
                    text: "Set Appointment"
                    anchors.left: parent.left
                    anchors.top: homeBtn.bottom
                    font.pointSize: 12
                    antialiasing: false
                    btnColorClicked: "#1a1a40"
                    anchors.topMargin: 0
                    btnColorMouseOver: "#b3202056"
                    btnColorDefault: "#00000000"
                    anchors.leftMargin: 0
                    onClicked: {
                        homeBtn.isActiveMenu = false
                        setAppointmentBtn.isActiveMenu = true
                        requestAppointmentBtn.isActiveMenu = false
                        specialServicesBtn.isActiveMenu = false
                        roomReservationBtn.isActiveMenu = false
                        studentAccountsBtn.isActiveMenu = false
                        instructorAccountsBtn.isActiveMenu = false
                        roomStatusBtn.isActiveMenu = false
                        applyServicesBtn.isActiveMenu = false
                        stackViewLabel.text = '| Set Appointment'
                        stackView.push(Qt.resolvedUrl("pages/admin/checkAvailability.qml"))
                    }
                }


                LeftMenuBtn {
                    id: requestAppointmentBtn
                    x: 40
                    width: 250
                    height: 56
                    text: "Appointment Request"
                    anchors.left: parent.left
                    anchors.top: setAppointmentBtn.bottom
                    font.pointSize: 12
                    antialiasing: false
                    btnColorClicked: "#1a1a40"
                    btnColorMouseOver: "#b3202056"
                    btnColorDefault: "#00000000"
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    onClicked: {
                        homeBtn.isActiveMenu = false
                        setAppointmentBtn.isActiveMenu = false
                        requestAppointmentBtn.isActiveMenu = true
                        specialServicesBtn.isActiveMenu = false
                        roomReservationBtn.isActiveMenu = false
                        studentAccountsBtn.isActiveMenu = false
                        instructorAccountsBtn.isActiveMenu = false
                        roomStatusBtn.isActiveMenu = false
                        applyServicesBtn.isActiveMenu = false
                        stackViewLabel.text = '| Appointment Request'
                        stackView.push(Qt.resolvedUrl("pages/admin/appointmentRequests.qml"))
                    }
                }


                LeftMenuBtn {
                    id: applyServicesBtn
                    x: 40
                    width: 250
                    height: 56
                    text: "Apply for Services"
                    anchors.left: parent.left
                    anchors.top: requestAppointmentBtn.bottom
                    font.pointSize: 12
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    btnColorDefault: "#00000000"
                    btnColorClicked: "#1a1a40"
                    antialiasing: false
                    btnColorMouseOver: "#b3202056"
                    onClicked: {
                        homeBtn.isActiveMenu = false
                        setAppointmentBtn.isActiveMenu = false
                        requestAppointmentBtn.isActiveMenu = false
                        specialServicesBtn.isActiveMenu = false
                        roomReservationBtn.isActiveMenu = false
                        studentAccountsBtn.isActiveMenu = false
                        instructorAccountsBtn.isActiveMenu = false
                        roomStatusBtn.isActiveMenu = false
                        applyServicesBtn.isActiveMenu = true
                        stackViewLabel.text = '| Appointment Request'
                        stackView.push(Qt.resolvedUrl("pages/admin/applyForService.qml"))
                    }
                }

                LeftMenuBtn {
                    id: specialServicesBtn
                    width: 250
                    height: 56
                    text: "Special Services"
                    anchors.left: parent.left
                    anchors.top: applyServicesBtn.bottom
                    anchors.topMargin: 0
                    font.pointSize: 12
                    antialiasing: false
                    anchors.leftMargin: 0
                    btnColorClicked: "#1a1a40"
                    btnColorMouseOver: "#b3202056"
                    btnColorDefault: "#00000000"
                    onClicked: {
                        homeBtn.isActiveMenu = false
                        setAppointmentBtn.isActiveMenu = false
                        requestAppointmentBtn.isActiveMenu = false
                        specialServicesBtn.isActiveMenu = true
                        roomReservationBtn.isActiveMenu = false
                        studentAccountsBtn.isActiveMenu = false
                        instructorAccountsBtn.isActiveMenu = false
                        roomStatusBtn.isActiveMenu = false
                        applyServicesBtn.isActiveMenu = false
                        stackViewLabel.text = '| Special Services'
                        stackView.push(Qt.resolvedUrl("pages/admin/specialServices.qml"))
                    }
                }


                LeftMenuBtn {
                    id: roomStatusBtn
                    x: 40
                    width: 250
                    height: 56
                    text: "Room Status"
                    anchors.left: parent.left
                    anchors.top: specialServicesBtn.bottom
                    font.pointSize: 12
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    btnColorDefault: "#00000000"
                    btnColorClicked: "#1a1a40"
                    antialiasing: false
                    btnColorMouseOver: "#b3202056"
                    onClicked: {
                        homeBtn.isActiveMenu = false
                        setAppointmentBtn.isActiveMenu = false
                        requestAppointmentBtn.isActiveMenu = false
                        specialServicesBtn.isActiveMenu = false
                        roomReservationBtn.isActiveMenu = false
                        studentAccountsBtn.isActiveMenu = false
                        instructorAccountsBtn.isActiveMenu = false
                        roomStatusBtn.isActiveMenu = true
                        applyServicesBtn.isActiveMenu = false
                        stackViewLabel.text = '| Instructor Accounts'
                        stackView.push(Qt.resolvedUrl("pages/admin/roomStatus.qml"))
                    }
                }

                LeftMenuBtn {
                    id: roomReservationBtn
                    x: 40
                    width: 250
                    height: 56
                    text: "Room Reservation"
                    anchors.left: parent.left
                    anchors.top: roomStatusBtn.bottom
                    font.pointSize: 12
                    antialiasing: false
                    btnColorClicked: "#1a1a40"
                    btnColorMouseOver: "#b3202056"
                    btnColorDefault: "#00000000"
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    onClicked: {
                        homeBtn.isActiveMenu = false
                        setAppointmentBtn.isActiveMenu = false
                        requestAppointmentBtn.isActiveMenu = false
                        specialServicesBtn.isActiveMenu = false
                        roomReservationBtn.isActiveMenu = true
                        studentAccountsBtn.isActiveMenu = false
                        instructorAccountsBtn.isActiveMenu = false
                        roomStatusBtn.isActiveMenu = false
                        applyServicesBtn.isActiveMenu = false
                        stackViewLabel.text = '| Room Reservation'
                        stackView.push(Qt.resolvedUrl("pages/admin/roomReservation.qml"))
                    }
                }


                LeftMenuBtn {
                    id: studentAccountsBtn
                    x: 40
                    width: 250
                    height: 56
                    text: "Student Accounts"
                    anchors.left: parent.left
                    anchors.top: roomReservationBtn.bottom
                    font.pointSize: 12
                    antialiasing: false
                    btnColorClicked: "#1a1a40"
                    btnColorMouseOver: "#b3202056"
                    btnColorDefault: "#00000000"
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    onClicked: {
                        homeBtn.isActiveMenu = false
                        setAppointmentBtn.isActiveMenu = false
                        requestAppointmentBtn.isActiveMenu = false
                        specialServicesBtn.isActiveMenu = false
                        roomReservationBtn.isActiveMenu = false
                        studentAccountsBtn.isActiveMenu = true
                        instructorAccountsBtn.isActiveMenu = false
                        roomStatusBtn.isActiveMenu = false
                        applyServicesBtn.isActiveMenu = false
                        stackViewLabel.text = '| Student Accounts'
                        stackView.push(Qt.resolvedUrl("pages/admin/students.qml"))
                    }
                }


                LeftMenuBtn {
                    id: instructorAccountsBtn
                    x: 40
                    width: 250
                    height: 56
                    text: "Instructor Accounts"
                    anchors.left: parent.left
                    anchors.top: studentAccountsBtn.bottom
                    font.pointSize: 12
                    antialiasing: false
                    btnColorClicked: "#1a1a40"
                    btnColorMouseOver: "#b3202056"
                    btnColorDefault: "#00000000"
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    onClicked: {
                        homeBtn.isActiveMenu = false
                        setAppointmentBtn.isActiveMenu = false
                        requestAppointmentBtn.isActiveMenu = false
                        specialServicesBtn.isActiveMenu = false
                        roomReservationBtn.isActiveMenu = false
                        studentAccountsBtn.isActiveMenu = false
                        instructorAccountsBtn.isActiveMenu = true
                        roomStatusBtn.isActiveMenu = false
                        applyServicesBtn.isActiveMenu = false
                        stackViewLabel.text = '| Instructor Accounts'
                        stackView.push(Qt.resolvedUrl("pages/admin/instructor.qml"))
                    }
                }



            }

            Label {
                id: label
                x: 40
                y: 100
                opacity: 1
                color: "#ffffff"
                text: qsTr("Admin UI")
                anchors.left: parent.left
                anchors.leftMargin: 30
                font.pointSize: 15
                font.bold: true
            }

        }

        Rectangle {
            id: contents
            opacity: 1
            color: "#00000000"
            radius: 10
            anchors.left: leftMenu.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 136
            clip: true

            StackView {
                id: stackView
                opacity: 1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                antialiasing: true
                initialItem: Qt.resolvedUrl("pages/admin/home.qml")
            }
        }

        Label {
            id: label1
            opacity: 1
            color: "#ffffff"
            text: qsTr("Queuing System")
            anchors.left: leftMenu.right
            anchors.top: parent.top
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 68
            font.bold: true
            font.pointSize: 15
            anchors.topMargin: 64
        }

        StatusSwitch {
            anchors.left: label1.right
            anchors.top: parent.top
            anchors.leftMargin: 13
            anchors.topMargin: 60

        }

        Label {
            id: stackViewLabel
            x: 866
            opacity: 1
            color: "#56595c"
            text: '| Home'
            anchors.right: parent.right
            anchors.bottom: contents.top
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 9
            anchors.rightMargin: 23
            font.pointSize: 12
        }

        Rectangle {
            id: topCornerBtns
            width: 164
            height: 73
            color: "#00000000"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.rightMargin: 0

            ExitRound {
                y: 28
                width: 15
                height: 15
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 30
                onClicked: mainWindow.close()
            }

            MinimizeRound {
                y: 18
                width: 15
                height: 15
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 75
                onClicked: {
                    mainWindow.showMinimized()
                    internal.ifMinimizedWindowRestore()
                }
            }

            MaximizeRound {
                x: 72
                y: 28
                width: 15
                height: 15
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.verticalCenterOffset: 0
                onClicked: internal.maximizeRestore()
            }
        }
    }

    MouseArea {
        id: leftDrag
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.leftMargin: 0

        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {mainWindow.startSystemResize(Qt.LeftEdge)}
        }
    }

    MouseArea {
        id: rightDrag
        x: 0
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.rightMargin: 0

        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {mainWindow.startSystemResize(Qt.RightEdge)}
        }
    }

    MouseArea {
        id: topDrag
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.topMargin: 0

        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {mainWindow.startSystemResize(Qt.TopEdge)}
        }
    }

    MouseArea {
        id: bottomDrag
        y: 78
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.rightMargin: 10
        anchors.leftMargin: 10

        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {mainWindow.startSystemResize(Qt.BottomEdge)}
        }
    }

    MouseArea {
        id: leftTopDrag
        width: 10
        height: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 0

        cursorShape: Qt.SizeFDiagCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {mainWindow.startSystemResize(Qt.LeftEdge | Qt.TopEdge)}
        }
    }

    MouseArea {
        id: leftBottomDrag
        y: 24
        width: 10
        height: 10
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.leftMargin: 0

        cursorShape: Qt.SizeBDiagCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {mainWindow.startSystemResize(Qt.LeftEdge | Qt.BottomEdge)}
        }
    }

    MouseArea {
        id: rightTopDrag
        x: 1
        width: 10
        height: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0

        cursorShape: Qt.SizeBDiagCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {mainWindow.startSystemResize(Qt.RightEdge | Qt.TopEdge)}
        }
    }

    MouseArea {
        id: rightBottomDrag
        x: 0
        y: 41
        width: 10
        height: 10
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.rightMargin: 0

        cursorShape: Qt.SizeFDiagCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)}
        }
    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
