import QtQuick 2.15
import QtQuick.Window 2.13
import QtQuick.Controls 2.15

Window {
    id: window
    width: 283
    height: 145
    visible: true
    color: "#00000000"
    title: qsTr("Save Images")

    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle {
        id: rectangle
        color: "#58697e"
        radius: 10
        anchors.fill: parent
        anchors.bottomMargin: 0

        Rectangle {
            id: rectangle1
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
                x: 139
                y: 19
                color: "#ffffff"
                text: qsTr("Reload All Images")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pointSize: 10
            }
        }

        Rectangle {
            id: rectangle2
            color: "#111d2b"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle1.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 5

            Rectangle {
                id: rectangle3
                x: 77
                width: 162
                color: "#233a55"
                radius: 10
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 20
                anchors.topMargin: 20

                Label {
                    id: label1
                    x: 68
                    y: 19
                    color: "#ffffff"
                    text: qsTr("Reload")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 10
                }

                MouseArea {
                    anchors.fill: parent 
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        SaveImg.save_img()
                        window.close()
                    }
                }
            }
        }
    }
    Connections {
        target: SaveImg
    }
}
