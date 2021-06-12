import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1
import "components"
import "../"

Window {
    id: window
    width: 462
    height: 600 //698
    visible: true
    color: "transparent"

    flags: Qt.Window | Qt.FramelessWindowHint

    property int textFieldChoice: 0

    function showPassword() {
        if (passwordText.echoMode == TextInput.Password) {
            passwordText.font.letterSpacing = 1
            passwordText.echoMode = TextInput.Normal
            confirmPasswordText.font.letterSpacing = 1
            confirmPasswordText.echoMode = TextInput.Normal
            svgBtn.svgSource = "../../../img/icon/eyeOn.svg"
        } else {
            passwordText.font.letterSpacing = 0
            passwordText.echoMode = TextInput.Password
            confirmPasswordText.font.letterSpacing = 0
            confirmPasswordText.echoMode = TextInput.Password
            svgBtn.svgSource = "../../../img/icon/eyeOff.svg"
            svgBtn.overlayColor = "#4891d9"
        }
    }
    
    function create_account() {
        if (
            passwordText.text === "" || 
            nameText.text === "" || 
            idText.text === "" ||
            idText.text === "Enter your id" || 
            /\d/.test(nameText.text)
            ) {
            if (nameText.text === "") {
                nameText.text = "Enter your name"
                nameText.color = "#EF534F"
            }
            if (idText.text === "Enter your id") {
                idText.text = "Please enter an integer"
                idText.color = "#EF534F"
            }
            if (idText.text === "") {
                idText.text = "Enter your id"
                idText.color = "#EF534F"
            }
            if (passwordText.text === "") {
                showPassword()
                passwordText.text = "Enter your password"
                passwordText.color = "#EF534F"
            }
            if (/\d/.test(nameText.text)) {
                nameText.text = "There are no numbers in your name desu?"
                nameText.color = "#EF534F"
            }
        } else {
            if (passwordText.text === confirmPasswordText.text) {
                if (CreateAccount.saveToDB_v2(nameText.text, idText.text, passwordText.text)) {
                    Login.pop_up("Account created successfully!")
                    window.destroy()
                } else {
                    pop_up_error("School ID already exists")
                    idText.color = "#EF534F"
                }
            } else {
                passwordText.color = "#EF534F"
                confirmPasswordText.color = "#EF534F"
            }
        }
    }
    
    function pop_up_error(message) {
        var component = Qt.createComponent("../popup/error.qml")
        var win = component.createObject()
        win.message = message
        win.show()
    }

    Rectangle {
        anchors.fill: parent
        color: "#0B131C"

        Image {
            anchors.fill: parent
            source: "../../../img/background/createAccountBG.svg"
        }

        Label {
            id: label
            anchors.top: parent.top
            anchors.topMargin: 55
            anchors.left: parent.left
            anchors.leftMargin: 55
            text: "Sign up"
            color: "#FFFFFF"
            font.pointSize: 24
        }

        Label {
            id: label1
            anchors.top: label.bottom
            anchors.topMargin: 10
            anchors.left: label.left
            text: "It's quick and easy"
            color: "#FFFFFF"
            font.pixelSize: 13
        }

        Rectangle {
            id: rectangle
            anchors.left: parent.left
            anchors.leftMargin: 45
            anchors.right: parent.right
            anchors.rightMargin: 45
            anchors.top: label1.bottom
            anchors.topMargin: 35
            color: "#6C7B8D"
            height: 2
            radius: 1
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
                qmlConnections.openWindow("login")
                window.destroy()
            }
        }

        Rectangle {
            anchors.top: rectangle.bottom
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            color: "transparent"

            CustomTextField {
                id: nameText
                width: 355
                anchors.top: parent.top
                anchors.topMargin: 35
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "Full Name"
                font.pixelSize: 13
                onAccepted: create_account()
                onPressed: {
                    textFieldChoice = 0
                    nameText.color = "#FFFFFF"
                    idText.color = "#FFFFFF"
                    passwordText.color = "#FFFFFF"
                    confirmPasswordText.color = "#FFFFFF"
                }
                onActiveFocusChanged: {
                    nameText.color = "#FFFFFF"
                    idText.color = "#FFFFFF"
                    passwordText.color = "#FFFFFF"
                    confirmPasswordText.color = "#FFFFFF"
                }

                Component.onCompleted: nameText.forceActiveFocus()
            }
            
            CustomTextField {
                id: idText
                width: 355
                anchors.top: nameText.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "School ID"
                font.pixelSize: 13
                validator: RegExpValidator{regExp: /[0-9]+/}
                onPressed: {
                    textFieldChoice = 1
                    nameText.color = "#FFFFFF"
                    idText.color = "#FFFFFF"
                    passwordText.color = "#FFFFFF"
                    confirmPasswordText.color = "#FFFFFF"
                }
                onActiveFocusChanged: {
                    nameText.color = "#FFFFFF"
                    idText.color = "#FFFFFF"
                    passwordText.color = "#FFFFFF"
                    confirmPasswordText.color = "#FFFFFF"
                }
            }
            
            CustomTextField {
                id: passwordText
                width: 355
                anchors.top: idText.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "Password"
                font.pixelSize: 13
                echoMode: TextInput.Password
                onPressed: {
                    textFieldChoice = 2
                    nameText.color = "#FFFFFF"
                    idText.color = "#FFFFFF"
                    passwordText.color = "#FFFFFF"
                    confirmPasswordText.color = "#FFFFFF"
                }
                onActiveFocusChanged: {
                    nameText.color = "#FFFFFF"
                    idText.color = "#FFFFFF"
                    passwordText.color = "#FFFFFF"
                    confirmPasswordText.color = "#FFFFFF"
                }
                onAccepted: create_account()

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
            
            CustomTextField {
                id: confirmPasswordText
                width: 355
                anchors.top: passwordText.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "Confirm Password"
                font.pixelSize: 13
                echoMode: TextInput.Password
                onPressed: {
                    textFieldChoice = 3
                    nameText.color = "#FFFFFF"
                    idText.color = "#FFFFFF"
                    passwordText.color = "#FFFFFF"
                    confirmPasswordText.color = "#FFFFFF"
                }
                onActiveFocusChanged: {
                    nameText.color = "#FFFFFF"
                    idText.color = "#FFFFFF"
                    passwordText.color = "#FFFFFF"
                    confirmPasswordText.color = "#FFFFFF"
                }
                onAccepted: create_account()
            }

            CustomButton {
                id: createAccountBtn
                height: 40
                width: 150
                anchors.top: confirmPasswordText.bottom
                anchors.topMargin: 40
                anchors.horizontalCenter: confirmPasswordText.horizontalCenter
                text: "Create Account"
                font.pixelSize: 13
                font.bold: true
                onClicked: create_account()
            }
        }
    }

    Shortcut {
        sequence: "Ctrl+S"
        onActivated: showPassword()
    }

    Shortcut {
        sequence: "Escape"
        onActivated: {
            qmlConnections.openWindow("login")
            window.destroy()
        }
    }

    Shortcut {
        sequence: "Ctrl+Shift+C"
        onActivated: create_account()
    }

    Shortcut {
        sequence: "Tab"
        onActivated: {
            if (textFieldChoice === 0) {
                idText.forceActiveFocus()
                idText.selectAll()
                textFieldChoice = 1
            } else if (textFieldChoice === 1) {
                passwordText.forceActiveFocus()
                passwordText.selectAll()
                textFieldChoice = 2
            } else if (textFieldChoice === 2) {
                confirmPasswordText.forceActiveFocus()
                confirmPasswordText.selectAll()
                textFieldChoice = 3
            } else {
                nameText.forceActiveFocus()
                nameText.selectAll()
                textFieldChoice = 0
            }
        }
    }

    QMLConnections {
        id: qmlConnections
    }

    Connections {
        target: CreateAccount
    }
}