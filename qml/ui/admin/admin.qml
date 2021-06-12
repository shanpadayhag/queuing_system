import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "components"
import "../"

Window {
    id: window
    width: 1076
    height: 624
    minimumWidth: 1076
    minimumHeight: 624
    visible: false
    color: "transparent"
    title: "CC15 Project"

    flags: Qt.Window | Qt.FramelessWindowHint

    property int windowStatus: 0

    function notActive() {
        homeBtn.isActiveMenu = false
        setAppointmentBtn.isActiveMenu = false
        requestAppointmentBtn.isActiveMenu = false
        applyServicesBtn.isActiveMenu = false
        specialServicesBtn.isActiveMenu = false
        roomReservationBtn.isActiveMenu = false
        studentAccountBtn.isActiveMenu = false
        instructorAccountBtn.isActiveMenu = false
        accountDetailsBtn.isActiveMenu = false
        logoutBtn.isActiveMenu = false
    }

    function onlineStatusCheck() {
        if (statusSwitch.checked == true) {
            statusSwitch.enabled = false
            timer.startTimer(function enableSwitch() {
                statusSwitch.enabled = true
            }, 1000)

            AdminMain.goOnline()
        } else {
            statusSwitch.enabled = false
            timer.startTimer(function enableSwitch() {
                statusSwitch.enabled = true
            }, 1000)

            AdminMain.goOffline()
        }
    }

    function maximize() {
        if (windowStatus === 0) {
            window.showMaximized()
            windowStatus = 1
            maximizeBtn.btnIconSource = "../../../img/icon/normal.svg"
        } else {
            window.showNormal()
            windowStatus = 0
            maximizeBtn.btnIconSource = "../../../img/icon/maximize.svg"
        }
    }

    function ifMaximize() {
        if (windowStatus === 1) {
            window.showNormal()
            windowStatus = 0
            maximizeBtn.btnIconSource = "../../../img/icon/maximize.svg"
        }
    }

    function ifMinimized() {
        if (windowStatus === 1) {
            windowStatus = 0
            maximizeBtn.btnIconSource = "../../../img/icon/maximize.svg"
        }
    }

    Timer {
        id: timer

        function startTimer(callback, milliseconds) {
            timer.interval = milliseconds;
            timer.repeat = false;
            timer.triggered.connect(callback);
            timer.start();
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#0B131C"

        Image {
            anchors.fill: parent
            source: "../../../img/background/uiBG.svg"
        }

        Rectangle {
            id: leftMenuRectangle
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: 262
            color: "#111D2B"

            Label {
                id: label
                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.top: parent.top
                anchors.topMargin: 90
                text: "Admin UI"
                color: "white"
                font.pointSize: 20
            }
            
            Rectangle {
                anchors.top: label.bottom
                anchors.topMargin: 20
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                color: "transparent"
                clip: true

                ScrollView {
                    anchors.fill: parent
                    contentHeight: content.height

                    Rectangle {
                        id: content
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                        color: "transparent"
                        height: (45*10) + 20

                        LeftMenuBtn {
                            id: homeBtn
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.topMargin: 10
                            height: 45
                            text: "Home"
                            btnIconSource: "../../../img/icon/home.svg"
                            font.pointSize: 12
                            btnColorDefault: "transparent"
                            btnColorClicked: "#58697e"
                            btnColorMouseOver: "#0b131c"
                            isActiveMenu: true
                            onClicked: {
                                stackView.pop(StackView.Immediate)
                                stackView.push(Qt.resolvedUrl("page/home.qml"), StackView.Immediate)
                                notActive()
                                isActiveMenu = true
                            }
                        }

                        LeftMenuBtn {
                            id: setAppointmentBtn
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: homeBtn.bottom
                            height: 45
                            text: "Set appointment"
                            btnIconSource: "../../../img/icon/calendar.svg"
                            font.pointSize: 12
                            btnColorDefault: "transparent"
                            btnColorClicked: "#58697e"
                            btnColorMouseOver: "#0b131c"
                            isActiveMenu: false
                            onClicked: {
                                stackView.pop(StackView.Immediate)
                                stackView.push(Qt.resolvedUrl("page/setAppointment.qml"), StackView.Immediate)
                                notActive()
                                isActiveMenu = true
                            }
                        }

                        LeftMenuBtn {
                            id: requestAppointmentBtn
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: setAppointmentBtn.bottom
                            height: 45
                            text: "Appointment requests"
                            btnIconSource: "../../../img/icon/userCheck.svg"
                            font.pointSize: 12
                            btnColorDefault: "transparent"
                            btnColorClicked: "#58697e"
                            btnColorMouseOver: "#0b131c"
                            isActiveMenu: false
                            onClicked: {
                                stackView.pop(StackView.Immediate)
                                stackView.push(Qt.resolvedUrl("page/requestAppointment.qml"), StackView.Immediate)
                                notActive()
                                isActiveMenu = true
                            }
                        }

                        LeftMenuBtn {
                            id: applyServicesBtn
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: requestAppointmentBtn.bottom
                            height: 45
                            text: "Apply for service"
                            btnIconSource: "../../../img/icon/applyService.svg"
                            font.pointSize: 12
                            btnColorDefault: "transparent"
                            btnColorClicked: "#58697e"
                            btnColorMouseOver: "#0b131c"
                            isActiveMenu: false
                            onClicked: {
                                stackView.pop(StackView.Immediate)
                                stackView.push(Qt.resolvedUrl("page/applyServices.qml"), StackView.Immediate)
                                notActive()
                                isActiveMenu = true
                            }
                        }

                        LeftMenuBtn {
                            id: specialServicesBtn
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: applyServicesBtn.bottom
                            height: 45
                            text: "Offer service"
                            btnIconSource: "../../../img/icon/users.svg"
                            font.pointSize: 12
                            btnColorDefault: "transparent"
                            btnColorClicked: "#58697e"
                            btnColorMouseOver: "#0b131c"
                            isActiveMenu: false
                            onClicked: {
                                stackView.pop(StackView.Immediate)
                                stackView.push(Qt.resolvedUrl("page/offerService.qml"), StackView.Immediate)
                                notActive()
                                isActiveMenu = true
                            }
                        }

                        LeftMenuBtn {
                            id: roomReservationBtn
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: specialServicesBtn.bottom
                            height: 45
                            text: "Room reservation"
                            btnIconSource: "../../../img/icon/reserve.svg"
                            font.pointSize: 12
                            btnColorDefault: "transparent"
                            btnColorClicked: "#58697e"
                            btnColorMouseOver: "#0b131c"
                            isActiveMenu: false
                            onClicked: {
                                stackView.pop(StackView.Immediate)
                                stackView.push(Qt.resolvedUrl("page/roomReserve.qml"), StackView.Immediate)
                                notActive()
                                isActiveMenu = true
                            }
                        }

                        LeftMenuBtn {
                            id: studentAccountBtn
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: roomReservationBtn.bottom
                            height: 45
                            text: "Student account"
                            btnIconSource: "../../../img/icon/user.svg"
                            font.pointSize: 12
                            btnColorDefault: "transparent"
                            btnColorClicked: "#58697e"
                            btnColorMouseOver: "#0b131c"
                            isActiveMenu: false
                            onClicked: {
                                stackView.pop(StackView.Immediate)
                                stackView.push(Qt.resolvedUrl("page/studentAccount.qml"), StackView.Immediate)
                                notActive()
                                isActiveMenu = true
                            }
                        }

                        LeftMenuBtn {
                            id: instructorAccountBtn
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: studentAccountBtn.bottom
                            height: 45
                            text: "Instructor account"
                            btnIconSource: "../../../img/icon/user.svg"
                            font.pointSize: 12
                            btnColorDefault: "transparent"
                            btnColorClicked: "#58697e"
                            btnColorMouseOver: "#0b131c"
                            isActiveMenu: false
                            onClicked: {
                                stackView.pop(StackView.Immediate)
                                stackView.push(Qt.resolvedUrl("page/instructorAccount.qml"), StackView.Immediate)
                                notActive()
                                isActiveMenu = true
                            }
                        }

                        LeftMenuBtn {
                            id: accountDetailsBtn
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: instructorAccountBtn.bottom
                            height: 45
                            text: "Account details"
                            btnIconSource: "../../../img/icon/tool.svg"
                            font.pointSize: 12
                            btnColorDefault: "transparent"
                            btnColorClicked: "#58697e"
                            btnColorMouseOver: "#0b131c"
                            isActiveMenu: false
                            onClicked: {
                                stackView.pop(StackView.Immediate)
                                stackView.push(Qt.resolvedUrl("page/accountDetail.qml"), StackView.Immediate)
                                notActive()
                                isActiveMenu = true
                            }
                        }

                        LeftMenuBtn {
                            id: logoutBtn
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: accountDetailsBtn.bottom
                            height: 45
                            text: "Log out"
                            btnIconSource: "../../../img/icon/logout.svg"
                            font.pointSize: 12
                            btnColorDefault: "transparent"
                            btnColorClicked: "#58697e"
                            btnColorMouseOver: "#0b131c"
                            isActiveMenu: false
                            onClicked: {
                                window.visible = false
                                stackView.pop(StackView.Immediate)
                                stackView.push(Qt.resolvedUrl("page/home.qml"), StackView.Immediate)
                                AdminMain.goOffline()
                                notActive()
                                homeBtn.isActiveMenu = true
                                AdminMain.logout()
                                qmlConnections.openWindow("login")
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: topBar
            anchors.top: parent.top
            anchors.left: leftMenuRectangle.right
            anchors.right: minimizeBtn.left
            color: "transparent"
            height: 35

            DragHandler {
                onActiveChanged: if (active) {
                                     window.startSystemMove()
                                     ifMaximize()
                                 }
            }
            
            MouseArea {
                anchors.fill: parent
                onDoubleClicked: maximize()
            }
        }

        Label {
            id: nameUser
            anchors.top: topBar.bottom
            anchors.topMargin: 10
            anchors.left: leftMenuRectangle.right
            anchors.leftMargin: 10
            text: "Name"
            color: "white"
            font.pointSize: 20
        }

        Switch {
            id: statusSwitch
            anchors.verticalCenter: nameUser.verticalCenter
            anchors.left: nameUser.right
            anchors.leftMargin: 10
            //checkedColor: "#27CA41" can't decide
            checked: true
            onClicked: onlineStatusCheck()

            MouseArea {
                anchors.fill: parent
                onPressed: mouse.accepted = false
                cursorShape: Qt.PointingHandCursor
            }
            Component.onCompleted: {
                AdminMain.goOnline()
            }
        }

        TopBarButton {
            id: closeBtn
            anchors.top: parent.top
            anchors.right: parent.right
            btnIconSource: "../../../img/icon/close.svg"
            btnColorDefault: "transparent"
            btnColorMouseOver: "#EF2938"
            btnColorClicked: "#E81123"
            onClicked: {
                AdminMain.goOffline()
                window.close()
            }
        }

        TopBarButton {
            id: maximizeBtn
            anchors.top: parent.top
            anchors.right: closeBtn.left
            btnIconSource: "../../../img/icon/maximize.svg"
            btnColorDefault: "transparent"
            btnColorMouseOver: "#58697E"
            btnColorClicked: "#233A55"
            onClicked: {
                maximize()
            }
        }

        TopBarButton {
            id: minimizeBtn
            anchors.top: parent.top
            anchors.right: maximizeBtn.left
            btnIconSource: "../../../img/icon/minimize.svg"
            btnColorDefault: "transparent"
            btnColorMouseOver: "#58697E"
            btnColorClicked: "#233A55"
            onClicked: {
                ifMinimized()
                window.showMinimized()
            }
        }

        Rectangle {
            anchors.left: leftMenuRectangle.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.topMargin: 110
            color: "transparent"
            clip: true

            StackView {
                id: stackView
                anchors.fill: parent
                initialItem: Qt.resolvedUrl("page/home.qml")
            }
        }
    }

    Component.onCompleted: AdminMain.getCurrentAccount()

    Shortcut {
        sequence: "Escape"
        onActivated: {
            window.visible = false
            AdminMain.goOffline()
            AdminMain.logout()
            stackView.pop(StackView.Immediate)
            stackView.push(Qt.resolvedUrl("page/home.qml"), StackView.Immediate)
            notActive()
            homeBtn.isActiveMenu = true
            qmlConnections.openWindow("login")
        }
    }

    Shortcut {
        sequence: "Ctrl+1"
        onActivated: {
            stackView.pop(StackView.Immediate)
            stackView.push(Qt.resolvedUrl("page/home.qml"), StackView.Immediate)
            notActive()
            homeBtn.isActiveMenu = true
        }
    }

    Shortcut {
        sequence: "Ctrl+2"
        onActivated: {
            stackView.pop(StackView.Immediate)
            stackView.push(Qt.resolvedUrl("page/setAppointment.qml"), StackView.Immediate)
            notActive()
            setAppointmentBtn.isActiveMenu = true
        }
    }

    Shortcut {
        sequence: "Ctrl+3"
        onActivated: {
            stackView.pop(StackView.Immediate)
            stackView.push(Qt.resolvedUrl("page/requestAppointment.qml"), StackView.Immediate)
            notActive()
            requestAppointmentBtn.isActiveMenu = true
        }
    }

    Shortcut {
        sequence: "Ctrl+4"
        onActivated: {
            stackView.pop(StackView.Immediate)
            stackView.push(Qt.resolvedUrl("page/applyServices.qml"), StackView.Immediate)
            notActive()
            applyServicesBtn.isActiveMenu = true
        }
    }

    Shortcut {
        sequence: "Ctrl+5"
        onActivated: {
            stackView.pop(StackView.Immediate)
            stackView.push(Qt.resolvedUrl("page/offerService.qml"), StackView.Immediate)
            notActive()
            specialServicesBtn.isActiveMenu = true
        }
    }

    Shortcut {
        sequence: "Ctrl+6"
        onActivated: {
            stackView.pop(StackView.Immediate)
            stackView.push(Qt.resolvedUrl("page/roomReserve.qml"), StackView.Immediate)
            notActive()
            roomReservationBtn.isActiveMenu = true
        }
    }

    Shortcut {
        sequence: "Ctrl+7"
        onActivated: {
            stackView.pop(StackView.Immediate)
            stackView.push(Qt.resolvedUrl("page/studentAccount.qml"), StackView.Immediate)
            notActive()
            studentAccountBtn.isActiveMenu = true
        }
    }

    Shortcut {
        sequence: "Ctrl+8"
        onActivated: {   
            stackView.pop(StackView.Immediate)
            stackView.push(Qt.resolvedUrl("page/instructorAccount.qml"), StackView.Immediate)
            notActive()
            instructorAccountBtn.isActiveMenu = true
        }
    }

    Shortcut {
        sequence: "Ctrl+9"
        onActivated: {
            stackView.pop(StackView.Immediate)
            stackView.push(Qt.resolvedUrl("page/accountDetail.qml"), StackView.Immediate)
            notActive()
            accountDetailsBtn.isActiveMenu = true
        }
    }

    QMLConnections {
        id: qmlConnections
    }

    Connections {
        target: AdminMain
        
        function onShowWindowSignal () {
            window.visible = true
            stackView.pop(StackView.Immediate)
            stackView.push(Qt.resolvedUrl("page/home.qml"), StackView.Immediate)
        }

        function onSetNameSignal(name) {
            nameUser.text = "Hi, " + name
        }
    }

    MouseArea {
        id: mouseArea
        height: 5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {window.startSystemResize(Qt.TopEdge)}
        }
    }

    MouseArea {
        id: mouseArea1
        width: 5
        height: 5
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {window.startSystemResize(Qt.LeftEdge)}
        }
    }

    MouseArea {
        id: mouseArea2
        width: 5
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {window.startSystemResize(Qt.RightEdge)}
        }
    }

    MouseArea {
        id: mouseArea3
        height: 5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {window.startSystemResize(Qt.BottomEdge)}
        }
    }
}