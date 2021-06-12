import QtQuick 2.0
import QtQuick.Controls 2.15
import "controls"

Item {
    Rectangle {
        id: rectangle
        color: "#13141f"
        anchors.fill: parent
        clip: true

        Rectangle {
        id: instructorListRectangle
        color: "#13141F"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: buttonAreaRectangle.top
        anchors.leftMargin: 100
        anchors.bottomMargin: 0
        anchors.rightMargin: 100
        anchors.topMargin: 100

            ScrollView {
                id: scrollViewInstructor
                anchors.fill: parent
                clip: true

                ListModel {
                    id: modelName
                }

                Component {
                    id: delegateNameInstructor
                    Item {
                        width: listViewNameInstructor.width
                        height: 30
                        Text {
                            id: namename
                            height: 30
                            color: "#ffffff"
                            text: instructorName
                            anchors.left: parent.left
                            verticalAlignment: Text.AlignVCenter
                            font.pointSize: 12
                            anchors.leftMargin: 10
                        }
                        Text {
                            id: idid
                            height: 30
                            color: "#ffffff"
                            text: instructorID
                            anchors.left: parent.left
                            verticalAlignment: Text.AlignVCenter
                            font.pointSize: 12
                            anchors.leftMargin: 300
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                listViewNameInstructor.currentIndex = index
                                nameDisplay.text = namename.text
                                schoolIDDisplay.text = idid.text
                            }
                        }
                    }
                }

                ListView {
                    id: listViewNameInstructor
                    anchors.fill: parent
                    anchors.bottomMargin: 20
                    anchors.rightMargin: 20
                    anchors.topMargin: 20
                    anchors.leftMargin: 20

                    model: modelName
                    delegate: delegateNameInstructor
                    
                    highlight: Rectangle {
                        width: listViewNameInstructor.width-20
                        color: "#313131"
                        radius: 10
                    }
                }
            }
        }

        Label {
            id: label
            x: 722
            color: "#ffffff"
            text: qsTr("Instructor Accounts")
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

            PropertyAnimation {
                id: addAnimationMenu
                target: addAreaRectangle
                property: "width"
                easing.type: Easing.OutQuint
                duration: 1000
                to: if (addAreaRectangle.width === 20) return 420; else return 20
            }

            CustomButton {
                id: addConfirmButton
                y: 224
                width: 175
                height: 40
                text: "Confirm"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 25
                anchors.horizontalCenterOffset: -10
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
                onClicked: {
                    if (addPasswordText.text === addCPasswordText.text) {
                        AdminUI.addToDatabase(
                            addNameText.text, 
                            addSIDText.text, 
                            addPasswordText.text,
                            'instructorinfo',
                            'instructor'
                        )
                        AdminUI.callTheFunction('instructorinfo')
                    }
                }
            }

            CustomTextField {
                id: addNameText
                y: 96
                anchors.bottom: addSIDText.top
                anchors.bottomMargin: 25
                anchors.horizontalCenterOffset: -10
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: "Name"
                font.pointSize: 12
            }



            CustomTextField {
                id: addSIDText
                y: 165
                anchors.bottom: addPasswordText.top
                anchors.bottomMargin: 25
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -10
                placeholderText: "School ID"
                font.pointSize: 12
            }

            CustomTextField {
                id: addPasswordText
                y: 165
                anchors.bottom: addCPasswordText.top
                anchors.bottomMargin: 25
                anchors.horizontalCenterOffset: -10
                placeholderText: "Password"
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }

            CustomTextField {
                id: addCPasswordText
                y: 165
                anchors.bottom: addConfirmButton.top
                anchors.bottomMargin: 25
                anchors.horizontalCenterOffset: -10
                placeholderText: "Confirm Password"
                font.pointSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }

            CustomButton {
                id: addBackButton
                width: 99
                height: 44
                text: "Button >"
                colorDefault: "#00000000"
                font.pointSize: 12
                anchors.topMargin: 0
                font.bold: true
                colorMouseOver: "#00000000"
                anchors.leftMargin: 0
                colorPressed: "#00000000"
            }


            anchors.rightMargin: -20
            clip: true
        }

        Rectangle {
            id: removeAreaRectangle
            width: 20
            height: 211
            color: "#616269"
            radius: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            PropertyAnimation {
                id: removeAnimationMenu
                target: removeAreaRectangle
                property: "width"
                easing.type: Easing.OutQuint
                duration: 1000
                to: if (removeAreaRectangle.width === 20) return 420; else return 20
            }

            CustomButton {
                id: removeConfirmButton
                y: 729
                width: 175
                height: 40
                text: "Confirm"
                anchors.bottom: parent.bottom
                anchors.horizontalCenterOffset: -10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 25
                font.pointSize: 12
                anchors.leftMargin: 122
                onClicked: {
                    AdminUI.removeFromDatabase(
                        schoolIDDisplay.text, 
                        'instructorinfo',
                        'instructor'
                    )
                    AdminUI.callTheFunction('instructorinfo')
                }
            }

            Label {
                id: removeNameLabel
                y: 332
                color: "#ffffff"
                text: "Name: "
                anchors.left: parent.left
                anchors.bottom: removeSIDLabel.top
                anchors.bottomMargin: 25
                font.pointSize: 12
                font.bold: true
                anchors.leftMargin: 50
            }

            Label {
                id: removeSIDLabel
                y: 450
                color: "#ffffff"
                text: "School ID: "
                anchors.left: parent.left
                anchors.bottom: removeConfirmButton.top
                anchors.bottomMargin: 25
                font.pointSize: 12
                font.bold: true
                anchors.leftMargin: 50
            }

            CustomButton {
                id: removeBackButton
                width: 99
                height: 44
                text: "Button >"
                colorDefault: "#00000000"
                font.pointSize: 12
                anchors.topMargin: 0
                font.bold: true
                colorMouseOver: "#00000000"
                anchors.leftMargin: 0
                colorPressed: "#00000000"
            }

            Label {
                id: nameDisplay
                y: 140
                color: "#ffffff"
                text: qsTr("")
                anchors.verticalCenter: removeNameLabel.verticalCenter
                anchors.left: removeNameLabel.right
                font.pointSize: 12
                anchors.leftMargin: 10
            }

            Label {
                id: schoolIDDisplay
                y: 184
                color: "#ffffff"
                text: qsTr("")
                anchors.verticalCenter: removeSIDLabel.verticalCenter
                anchors.left: removeSIDLabel.right
                font.pointSize: 12
                anchors.leftMargin: 10
            }
            anchors.rightMargin: -20
            clip: true
        }

        Rectangle {
            id: buttonAreaRectangle
            y: 572
            height: 250
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            CustomButton {
                id: addBtn
                x: 648
                y: 119
                width: 175
                height: 40
                text: "Add"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: -140
                onClicked: {
                            addAnimationMenu.running = true
                            if (removeAreaRectangle.width === 420) {
                                removeAnimationMenu.running = true
                            }
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
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 140
                onClicked: {
                            removeAnimationMenu.running = true
                            if (addAreaRectangle.width === 420) {
                                addAnimationMenu.running = true
                            }
                }
            }
        }
    }

    Connections {
        target: AdminUI
        function onCallTheFunctionSignal(iname, iid) {
            modelName.append({'instructorName': iname, 'instructorID': iid})
        }
        function onClearTheModelSignal() {
            modelName.clear()
        }
    }
    Component.onCompleted: {
        AdminUI.callTheFunction('instructorinfo')
        try {
            nameDisplay.text = modelName.get(0).instructorName
            schoolIDDisplay.text = modelName.get(0).instructorID
        } catch (err){
            null
        }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:864;width:1609}D{i:18}D{i:19}
}
##^##*/
