import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import "components"

Item {
    id: item1
    clip: true

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
                    anchors.right: label3.right
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.rightMargin: 0
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

                    Component.onCompleted: accountName.text = AdminAccountDetails.getName()
                }

                Label {
                    id: label2
                    x: 31
                    color: "#ffffff"
                    text: qsTr("School ID:")
                    anchors.right: label3.right
                    anchors.top: label1.bottom
                    anchors.rightMargin: 0
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

                    Component.onCompleted: accountID.text = AdminAccountDetails.getID()
                }

                Label {
                    id: label3
                    color: "#ffffff"
                    text: qsTr("Courses Handled:")
                    anchors.left: parent.left
                    anchors.top: label2.bottom
                    anchors.topMargin: 20
                    anchors.leftMargin: 20
                    font.pixelSize: 13
                }

                Rectangle {
                    id: rectangle4
                    width: 168
                    color: "#00000000"
                    radius: 10
                    border.color: "#ffffff"
                    anchors.left: label3.right
                    anchors.top: label3.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.leftMargin: 10
                    anchors.topMargin: 0
                    
                    ScrollView {
                        id: scrollViewFinal
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 10
                        clip: true

                        ListModel {
                            id: courseListModelFinal
                        }

                        Component {
                            id: courseDelegateFinal
                            
                            Item {
                                width: courseListViewFinal.width
                                height: 25

                                Label {
                                    id: courseCode
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    height: 25
                                    color: "white"
                                    text: code
                                    font.pixelSize: 13
                                }
                            }
                        }

                        ListView {
                            id: courseListViewFinal
                            anchors.fill: parent

                            model: courseListModelFinal
                            delegate: courseDelegateFinal

                            Component.onCompleted: AdminAccountDetails.displayCoursesFinal()
                        }
                    }
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
        x: 454
        y: 52
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
                id: editPasswordText
                anchors.left: parent.left
                anchors.top: editIDText.bottom
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
                id: courseHandledBtn
                width: 150
                height: 30
                text: "Courses Handled"
                anchors.left: parent.left
                anchors.top: editPasswordText.bottom
                anchors.leftMargin: 95
                anchors.topMargin: 20
                font.bold: true
                font.pixelSize: 13
                onClicked: {
                    addAnimationMenu.running = true
                    addAnimationMenu1.running = true
                }
            }

            CustomButton {
                id: customButton2
                width: 150
                height: 30
                text: "Confirm Changes"
                anchors.left: parent.left
                anchors.top: courseHandledBtn.bottom
                anchors.leftMargin: 95
                font.bold: true
                font.pixelSize: 13
                anchors.topMargin: 10
                onClicked: {
                    AdminAccountDetails.confirm_changes(editNameText.text, editIDText.text, editPasswordText.text, image1.source)
                    courseListModelFinal.clear()
                    AdminAccountDetails.displayCoursesFinal()
                    addAnimationMenu.running = true
                    AdminAccountDetails.getCurrentAccount()
                    accountName.text = AdminAccountDetails.getName()
                    accountID.text = AdminAccountDetails.getID()
                    image.source = image1.source
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

    Rectangle {
        id: rectangle5
        x: 317
        width: 10
        height: 400
        visible: true
        color: "#58697e"
        radius: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        clip: true
        anchors.rightMargin: -10

        PropertyAnimation {
            id: addAnimationMenu1
            target: rectangle5
            property: "width"
            to: if (rectangle5.width === 10) return 510; else return 10
            duration: 1000
            easing.type: Easing.OutQuint
        }

        Label {
            id: label7
            color: "#ffffff"
            text: qsTr("Return")
            anchors.left: parent.left
            anchors.top: parent.top
            font.bold: true
            font.pixelSize: 13
            anchors.leftMargin: 10
            anchors.topMargin: 22

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    addAnimationMenu.running = true
                    addAnimationMenu1.running = true
                }
            }
        }

        Rectangle {
            id: rectangle9
            x: 68
            width: 422
            height: 40
            color: "#111d2b"
            radius: 10
            anchors.left: label7.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.rightMargin: 20
            anchors.topMargin: 10
            clip: true

            Label {
                id: label6
                x: 101
                y: 19
                color: "#ffffff"
                text: qsTr("Course Handled Setting")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 13
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle13
            x: 290
            width: 235
            height: 40
            color: "#111d2b"
            radius: 10
            anchors.right: parent.right
            anchors.top: rectangle9.bottom
            anchors.topMargin: 5
            anchors.rightMargin: 20

            Label {
                id: label9
                x: 117
                y: 27
                color: "#ffffff"
                text: qsTr("Courses Handled")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 13
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle10
            x: 42
            width: 235
            color: "#111d2b"
            radius: 10
            anchors.right: parent.right
            anchors.top: rectangle13.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 5
            anchors.rightMargin: 20
            anchors.bottomMargin: 10
            
            ScrollView {
                id: scrollView1
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                clip: true

                ListModel {
                    id: handledListModel
                }

                Component {
                    id: handledDelegate
                    
                    Item {
                        width: handledListView.width
                        height: 25

                        Label {
                            id: handledCourseCode
                            verticalAlignment: Text.AlignVCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            height: 25
                            color: "white"
                            text: code
                            font.pixelSize: 13
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                handledListView.currentIndex = index
                            }
                            onDoubleClicked: {
                                AdminAccountDetails.addToNotHandled(handledCourseCode.text)
                                handledListModel.clear()
                                AdminAccountDetails.displayHandled()
                                notHandledCourseListModel.clear()
                                AdminAccountDetails.displayNotHandled()
                            }
                        }
                    }
                }

                ListView {
                    id: handledListView
                    anchors.fill: parent

                    model: handledListModel
                    delegate: handledDelegate

                    highlight: Rectangle {
                        width: handledListView.width
                        color: "#233A55"
                        radius: 10
                    }

                    Component.onCompleted: AdminAccountDetails.displayHandled()
                }
            }
        }

        Rectangle {
            id: rectangle12
            width: 235
            height: 40
            color: "#111d2b"
            radius: 10
            anchors.left: parent.left
            anchors.top: rectangle9.bottom
            anchors.leftMargin: 10
            anchors.topMargin: 5

            Label {
                id: label8
                x: 105
                y: 27
                color: "#ffffff"
                text: qsTr("Courses Available")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 13
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: rectangle11
            width: 235
            color: "#111d2b"
            radius: 10
            anchors.left: parent.left
            anchors.top: rectangle12.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 5
            anchors.bottomMargin: 10
            anchors.leftMargin: 10
            
            ScrollView {
                id: scrollView2
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                clip: true

                ListModel {
                    id: notHandledCourseListModel
                }

                Component {
                    id: notHandledCourseDelegate
                    
                    Item {
                        width: notHandledCourseListView.width
                        height: 25

                        Label {
                            id: notHandledCourseCourseCode
                            verticalAlignment: Text.AlignVCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            height: 25
                            color: "white"
                            text: code
                            font.pixelSize: 13
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                notHandledCourseListView.currentIndex = index
                            }
                            onDoubleClicked: {
                                AdminAccountDetails.addToHandled(notHandledCourseCourseCode.text)
                                notHandledCourseListModel.clear()
                                AdminAccountDetails.displayNotHandled()
                                handledListModel.clear()
                                AdminAccountDetails.displayHandled()
                            }
                        }
                    }
                }

                ListView {
                    id: notHandledCourseListView
                    anchors.fill: parent

                    model: notHandledCourseListModel
                    delegate: notHandledCourseDelegate

                    highlight: Rectangle {
                        width: notHandledCourseListView.width
                        color: "#233A55"
                        radius: 10
                    }

                    Component.onCompleted: AdminAccountDetails.displayNotHandled()
                }
            }
        }
    }

    Shortcut {
        sequence: "Ctrl+S"
        onActivated: showPassword()
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

    Component.onCompleted: {
        AdminAccountDetails.getCurrentAccount()
        editPasswordText.text = AdminAccountDetails.getPass()
        image.source = AdminAccountDetails.getImg()
        image1.source = AdminAccountDetails.getImg()
    }

    Connections {
        target: AdminAccountDetails

        function onDisplayCoursesFinalSignal(code) {
            courseListModelFinal.append({"code": code})
        }

        function onDisplayHandledSignal(code) {
            handledListModel.append({"code": code})
        }

        function onDisplayNotHandledSignal(code) {
            notHandledCourseListModel.append({"code": code})
        }
    }
}
