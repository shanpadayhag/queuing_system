import QtQuick 2.10
import QtQuick.Controls 2.15
import 'controls'

Item {
    Rectangle {
        id: rectangle
        color: "#13141f"
        radius: 10
        anchors.fill: parent
        clip: true

        Rectangle {
            id: studentListRectangle
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: buttonAreaRectangle.top
            clip: true
            anchors.rightMargin: 100
            anchors.bottomMargin: 0
            anchors.leftMargin: 100
            anchors.topMargin: 100

            ScrollView {
                id: scrollView
                anchors.fill: parent
                clip: true

                ListModel {
                    id: modelName
                }

                Component {
                    id: delegateName
                    Item {
                        width: listViewName.width
                        height: 30
                        Text {
                            id: namename
                            text: studentName
                            anchors.left: parent.left
                            height: 30
                            color: "#ffffff"
                            verticalAlignment: Text.AlignVCenter
                            anchors.leftMargin: 10
                            font.pointSize: 12
                        }
                        Text {
                            id: idid
                            text: studentID
                            anchors.left: parent.left
                            height: 30
                            color: "#ffffff"
                            verticalAlignment: Text.AlignVCenter
                            anchors.leftMargin: 300
                            font.pointSize: 12
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                listViewName.currentIndex = index
                                nameDisplay.text = namename.text
                                schoolIDDisplay.text = idid.text
                            }
                        }
                    }
                }

                ListView {
                    id: listViewName
                    anchors.fill: parent
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                    anchors.bottomMargin: 20
                    anchors.topMargin: 20
                    focus: true

                    model: modelName
                    delegate: delegateName

                    highlight: Rectangle {
                        width: listViewName.width-20
                        color: '#313131'
                        radius: 10
                    }
                }
            }
        }
    

        Label {
            id: label
            x: 722
            color: "#ffffff"
            text: qsTr("Student Accounts")
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: addAreaRectangle
            width: 20
            height: 377
            color: "#616269"
            radius: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: -20
            clip: true

            PropertyAnimation {
                id: addAnimationMenu
                target: addAreaRectangle
                property: "width"
                to: if (addAreaRectangle.width === 20) return 420; else return 20
                duration: 1000
                easing.type: Easing.OutQuint
            }

            CustomButton {
                id: addConfirmButton
                y: 729
                width: 175
                height: 40
                text: "Confirm"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 112
                anchors.bottomMargin: 25
                font.pointSize: 12
                onClicked: {
                    if (addPasswordText.text === addCPasswordText.text) {
                        AdminUI.addToDatabase(
                            addNameText.text, 
                            addSIDText.text, 
                            addPasswordText.text,
                            'studentinfo',
                            'student'
                        )
                        AdminUI.callTheFunction('studentinfo')
                    }
                }
            }

            CustomTextField {
                id: addNameText
                y: 332
                anchors.left: parent.left
                anchors.bottom: addSIDText.top
                placeholderText: "Name"
                font.pointSize: 12
                anchors.leftMargin: 50
                anchors.bottomMargin: 25
            }

            CustomTextField {
                id: addSIDText
                y: 450
                anchors.left: parent.left
                anchors.bottom: addPasswordText.top
                placeholderText: "School ID"
                font.pointSize: 12
                anchors.leftMargin: 50
                anchors.bottomMargin: 25
            }

            CustomTextField {
                id: addPasswordText
                y: 450
                anchors.left: parent.left
                anchors.bottom: addCPasswordText.top
                anchors.leftMargin: 50
                anchors.bottomMargin: 25
                placeholderText: "Password"
                font.pointSize: 12
            }

            CustomTextField {
                id: addCPasswordText
                y: 450
                anchors.left: parent.left
                anchors.bottom: addConfirmButton.top
                anchors.leftMargin: 50
                anchors.bottomMargin: 25
                placeholderText: "Confirm Password"
                font.pointSize: 12
            }

            CustomButton {
                id: addBackButton
                width: 99
                height: 44
                text: "Button >"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.topMargin: 0
                colorPressed: "#00000000"
                colorDefault: "#00000000"
                colorMouseOver: "#00000000"
                font.bold: true
                font.pointSize: 12
            }


        }

        Rectangle {
            id: removeAreaRectangle
            width: 20
            height: 251
            color: "#616269"
            radius: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: -20
            clip: true

            PropertyAnimation {
                id: removeAnimationMenu
                target: removeAreaRectangle
                property: "width"
                to: if (removeAreaRectangle.width === 20) return 420; else return 20
                duration: 1000
                easing.type: Easing.OutQuint
            }

            CustomButton {
                id: removeConfirmButton
                y: 729
                width: 175
                height: 40
                text: "Confirm"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 122
                anchors.bottomMargin: 50
                font.pointSize: 12
                onClicked: {
                    AdminUI.removeFromDatabase(
                        schoolIDDisplay.text, 
                        'studentinfo',
                        'student'
                    )
                    AdminUI.callTheFunction('studentinfo')
                }
            }

            Label {
                id: removeNameLabel
                y: 332
                color: "#ffffff"
                text: "Name: "
                anchors.left: parent.left
                anchors.bottom: removeSIDLabel.top
                font.bold: true
                font.pointSize: 12
                anchors.leftMargin: 50
                anchors.bottomMargin: 25
            }

            Label {
                id: removeSIDLabel
                y: 450
                color: "#ffffff"
                text: "School ID: "
                anchors.left: parent.left
                anchors.bottom: removeConfirmButton.top
                font.bold: true
                font.pointSize: 12
                anchors.leftMargin: 50
                anchors.bottomMargin: 25
            }

            CustomButton {
                id: removeBackButton
                width: 99
                height: 44
                text: "Button >"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.topMargin: 0
                colorPressed: "#00000000"
                colorDefault: "#00000000"
                colorMouseOver: "#00000000"
                font.bold: true
                font.pointSize: 12
            }

            Label {
                id: nameDisplay
                y: 140
                color: "#ffffff"
                text: qsTr("Student Name")
                anchors.verticalCenter: removeNameLabel.verticalCenter
                anchors.left: removeNameLabel.right
                anchors.leftMargin: 10
                font.pointSize: 12
            }

            Label {
                id: schoolIDDisplay
                y: 184
                color: "#ffffff"
                text: qsTr("School ID")
                anchors.verticalCenter: removeSIDLabel.verticalCenter
                anchors.left: removeSIDLabel.right
                anchors.leftMargin: 10
                font.pointSize: 12
            }
        }

        Rectangle {
            id: buttonAreaRectangle
            y: 572
            height: 250
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0

            CustomButton {
                id: addBtn
                x: 648
                y: 119
                width: 175
                height: 40
                text: "Add"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenterOffset: -140
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    addAnimationMenu.running = true
                }
            }

            CustomButton {
                id: removeBtn
                x: 822
                y: 124
                width: 175
                height: 40
                text: "Remove"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenterOffset: 140
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    removeAnimationMenu.running = true
                }
            }
        }
    }

    Connections {
        target: AdminUI
        function onCallTheFunctionSignal(iname, iid) {
            modelName.append({'studentName': iname, 'studentID': iid})
        }
        function onClearTheModelSignal() {
            modelName.clear()
        }
    }
    Component.onCompleted: {
        AdminUI.callTheFunction('studentinfo');
        try {
            nameDisplay.text = modelName.get(0).studentName
            schoolIDDisplay.text = modelName.get(0).studentID
        } catch (err){
            null
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:864;width:1609}
}
##^##*/
