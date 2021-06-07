import QtQuick 2.0
import QtQuick.Controls 2.15
import "components"
import "controls"

Item {
    function checkAvailability(status) {
        if (status === 0) {
            availabilityLabel.text = 'Unavailable'
            availabilityLabel.color = 'red'
        } else {
            availabilityLabel.text = 'Available'
            availabilityLabel.color = '#14eb2e'
        }
    }

    Rectangle {
        id: rectangle
        color: "#1e1e1e"
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            color: "#313131"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 373
            clip: true
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0


            Rectangle {
                id: container
                color: "#1e1e1e"
                radius: 20
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 30
                anchors.leftMargin: 30
                anchors.bottomMargin: 30
                anchors.topMargin: 130
                clip: true

                ListModel {
                    id: modelName
                    ListElement {name: 'adf asdfsdf'; status: 0}
                    ListElement {name: 'adf asdfsdf'; status: 1}
                }

                Component {
                    id: delegateName
                    Item {
                        width: listViewName.width
                        height: 30
                        Text {
                            height: 30
                            text: name
                            anchors.left: parent.left
                            verticalAlignment: Text.AlignVCenter
                            anchors.leftMargin: 25
                            font.pointSize: 14
                            color: '#FFFFFF'
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                listViewName.currentIndex = index
                                checkAvailability(status)
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
                        width: parent.width
                        color: '#313131'
                        radius: 10
                    }
                }
            }

            Label {
                id: label1
                color: "#ffffff"
                text: qsTr("Services Offered")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: container.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 14
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }
        }

        Rectangle {
            id: rectangle2
            color: "#00000000"
            anchors.left: rectangle1.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0

            Label {
                id: label
                x: 71
                y: 0
                height: 31
                color: "#ffffff"
                text: qsTr("Details")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 14
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 54
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:693;width:1308}D{i:13}D{i:1}
}
##^##*/
