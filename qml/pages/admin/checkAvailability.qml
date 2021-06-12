import QtQuick 2.0
import QtQuick.Controls 2.15
import "controls"

Item {
    function checkAvailability (stats) {
        if (stats === 0) {
            availabilityLabel.text = 'Unavailable'
            availabilityLabel.color = 'red'
        } else if (stats === 1) {
            availabilityLabel.text = 'Available'
            availabilityLabel.color = '#14eb2e'
        }else {
            availabilityLabel.text = 'Error 404'
            availabilityLabel.color = '#ffff00'
        }
    }
    Rectangle {
        id: rectangle
        color: "#13141f"
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            width: 296
            color: "#0e0b19"
            radius: 10
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10

            Rectangle {
                id: rectangle5
                height: 45
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10
                Label {
                    id: label1
                    color: "#ffffff"
                    text: qsTr("Instructors")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 15
                    font.bold: true
                }
                anchors.leftMargin: 10
                anchors.rightMargin: 10
            }

            Rectangle {
                id: listRectangle
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle5.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5

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
                        width: parent.width-20
                        color: '#313131'
                        radius: 10
                    }
                }
            }

        }

        Rectangle {
            id: rectangle2
            color: "#0e0b19"
            radius: 10
            anchors.left: rectangle1.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            anchors.rightMargin: 10

            Rectangle {
                id: rectangle3
                height: 45
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 10

                Label {
                    id: label
                    color: "#ffffff"
                    text: qsTr("Status")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 15
                }
            }

            Rectangle {
                id: rectangle6
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle3.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5

                ScrollView {
                    id: scrollView
                    anchors.fill: parent
                    clip: true
                    ScrollBar.vertical.interactive: true
                    contentHeight: 774

                    Label {
                        id: availabilityLabel
                        height: 45
                        text: qsTr("")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.pointSize: 15
                        anchors.topMargin: 10
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0
                    }

                    Label {
                        id: instructorName
                        color: "#ffffff"
                        text: qsTr("Name:")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: image.bottom
                        font.pointSize: 15
                        anchors.rightMargin: 0
                        anchors.leftMargin: 20
                        anchors.topMargin: 20
                    }

                    Image {
                        id: image
                        x: 173
                        width: 100
                        height: 100
                        anchors.top: availabilityLabel.bottom
                        source: "../../../imgs/favicon.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 20
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: instructorName1
                        color: "#ffffff"
                        text: qsTr("Programs he/she handles: ")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: instructorName.bottom
                        font.pointSize: 15
                        anchors.leftMargin: 20
                        anchors.topMargin: 10
                        anchors.rightMargin: 0
                    }

                    Label {
                        id: instructorName2
                        color: "#ffffff"
                        text: qsTr("Dates Avaliable:")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: instructorName1.bottom
                        font.pointSize: 15
                        anchors.topMargin: 10
                        anchors.leftMargin: 20
                        anchors.rightMargin: 0
                    }

                    CalendarWidget {
                        id: calendarWidget
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: instructorName2.bottom
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 30
                        anchors.leftMargin: 20
                        anchors.topMargin: 20
                        anchors.rightMargin: 20
                        anchors.verticalCenterOffset: 140
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
