import QtQuick 2.0
import QtQuick.Controls 2.15
import "controls"

Item {
    Rectangle {
        id: rectangle
        color: "#13141f"
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 200
            anchors.rightMargin: 0
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
            id: rectangle2
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle1.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0

            CustomButton {
                id: customButton
                x: 512
                y: 66
                width: 150
                height: 40
                text: "Accept"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:864;width:1609}
}
##^##*/
