import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import 'controls'

Window {
    id: window
    width: 788
    height: 453
    visible: true
    color: "#00000000"

    flags: Qt.splashScreen | Qt.FramelessWindowHint

    function logInChecker(sID, passcode){
        if (login.chooseSoT(sID, passcode) === '1') {
            window.close()
        }
    }

    function enrollmentQueue() {
        var component = Qt.createComponent("queueNumber.qml")
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
                anchors.bottom: passwordText.top
                anchors.bottomMargin: 20
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "School ID"
                font.pointSize: 12
            }

            CustomTextField {
                id: passwordText
                anchors.bottom: logInBtn.top
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "Password"
                font.pointSize: 12
                echoMode: TextInput.Password
            }

            CustomButton {
                id: logInBtn
                width: 175
                height: 40
                text: "Log In"
                anchors.bottom: queueBtn.top
                font.bold: true
                anchors.bottomMargin: 20
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
                anchors.bottom: label1.top
                anchors.bottomMargin: 20
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 16
            }

            Label {
                id: label1
                color: "#ffffff"
                text: qsTr("School ID and Password")
                anchors.bottom: schoolIDText.top
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }

            CustomButton {
                id: queueBtn
                x: 206
                y: 390
                width: 175
                height: 40
                text: "Queue Number"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
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


