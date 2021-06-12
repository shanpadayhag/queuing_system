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
            id: addAreaRectangle
            width: 20
            height: 284
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
                to: if (addAreaRectangle.width === 20) return 360; else return 20
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
                anchors.bottomMargin: 50
                font.pointSize: 12
            }

            CustomTextField {
                id: addNameText
                y: 332
                anchors.left: parent.left
                anchors.bottom: addProgramText.top
                placeholderText: "Name"
                font.pointSize: 12
                anchors.leftMargin: 50
                anchors.bottomMargin: 25
            }

            CustomTextField {
                id: addProgramText
                y: 450
                anchors.left: parent.left
                anchors.bottom: addConfirmButton.top
                placeholderText: "Program"
                font.pointSize: 12
                anchors.leftMargin: 50
                anchors.bottomMargin: 25
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
                to: if (removeAreaRectangle.width === 20) return 360; else return 20
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
            }

            Label {
                id: removeNameLabel
                y: 332
                color: "#ffffff"
                text: "Name: "
                anchors.left: parent.left
                anchors.bottom: removeProgramLabel.top
                font.bold: true
                font.pointSize: 12
                anchors.leftMargin: 50
                anchors.bottomMargin: 25
            }

            Label {
                id: removeProgramLabel
                y: 450
                color: "#ffffff"
                text: "Program: "
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
                text: qsTr("Label")
                anchors.verticalCenter: removeNameLabel.verticalCenter
                anchors.left: removeNameLabel.right
                anchors.leftMargin: 10
                font.pointSize: 12
            }

            Label {
                id: programDisplay
                y: 184
                color: "#ffffff"
                text: qsTr("Label")
                anchors.verticalCenter: removeProgramLabel.verticalCenter
                anchors.left: removeProgramLabel.right
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
                    removeAnimationMenu.running = true
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
                    addAnimationMenu.running = true
                    removeAnimationMenu.running = true
                }
            }
        }

        Rectangle {
            id: rectangle1
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: buttonAreaRectangle.top
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            Rectangle {
                id: studentListRectangle
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: parent.width/2
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ScrollView {
                    id: scrollView
                    anchors.fill: parent
                    contentHeight: modelName.height
                    clip: true

                    ListModel {
                        id: modelName
                        ListElement {name: 'Lowee Oliva'; status: 1}
                        ListElement {name: 'Rangie Obispo'; status: 1}
                        ListElement {name: 'Elvira Yaneza'; status: 0}
                        ListElement {name: 'Patrick Mack'; status: 1}
                        ListElement {name: 'Jordan Canete'; status: 0}
                        ListElement {name: 'Jessie Christopher Lagrosas'; status: 0}
                        ListElement {name: 'Cristina Amor Cajilla'; status: 1}
                        ListElement {name: 'Florence Reyes'; status: 0}
                        ListElement {name: 'Maria Ramilla Jimenez'; status: 1}
                        ListElement {name: 'Dr. Meldie Apag'; status: 0}
                    }

                    Component {
                        id: delegateName
                        Item {
                            width: parent.width
                            height: 30
                            Text {
                                text: name
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
                                    listViewName.currentIndex = index
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
                        model: modelName
                        delegate: delegateName
                        highlight: Rectangle {
                            width: parent.width-20
                            color: '#313131'
                            radius: 10
                        }
                    }
                }
            }

            Rectangle {
                id: instructorListRectangle
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: parent.width/2
                anchors.topMargin: 0

                ScrollView {
                    id: scrollViewInstructor
                    anchors.fill: parent
                    contentHeight: modelNameInstructor.height
                    clip: true

                    ListModel {
                        id: modelNameInstructor
                        ListElement {name: 'Lowee Oliva'; status: 1}
                        ListElement {name: 'Rangie Obispo'; status: 1}
                        ListElement {name: 'Elvira Yaneza'; status: 0}
                        ListElement {name: 'Patrick Mack'; status: 1}
                        ListElement {name: 'Jordan Canete'; status: 0}
                        ListElement {name: 'Jessie Christopher Lagrosas'; status: 0}
                        ListElement {name: 'Cristina Amor Cajilla'; status: 1}
                        ListElement {name: 'Florence Reyes'; status: 0}
                        ListElement {name: 'Maria Ramilla Jimenez'; status: 1}
                        ListElement {name: 'Dr. Meldie Apag'; status: 0}
                    }

                    Component {
                        id: delegateNameInstructor
                        Item {
                            width: parent.width
                            height: 30
                            Text {
                                text: name
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
                                    listViewNameInstructor.currentIndex = index
                                }
                            }
                        }
                    }

                    ListView {
                        id: listViewNameInstructor
                        anchors.fill: parent
                        anchors.rightMargin: 20
                        anchors.leftMargin: 20
                        anchors.bottomMargin: 20
                        anchors.topMargin: 20
                        model: modelNameInstructor
                        delegate: delegateNameInstructor
                        highlight: Rectangle {
                            width: parent.width-20
                            color: '#313131'
                            radius: 10
                        }
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:864;width:1609}
}
##^##*/
