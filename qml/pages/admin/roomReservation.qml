import QtQuick 2.0
import QtQuick.Controls 2.15
import "controls"

Item {
    id: item1
    Rectangle {
        id: roomButtons
        color: "#1a1724"
        radius: 10
        anchors.fill: parent
        CustomButton {
            id: oneRoom
            text: "Room 01"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.rightMargin: (parent.width*2)/3
            anchors.bottomMargin: parent.height/2
            anchors.topMargin: 0
            anchors.leftMargin: 0
        }

        CustomButton {
            id: twoRoom
            text: "Room 02"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.rightMargin: parent.width/3
            anchors.leftMargin: parent.width/3
            anchors.bottomMargin: parent.height/2
            anchors.topMargin: 0
        }

        CustomButton {
            id: threeRoom
            text: "Room 03"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.leftMargin: (parent.width*2)/3
            anchors.bottomMargin: parent.height/2
            anchors.topMargin: 0
            anchors.rightMargin: 0
        }

        CustomButton {
            id: fourRoom
            text: "Room 04"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.topMargin: parent.height/2
            anchors.rightMargin: (parent.width*2)/3
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
        }

        CustomButton {
            id: fiveRoom
            text: "Room 05"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.topMargin: parent.height/2
            anchors.rightMargin: parent.width/3
            anchors.leftMargin: parent.width/3
            anchors.bottomMargin: 0
        }

        CustomButton {
            id: sixRoom
            text: "Room 06"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.topMargin: parent.height/2
            anchors.leftMargin: (parent.width*2)/3
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
        }
    }

    Rectangle {
        id: information
        width: 805
        height: 795
        color: "#66646d"
        radius: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.right
        anchors.leftMargin: 0

        CustomButton {
            id: customButton
            width: 130
            height: 75
            text: "Back >"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 0
            colorPressed: "#00000000"
            colorMouseOver: "#00000000"
            colorDefault: "#00000000"
            font.bold: true
            font.pointSize: 15
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:864;width:1609}D{i:1}D{i:9}
}
##^##*/
