import QtQuick 2.0
import QtQuick.Controls 2.15
import "controls"

Item {
    Rectangle {
        id: rectangle
        color: "#13141f"
        anchors.fill: parent

        Rectangle {
            id: listViewRectangle
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: inputAreaRectangle.left
            anchors.top: titleRectangle.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0



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
            id: inputAreaRectangle
            x: 1303
            width: 484
            color: "#00000000"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Label {
                id: inputAreaLabel
                x: 200
                y: 88
                text: qsTr("Label")
            }

            CustomTextField {
                id: taskName
                x: 67
                y: 314
                width: 384
                height: 50
                placeholderText: "Task name"
                font.pointSize: 12
            }

            CustomTextField {
                id: customTextField1
                x: 67
                y: 394
                width: 384
                height: 50
                placeholderText: "Number of person needed for the task"
                font.pointSize: 12
            }

            TextArea {
                id: taskDetails
                x: 152
                y: 564
                placeholderText: qsTr("Text Area")
            }

            CustomButton {
                id: addBtn
                x: 89
                y: 737
                width: 100
                height: 40
            }

            CustomButton {
                id: removeBtn
                x: 307
                y: 751
                width: 100
                height: 40
            }


        }

        Rectangle {
            id: titleRectangle
            height: 175
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: inputAreaRectangle.left
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            Label {
                id: listViewLabel
                x: 550
                y: 81
                text: qsTr("Label")
            }
        }


    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:864;width:1609}
}
##^##*/
