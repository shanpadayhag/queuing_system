import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import "components"

Item {
    id: item1
    clip: true

    function chooseProgram() {
        if (editProgramText.text === "Computer Science") {
            editProgramText.text = "Entertainment and Multimedia Computing"
        } else if (editProgramText.text === "Entertainment and Multimedia Computing") {
            editProgramText.text = "Information System"
        } else if (editProgramText.text === "Information System") {
            editProgramText.text = "Information Technology"
        } else if ( editProgramText.text === "Information Technology") {
             editProgramText.text = "Computer Science"
        }  else {
            editProgramText.text = "Entertainment and Multimedia Computing"
        }
    }

    function showPassword() {
        if (editPasswordText.echoMode == TextInput.Password) {
            editPasswordText.font.letterSpacing = 1
            editPasswordText.echoMode = TextInput.Normal
            svgBtn.svgSource = "../../../../img/icon/eyeOn.svg"
        } else {
            editPasswordText.font.letterSpacing = 0
            editPasswordText.echoMode = TextInput.Password
            svgBtn.svgSource = "../../../../img/icon/eyeOff.svg"
        }
    }

    function success_pop_up(message) {
        var component = Qt.createComponent("../../popup/successful.qml")
        var win = component.createObject()
        win.message = message
        win.show()
    }

    function error_pop_up(message) {
        var component = Qt.createComponent("../../popup/error.qml")
        var win = component.createObject()
        win.message = message
        win.show()
    }
    
    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: .3
    }

    Rectangle {
        id: rectangle
        visible: true
        color: "#00000000"
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20

            Rectangle {
                id: rectangle2
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 10

                Label {
                    id: label
                    x: 77
                    y: 19
                    color: "#ffffff"
                    text: qsTr("Account Details")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 13
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle3
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle2.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5

                Label {
                    id: label1
                    x: 22
                    color: "#ffffff"
                    text: qsTr("Name:")
                    anchors.right: label2.right
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    font.pixelSize: 13
                }
                
                Label {
                    id: accountName
                    text: "Name"
                    anchors.verticalCenter: label1.verticalCenter
                    anchors.left: label1.right
                    anchors.leftMargin: 10
                    color: "white"
                    font.pixelSize: 13

                    Component.onCompleted: accountName.text = StudentDetails.getName()
                }

                Label {
                    id: label2
                    x: 31
                    color: "#ffffff"
                    text: qsTr("School ID:")
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: label1.bottom
                    anchors.topMargin: 20
                    font.pixelSize: 13
                }
                
                Label {
                    id: accountID
                    text: "School ID"
                    anchors.verticalCenter: label2.verticalCenter
                    anchors.left: label2.right
                    anchors.leftMargin: 10
                    color: "white"
                    font.pixelSize: 13

                    Component.onCompleted: accountID.text = StudentDetails.getID()
                }

                Image {
                    id: image
                    x: 565
                    width: 150
                    height: 150
                    anchors.right: parent.right
                    anchors.top: parent.top
                    source: "../../../../img/favicon.png"
                    anchors.rightMargin: 20
                    anchors.topMargin: 20
                    fillMode: Image.PreserveAspectFit
                }

                CustomButton {
                    id: editProfileBtn
                    x: 651
                    width: 150
                    height: 30
                    text: "Edit Profile"
                    anchors.top: image.bottom
                    font.bold: true
                    font.pixelSize: 13
                    anchors.horizontalCenter: image.horizontalCenter
                    anchors.topMargin: 20
                    onClicked: addAnimationMenu.running = true
                }
            }
        }
    }

    Rectangle {
        id: rectangle6
        width: 10
        height: 460
        visible: true
        color: "#58697e"
        radius: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        clip: true
        anchors.rightMargin: -10

        PropertyAnimation {
            id: addAnimationMenu
            target: rectangle6
            property: "width"
            to: if (rectangle6.width === 10) return 370; else return 10
            duration: 1000
            easing.type: Easing.OutQuint
        }

        Rectangle {
            id: rectangle7
            height: 40
            color: "#111d2b"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            clip: true
            anchors.rightMargin: 20
            anchors.leftMargin: 77
            anchors.topMargin: 10

            Label {
                id: label4
                x: 214
                y: 14
                color: "#ffffff"
                text: qsTr("Edit Profile")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 13
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle8
            color: "#111d2b"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle7.bottom
            anchors.bottom: parent.bottom
            clip: true
            anchors.rightMargin: 20
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 5

            CustomButton {
                id: selectImageBtn
                x: 48
                y: 53
                width: 150
                height: 30
                text: "Select Image"
                anchors.verticalCenter: image1.verticalCenter
                anchors.right: image1.left
                font.bold: true
                font.pixelSize: 13
                anchors.rightMargin: 20
                onClicked: fileDialog.open()
            }

            CustomTextField {
                id: editNameText
                anchors.left: parent.left
                anchors.top: image1.bottom
                anchors.leftMargin: 20
                placeholderText: "Full name"
                text: accountName.text
                font.pixelSize: 13
                anchors.topMargin: 25
            }

            CustomTextField {
                id: editIDText
                anchors.left: parent.left
                anchors.top: editNameText.bottom
                anchors.leftMargin: 20
                placeholderText: "School ID"
                text: accountID.text
                font.pixelSize: 13
                anchors.topMargin: 10
            }

            CustomTextField {
                id: editProgramText
                anchors.left: parent.left
                anchors.top: editIDText.bottom
                anchors.leftMargin: 20
                placeholderText: "Program"
                text: accountID.text
                font.pixelSize: 13
                anchors.topMargin: 10
                readOnly: true
            }
            
            CustomTextField {
                id: editPasswordText
                anchors.left: parent.left
                anchors.top: editProgramText.bottom
                anchors.leftMargin: 20
                anchors.topMargin: 10
                placeholderText: "Password"
                font.pixelSize: 13
                echoMode: TextInput.Password

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
                        svgSource: "../../../../img/icon/eyeOff.svg"
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
            
            Image {
                id: image1
                x: 267
                width: 100
                height: 100
                anchors.right: parent.right
                anchors.top: parent.top
                source: "../../../../img/favicon.png"
                anchors.rightMargin: 30
                anchors.topMargin: 20
                fillMode: Image.PreserveAspectFit
            }

            CustomButton {
                id: customButton2
                width: 150
                height: 30
                text: "Confirm Changes"
                anchors.left: parent.left
                anchors.top: editPasswordText.bottom
                anchors.leftMargin: 95
                font.bold: true
                font.pixelSize: 13
                anchors.topMargin: 20
                onClicked: {
                    if (StudentDetails.confirm_changes(editNameText.text, editIDText.text, editPasswordText.text, image1.source, editProgramText.text)) {
                        addAnimationMenu.running = true
                        StudentDetails.getCurrentAccount()
                        accountName.text = StudentDetails.getName()
                        accountID.text = StudentDetails.getID()
                        image.source = image1.source
                        success_pop_up("Changes are confirmed")
                    } else {
                        editIDText.color = "#EF534F"
                        error_pop_up("School ID is already taken")
                    }
                }
            }
            
        }

        Label {
            id: label5
            x: 18
            y: 22
            color: "#ffffff"
            text: qsTr("Return")
            anchors.verticalCenter: rectangle7.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            font.bold: true
            font.pixelSize: 13

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: addAnimationMenu.running = true
            }
        }
    }

    FileDialog {
        id: fileDialog
        title: "Choose your image"
        folder: "../../../../test Photos"
        nameFilters: [ "Image files (*.png *.jpg *.svg)", "All files (*)" ]
        selectedNameFilter: "Image files (*.png *.jpg *.svg)"
        onAccepted: {
            image1.source = fileUrl
        }
    }

    Shortcut {
        sequence: "Ctrl+P"
        onActivated: chooseProgram()
    }

    Shortcut {
        sequence: "Ctrl+S"
        onActivated: showPassword()
    }

    Component.onCompleted: {
        StudentDetails.getCurrentAccount()
        editPasswordText.text = StudentDetails.getPass()
        editProgramText.text = StudentDetails.getProgram()
        image.source = StudentDetails.getImg()
        image1.source = StudentDetails.getImg()
    }

    Connections {
        target: StudentDetails
    }
}
