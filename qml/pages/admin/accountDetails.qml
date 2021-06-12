import QtQuick 2.10
import QtQuick.Controls 2.15
import 'controls'

Item {

    Rectangle {
        id: rectangle
        color: "#13141f"
        anchors.fill: parent
        clip: false

        ScrollView {
            clip: true
            anchors.left: parent.left
            anchors.right: pictureRectangle.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 50
            contentHeight: content.height

            Rectangle {
                id: content
                height: 484
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                clip: false
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Label {
                    id: nameText
                    x: 222
                    y: 50
                    color: "#ffffff"
                    text: qsTr("Name")
                    anchors.verticalCenter: nameBtn.verticalCenter
                    anchors.left: nameBtn.right
                    anchors.right: parent.right
                    anchors.rightMargin: 50
                    anchors.leftMargin: 20
                    font.pointSize: 12
                }

                Label {
                    id: idText
                    x: 224
                    y: 130
                    color: "#ffffff"
                    text: qsTr("School ID")
                    anchors.verticalCenter: idBtn.verticalCenter
                    anchors.left: idBtn.right
                    anchors.right: parent.right
                    anchors.rightMargin: 50
                    anchors.leftMargin: 22
                    font.pointSize: 12
                }

                Label {
                    id: nameBtn
                    x: 129
                    y: 45
                    width: 73
                    height: 30
                    color: "#ffffff"
                    text: "Name:"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 12
                }

                Label {
                    id: idBtn
                    x: 98
                    y: 125
                    width: 104
                    height: 30
                    color: "#ffffff"
                    text: "School ID:"
                    anchors.right: nameBtn.right
                    anchors.top: nameBtn.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 50
                    anchors.rightMargin: 0
                    font.bold: true
                    font.pointSize: 12
                }

                Label {
                    id: coursesHandledBtn
                    x: 40
                    y: 205
                    width: 162
                    height: 30
                    color: "#ffffff"
                    text: "Courses Handled:"
                    anchors.right: idBtn.right
                    anchors.top: idBtn.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 50
                    anchors.rightMargin: 0
                    font.pointSize: 12
                    font.bold: true
                }

                Rectangle {
                    id: rectangle1
                    color: "#00000000"
                    anchors.left: coursesHandledBtn.right
                    anchors.right: parent.right
                    anchors.top: coursesHandledBtn.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.rightMargin: 50
                    anchors.leftMargin: 20
                    anchors.topMargin: 0
                    clip: true

                    ScrollView {
                        anchors.fill: parent
                        clip: true

                        ListModel {
                            id: modelTakenFinal
                        }

                        Component {
                            id: delegateTakenFinal
                            Item {
                                width: listViewTakenFinal.width
                                height: 30
                                Text {
                                    id: namename
                                    text: courseName
                                    anchors.left: parent.left
                                    height: 30
                                    color: "#ffffff"
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.leftMargin: 10
                                    font.pointSize: 12
                                }
                            }
                        }

                        ListView {
                            id: listViewTakenFinal
                            anchors.fill: parent
                            anchors.rightMargin: 20
                            anchors.leftMargin: 20
                            anchors.bottomMargin: 20
                            anchors.topMargin: 20
                            focus: true

                            model: modelTakenFinal
                            delegate: delegateTakenFinal
                        }
                    }
                }
            }
        }

        Rectangle {
            id: pictureRectangle
            width: 200
            height: 200
            color: "#00000000"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.rightMargin: 50

            Image {
                id: image
                anchors.fill: parent
                source: "qrc:/qtquickplugin/images/template_image.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        CustomButton {
            id: editProfileBtn
            x: 1372
            width: 175
            height: 40
            text: "Edit Profile"
            anchors.top: pictureRectangle.bottom
            anchors.topMargin: 50
            anchors.horizontalCenter: pictureRectangle.horizontalCenter
            font.bold: true
            font.pointSize: 12
            onClicked: {
                addAnimationMenu.running = true
                if (editProfile.width === 420) {
                    editProfile.running = true
                }
            }
        }




        Rectangle {
            id: editProfile
            x: 936
            width: 10
            height: 400
            color: "#616269"
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            clip: true
            anchors.rightMargin: -10

            PropertyAnimation {
                id: addAnimationMenu
                target: editProfile
                property: "width"
                to: if (editProfile.width === 10) return 685; else return 10
                duration: 1000
                easing.type: Easing.OutQuint
            }

            Label {
                id: returnBtn
                width: 70
                height: 25
                color: "#ffffff"
                text: qsTr("Back >")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.underline: false
                anchors.leftMargin: 10
                anchors.topMargin: 10
                font.pointSize: 12

                MouseArea {
                    id: mouseArea
                    x: 0
                    y: 0
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        addAnimationMenu.running = true
                    }
                }
            }

            Label {
                id: imgURLLabel
                color: "#ffffff"
                text: qsTr("Image File Name: ")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 50
                anchors.topMargin: 75
                font.bold: true
                font.pointSize: 12
            }

            Label {
                id: nameLabel
                x: 97
                color: "#ffffff"
                text: qsTr("Name:")
                anchors.right: imgURLLabel.right
                anchors.top: imgURLLabel.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 50
                font.bold: true
                font.pointSize: 12
            }

            Label {
                id: idLabel
                x: 97
                color: "#ffffff"
                text: qsTr("School ID:")
                anchors.right: nameLabel.right
                anchors.top: nameLabel.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 50
                font.bold: true
                font.pointSize: 12
            }

            Label {
                id: courseHandledLabel
                x: 97
                color: "#ffffff"
                text: qsTr("Courses Handled:")
                anchors.right: idLabel.right
                anchors.top: idLabel.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 50
                font.bold: true
                font.pointSize: 12
            }

            CustomTextField {
                id: setImageFileNameText
                y: 75
                anchors.verticalCenter: imgURLLabel.verticalCenter
                anchors.left: imgURLLabel.right
                placeholderText: "Image file name with extension"
                anchors.leftMargin: 20
                font.pointSize: 12
            }

            CustomTextField {
                id: setNameText
                y: 144
                anchors.verticalCenter: nameLabel.verticalCenter
                anchors.left: nameLabel.right
                placeholderText: "Full name"
                text: nameText.text
                anchors.leftMargin: 20
                font.pointSize: 12
            }

            CustomTextField {
                id: setIDText
                y: 203
                anchors.verticalCenter: idLabel.verticalCenter
                anchors.left: idLabel.right
                placeholderText: "School ID"
                text: idText.text
                anchors.leftMargin: 20
                font.pointSize: 12
            }

            CustomTextField {
                id: setCourseHandledText
                y: 272
                anchors.verticalCenter: courseHandledLabel.verticalCenter
                anchors.left: courseHandledLabel.right
                placeholderText: "Courses handled"
                readOnly: true
                anchors.leftMargin: 20
                font.pointSize: 12
            }

            CustomButton {
                id: setCourseHandledBtn
                y: 272
                width: 100
                height: 40
                text: "Help"
                anchors.verticalCenter: setCourseHandledText.verticalCenter
                anchors.left: setCourseHandledText.right
                anchors.leftMargin: 6
                font.bold: true
                font.pointSize: 12
                onClicked: {
                    addAnimationMenu.running = true
                    addAnimationMenu1.running = true
                }
            }

            CustomButton {
                id: customButton
                width: 175
                height: 40
                text: "Save Changes"
                anchors.left: parent.left
                anchors.top: setCourseHandledText.bottom
                anchors.leftMargin: 250
                font.bold: true
                font.pointSize: 12
                anchors.topMargin: 20
                onClicked: {
                    addAnimationMenu.running = true
                }
            }

        }


        Rectangle {
            id: courseHandledRectangle
            x: 508
            y: -598
            width: 10
            height: 473
            color: "#404146"
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            clip: true
            anchors.rightMargin: -10

            PropertyAnimation {
                id: addAnimationMenu1
                target: courseHandledRectangle
                property: "width"
                to: if (courseHandledRectangle.width === 10) return 685; else return 10
                duration: 1000
                easing.type: Easing.OutQuint
            }

            Label {
                id: returnBtn1
                width: 70
                height: 25
                color: "#ffffff"
                text: qsTr("Back >")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.topMargin: 10
                anchors.leftMargin: 10
                font.underline: false
                MouseArea {
                    id: mouseArea1
                    x: 0
                    y: 0
                    anchors.fill: parent
                    onClicked: {
                        addAnimationMenu1.running = true
                        addAnimationMenu.running = true
                    }
                    cursorShape: Qt.PointingHandCursor
                }
                font.pointSize: 12
            }

            Rectangle {
                id: rectangle3
                width: 313
                height: 200
                color: "#00000000"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 75
                anchors.bottomMargin: 100
                anchors.leftMargin: 20

                ScrollView {
                    id: scrollView
                    anchors.fill: parent

                    ListModel {
                        id: modelUntaken
                    }

                    Component {
                        id: delegateUntaken
                        Item {
                            width: listViewUntaken.width
                            height: 30
                            Text {
                                id: namename
                                text: courseName
                                anchors.left: parent.left
                                height: 30
                                color: "#ffffff"
                                verticalAlignment: Text.AlignVCenter
                                anchors.leftMargin: 10
                                font.pointSize: 12
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    listViewUntaken.currentIndex = index
                                }
                                onDoubleClicked: {
                                    AccountDetails.changeToTaken(namename.text) 
                                    AccountDetails.courseUntaken()   
                                    AccountDetails.courseTaken()
                                }
                            }
                        }
                    }

                    ListView {
                        id: listViewUntaken
                        anchors.fill: parent
                        anchors.rightMargin: 20
                        anchors.leftMargin: 20
                        anchors.bottomMargin: 20
                        anchors.topMargin: 20
                        focus: true

                        model: modelUntaken
                        delegate: delegateUntaken

                        highlight: Rectangle {
                            width: listViewUntaken.width-20
                            color: '#313131'
                            radius: 10
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle4
                color: "#00000000"
                anchors.left: rectangle3.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 10
                anchors.rightMargin: 20
                anchors.bottomMargin: 100
                anchors.topMargin: 75

                ScrollView {
                    id: scrollView1
                    anchors.fill: parent

                    ListModel {
                        id: modelTaken
                    }

                    Component {
                        id: delegateTaken
                        Item {
                            width: listViewTaken.width
                            height: 30
                            Text {
                                id: namename
                                text: courseName
                                anchors.left: parent.left
                                height: 30
                                color: "#ffffff"
                                verticalAlignment: Text.AlignVCenter
                                anchors.leftMargin: 10
                                font.pointSize: 12
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    listViewTaken.currentIndex = index
                                }
                                onDoubleClicked: {
                                    AccountDetails.changeToUntaken(namename.text) 
                                    AccountDetails.courseUntaken()   
                                    AccountDetails.courseTaken()
                                }
                            }
                        }
                    }

                    ListView {
                        id: listViewTaken
                        anchors.fill: parent
                        anchors.rightMargin: 20
                        anchors.leftMargin: 20
                        anchors.bottomMargin: 20
                        anchors.topMargin: 20
                        focus: true

                        model: modelTaken
                        delegate: delegateTaken

                        highlight: Rectangle {
                            width: listViewTaken.width
                            color: '#313131'
                            radius: 10
                        }
                    }
                }
            }

            CustomButton {
                id: customButton3
                y: 429
                width: 175
                height: 40
                text: "Done"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 35
                anchors.leftMargin: 250
                font.bold: true
                font.pointSize: 12
                onClicked: {
                    addAnimationMenu1.running = true
                    addAnimationMenu.running = true
                }
            }
        }
    }
    Connections {
        target: AccountDetails
        function onTakenCourses(a) {
            modelTaken.append({'courseName': a})
            modelTakenFinal.append({'courseName': a})
        }
        function onUntakenCourses(a) {
            modelUntaken.append({'courseName': a})
        }
        function onClearModels() {
            modelTaken.clear()
            modelUntaken.clear()
            modelTakenFinal.clear()
        }
    }

    Component.onCompleted: {
        AccountDetails.courseUntaken()
        AccountDetails.courseTaken()
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.33;height:864;width:1609}D{i:14;locked:true}
D{i:13;locked:true}D{i:12;locked:true}D{i:15;locked:true}D{i:18;locked:true}
}
##^##*/
