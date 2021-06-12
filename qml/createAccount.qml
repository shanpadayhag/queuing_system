import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "controls"

Window {
    id: window
    width: 788
    height: 500
    visible: true
    color: "#00000000"

    flags: Qt.Window | Qt.FramelessWindowHint

    function saveToDatabaseFromQMLFunction(name, sID, passcode) {
        if (confirmPasswordTextField.text === passwordTextField.text) {
            CreateAccount.saveToDatabaseFromPythonStudent(name, sID, passcode, 'studentinfo', 'student')
        }
    }

    Rectangle {
        id: rectangle
        color: "#13141f"
        anchors.fill: parent


        Label {
            id: nameLabel
            x: 127
            y: 86
            color: "#ffffff"
            text: qsTr("Full Name:")
            font.pointSize: 12
        }

        Label {
            id: schoolIDLabel
            x: 123
            y: 168
            color: "#ffffff"
            text: qsTr("School ID: ")
            font.pointSize: 12
        }

        Label {
            id: passwordLabel
            x: 125
            y: 250
            color: "#ffffff"
            text: qsTr("Password: ")
            font.pointSize: 12
        }

        Label {
            id: confirmPasswordLabel
            x: 64
            y: 332
            color: "#ffffff"
            text: qsTr("Confirm Password: ")
            font.pointSize: 12
        }

        CustomTextField {
            id: nameTextField
            y: 117
            width: 437
            height: 40
            anchors.verticalCenter: nameLabel.verticalCenter
            anchors.left: nameLabel.right
            placeholderText: "Enter full name of the student"
            anchors.leftMargin: 30
            font.pointSize: 12
        }

        CustomTextField {
            id: schoolIDTextField
            y: 222
            width: 437
            height: 40
            anchors.verticalCenter: schoolIDLabel.verticalCenter
            anchors.left: schoolIDLabel.right
            placeholderText: "Enter student's school ID"
            anchors.leftMargin: 30
            font.pointSize: 12
        }

        CustomTextField {
            id: passwordTextField
            y: 297
            width: 437
            height: 40
            anchors.verticalCenter: passwordLabel.verticalCenter
            anchors.left: passwordLabel.right
            placeholderText: "Enter account password"
            anchors.leftMargin: 30
            font.pointSize: 12
        }




        CustomTextField {
            id: confirmPasswordTextField
            y: 300
            width: 437
            height: 40
            anchors.verticalCenter: confirmPasswordLabel.verticalCenter
            anchors.left: confirmPasswordLabel.right
            placeholderText: "Confirm the password"
            anchors.verticalCenterOffset: 0
            anchors.leftMargin: 30
            font.pointSize: 12
        }

        CustomButton {
            id: confirmBtn
            x: 418
            width: 175
            height: 40
            text: "Create"
            anchors.top: confirmPasswordTextField.bottom
            anchors.horizontalCenterOffset: 100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 70
            font.bold: true
            font.pointSize: 12
            onClicked: {
                saveToDatabaseFromQMLFunction(nameTextField.text, schoolIDTextField.text, passwordTextField.text)
            }
        }

        CustomButton {
            id: cancelBtn
            x: 185
            width: 175
            height: 40
            text: "Cancel"
            anchors.top: confirmPasswordTextField.bottom
            anchors.horizontalCenterOffset: -100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 70
            font.bold: true
            font.pointSize: 12
            onClicked: window.close()
        }
    }
    Connections {
        target: CreateAccount
    }
}
