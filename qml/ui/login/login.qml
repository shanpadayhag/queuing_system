import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1
import "components"
import "../"

Window {
    id: window
    width: 750 //791 //744
    height: 425 // 454
    visible: false
    title: "Shan Pogi"
    color: "transparent"

    flags: Qt.Window | Qt.FramelessWindowHint

    property int fieldChosen: 0

    function resetColor() {
        idText.color = "#FFFFFF"
        passwordText.color = "#FFFFFF"
    }

    function closingWindow(id, pass) {
        var returnValue = Login.account(id, pass)

        if (returnValue === 0) {
            window.visible = false
            idText.text = ""
            passwordText.text = ""
            qmlConnections.setUIName()
        } else {
            if (returnValue === 2) {
                idText.color = "#FFFFFF"
                passwordText.color = "#EF534F"//"#EF2938" //"#E81123"
            } else if (returnValue === 3) {
                idText.color = "#EF534F"//"#E81123"
                passwordText.color = "#EF534F"//"#EF2938" //"#E81123"
            }
        }
    }

    function showPassword() {
        if (passwordText.echoMode == TextInput.Password) {
            passwordText.font.letterSpacing = 1
            passwordText.echoMode = TextInput.Normal
            svgBtn.svgSource = "../../../img/icon/eyeOn.svg"
        } else {
            passwordText.font.letterSpacing = 0
            passwordText.echoMode = TextInput.Password
            svgBtn.svgSource = "../../../img/icon/eyeOff.svg"
        }
    }

    function openCreate() {
        var component = Qt.createComponent("../createaccount/createaccount.qml")
        // var component = Qt.createComponent("../createaccount_v2/createaccount.qml")
        var win = component.createObject()
        win.show()
    }

    function openCreate_v2() {
        // var component = Qt.createComponent("../createaccount/createaccount.qml")
        var component = Qt.createComponent("../createaccount_v2/createaccount.qml")
        var win = component.createObject()
        win.show()
    }

    function openQueue() {
        var component = Qt.createComponent("../queuenumber/queuenumber.qml")
        var win = component.createObject()
        win.show()
    }

    function open_pop_up(message) {
        var component = Qt.createComponent("../popup/successful.qml")
        var win = component.createObject()
        win.message = message
        win.show()
    }

    Timer {
        id: timer

        function startTimer(callback, milliseconds) {
            timer.interval = milliseconds;
            timer.repeat = false;
            timer.triggered.connect(callback);
            timer.start();
        }

        function stopTimer(callback) {
            timer.stop();
            timer.triggered.disconnect(callback);
        }
    }

    Rectangle {
        id: rectangle2
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        clip: true

        Image {
            anchors.fill: parent
            source: "../../../img/background/loginBG1.svg"
            
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
                window.close()
            }
        }

        Image {
            width: 250
            height: 250
            source: "../../../img/logo/ComStud_Logo.png"
            anchors.left: parent.left
            anchors.leftMargin: 60
            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle {
            id: rectangle
            color: "#00000000"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            width: 400
            height: 314

            Label {
                id: label
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Sign in to Queuing Sytem")
                color: "#FFFFFF"
                font.pointSize: 14
                font.bold: true
            }

            Label {
                id: label1
                anchors.top: label.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("School ID and Password")
                font.pixelSize: 13
                color: "#FFFFFF"
            }

            CustomTextField {
                id: idText
                anchors.top: label1.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "School ID"
                font.pixelSize: 13
                validator: RegExpValidator{regExp: /[0-9]+/}
                onPressed: idText.color = "white", passwordText.color = "white", fieldChosen = 0
                onTextChanged: idText.color = "white", passwordText.color = "white"

                Component.onCompleted: idText.forceActiveFocus()
            }

            CustomTextField {
                id: passwordText
                anchors.top: idText.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "Password"
                font.pixelSize: 13
                echoMode: TextInput.Password
                onAccepted: closingWindow(idText.text, passwordText.text)
                onPressed: idText.color = "white", passwordText.color = "white", fieldChosen = 1
                onTextChanged: idText.color = "white", passwordText.color = "white"

                Rectangle {
                    width: 15
                    height: 15
                    color: "transparent"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 7

                    CustomSVG {
                        id: svgBtn
                        anchors.fill: parent
                        svgSource: "../../../img/icon/eyeOff.svg"
                        overlayColor: "lightgray"

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true
                            onEntered: svgBtn.overlayColor = "#4891d9"
                            onExited: svgBtn.overlayColor = "lightgray"
                            onClicked: showPassword()
                        }
                    }
                }
            }

            CustomButton {
                id: loginBtn
                text: "LOGIN"
                font.pixelSize: 13
                height: 30
                width: 150
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: passwordText.bottom
                anchors.topMargin: 20
                font.bold: true
                onClicked: {
                    closingWindow(idText.text, passwordText.text)
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed:  mouse.accepted = false
                    cursorShape: Qt.PointingHandCursor
                }
            }

            Rectangle {
                id: rectangle1
                width: 240
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: loginBtn.bottom
                anchors.topMargin: 20
                color: "transparent"
                
                Label {
                    id: label2
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    text: qsTr("Don't have an account?")
                    font.pixelSize: 13
                    color: "#FFFFFF"
                }

                Label {
                    id: createAccountBtn
                    anchors.left: label2.right
                    anchors.leftMargin: 10
                    text: qsTr("Create an account")
                    font.pixelSize: 13
                    color: "#FFFFFF"

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            createAccountBtn.font.underline = true
                            createAccountBtn.font.bold = true
                        }
                        onExited: {
                            createAccountBtn.font.underline = false
                            createAccountBtn.font.bold = false
                        }
                        onClicked: {
                            openCreate()
                            window.visible = false
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle3
                x: 69
                width: 288
                color: "#00000000"
                anchors.top: rectangle1.bottom
                anchors.topMargin: 25
                anchors.horizontalCenter: parent.horizontalCenter

                Label {
                    id: label3
                    color: "#ffffff"
                    text: qsTr("Need a queue number for enrollment?")
                    anchors.left: parent.left
                    font.pixelSize: 13
                    anchors.leftMargin: 0
                }

                Label {
                    id: queueNumberBtn
                    color: "#ffffff"
                    text: qsTr("Click here")
                    anchors.left: label3.right
                    font.pixelSize: 13
                    anchors.leftMargin: 10

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            queueNumberBtn.font.underline = true
                            queueNumberBtn.font.bold = true
                        }
                        onExited: {
                            queueNumberBtn.font.underline = false
                            queueNumberBtn.font.bold = false
                        }
                        onClicked: {
                            openQueue()
                            window.visible = false
                        }
                    }
                }
            }
        }
    }

    Shortcut {
        sequence: "Ctrl+S"
        onActivated: showPassword()
    }

    Shortcut {
        sequence: "Tab"
        onActivated: {
            if (fieldChosen === 0) {
                passwordText.forceActiveFocus()
                passwordText.selectAll()
                fieldChosen = 1
            } else {
                idText.forceActiveFocus()
                idText.selectAll()
                fieldChosen = 0
            }
        }
    }

    Shortcut {
        sequence: "Escape"
        onActivated: window.close()
    }

    Shortcut {
        sequence: "Alt+/"
        onActivated: closingWindow(idText.text, passwordText.text)
    }

    Shortcut {
        sequence: "Ctrl+Shift+C"
        onActivated: {
            openCreate()
            window.visible = false
        }
    }

    Shortcut {
        sequence: "Alt+."
        onActivated: {
            openCreate_v2()
            window.visible = false
        }
    }

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: {
            openQueue()
            window.visible = false
        }
    }

    QMLConnections {
        id: qmlConnections
    }

    Connections {
        target: Login

        function onShowWindowSignal () {
            window.visible = true
        }

        function on_pop_up_signal (message) {
            timer.startTimer(onShowWindowSignal, 3500)
            open_pop_up(message)
        }
        
        function onAccountSignal(accountType) {
            qmlConnections.openWindow(accountType)
        }
    }
}
