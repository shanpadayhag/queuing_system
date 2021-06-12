import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import 'controls'

Window {
    id: window
    width: 788
    height: 500
    visible: true
    color: "#00000000"

    flags: Qt.Window | Qt.FramelessWindowHint

    function logInChecker(sID, passcode){
        if (login.chooseSoT(sID, passcode) === 'succeed') {
            window.close()
        } /*else {
            if (login.chooseSoT(sID, passcode) === '10') {
                schoolIDText.color = '#E81123'
                passwordText.color = '#FFFFFF'
            }
            else if (login.chooseSoT(sID, passcode) === '01') {
                schoolIDText.color = '#FFFFFF'
                passwordText.color = '#E81123'
            }
            else if (login.chooseSoT(sID, passcode) === '11') {
                schoolIDText.color = '#E81123'
                passwordText.color = '#E81123'
            }
        }*/
    }

    function enrollmentQueue() {
        var component = Qt.createComponent("queueNumber.qml")
        var win = component.createObject()
        win.show()
        visible = true
    }

    function createAccountQMLFunction() {
        var component = Qt.createComponent("createAccount.qml")
        var win = component.createObject()
        win.show()
        visible = true
    }

    Rectangle {
        id: rectangle
        color: "#13141f"
        radius: 10
        anchors.fill: parent
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        Rectangle {
            id: rectangl
            color: "#00000000"
            radius: 10
            anchors.left: parent.left
            anchors.right: rectangle2.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Image {
                id: image
                width: 256
                height: 256
                anchors.verticalCenter: parent.verticalCenter
                source: "../imgs/ComStud_Logo.png"
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: rectangle1
            color: "#00000000"
            anchors.left: rectangle2.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            CustomTextField {
                id: schoolIDText
                anchors.top: label1.bottom
                anchors.topMargin: 40
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "School ID"
                font.pointSize: 12
                onAccepted: {
                    logInChecker(schoolIDText.text, passwordText.text)
                }
            }

            CustomTextField {
                id: passwordText
                anchors.top: schoolIDText.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "Password"
                font.pointSize: 12
                echoMode: TextInput.Password
                onAccepted: {
                    logInChecker(schoolIDText.text, passwordText.text)
                }
            }

            CustomButton {
                id: logInBtn
                width: 175
                height: 40
                text: "Log In"
                anchors.top: passwordText.bottom
                anchors.topMargin: 40
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
                onClicked: {
                    logInChecker(schoolIDText.text, passwordText.text)
                }
            }

            Label {
                id: label
                color: "#ffffff"
                text: qsTr("Sign in to Queuing System")
                anchors.top: parent.top
                anchors.topMargin: 49
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 16
            }

            Label {
                id: label1
                color: "#ffffff"
                text: qsTr("School ID and Password")
                anchors.top: label.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }

            CustomButton {
                id: queueBtn
                x: 206
                width: 175
                height: 40
                text: "Queue Number"
                anchors.top: logInBtn.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 10
                onClicked: {
                    enrollmentQueue()
                }
            }

            CustomButton {
                id: createAccBtn
                width: 123
                height: 23
                text: "Create an Account"
                anchors.left: label2.right
                anchors.top: queueBtn.bottom
                font.underline: true
                anchors.leftMargin: 0
                anchors.topMargin: 16
                font.pointSize: 10
                colorPressed: "#00000000"
                colorMouseOver: "#00000000"
                colorDefault: "#00000000"
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        createAccountQMLFunction()
                    }
                }
            }

            Label {
                id: label2
                x: 77
                color: "#ffffff"
                text: qsTr("Don't have an account?")
                anchors.top: queueBtn.bottom
                anchors.topMargin: 20
                font.pointSize: 10
            }
        }

        Rectangle {
            id: rectangle2
            x: 339
            width: 2
            color: "#616269"
            radius: 1
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 55
            anchors.topMargin: 55
        }

        CustomButton {
            id: customButton
            x: 672
            width: 30
            height: 30
            text: "X"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 5
            font.pointSize: 12
            colorDefault: "#00000000"
            anchors.rightMargin: 5
            colorPressed: "#ee5763"
            font.bold: true
            colorMouseOver: "#e81123"
            onClicked: window.close()
        }
    }

    DropShadow {
        id: dropShadow
        anchors.fill: rectangle
        source: rectangle
        verticalOffset: 0
        horizontalOffset: 0
        radius: 10
        color: "#000000"
        z: 0
    }

    Connections {
        target: login
    }
}





/*##^##
Designer {
    D{i:0}D{i:16;invisible:true}
}
##^##*/
