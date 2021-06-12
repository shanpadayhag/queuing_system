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
            onClicked: {
                animationMenu.running = true
            }
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
            onClicked: {
                animationMenu.running = true
            }
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
            onClicked: {
                animationMenu.running = true
            }
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
            onClicked: {
                animationMenu.running = true
            }
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
            onClicked: {
                animationMenu.running = true
            }
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
            onClicked: {
                animationMenu.running = true
            }
        }
    }

    Rectangle {
        id: information
        width: 0
        height: 221
        color: "#66646d"
        radius: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0
        clip: true

        PropertyAnimation {
            id: animationMenu
            target: information
            property: "width"
            to: if (information.width === 0) return 360; else return 0
            duration: 1000
            easing.type: Easing.OutQuint
        }

        CustomButton {
            id: customButton
            width: 113
            height: 58
            text: "Back >"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 0
            colorPressed: "#00000000"
            colorMouseOver: "#00000000"
            colorDefault: "#00000000"
            font.bold: true
            font.pointSize: 12
        }

        Label {
            id: label
            width: 57
            height: 23
            color: "#ffffff"
            text: qsTr("Status:")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 30
            anchors.topMargin: 80
            font.pointSize: 12
        }

        Label {
            id: statusLabel
            x: 106
            width: 66
            height: 23
            text: qsTr("Available")
            anchors.top: parent.top
            anchors.topMargin: 80
            font.pointSize: 12
        }

        CustomButton {
            id: reserveBtn
            x: 134
            y: 210
            width: 94
            height: 33
            text: "Reserve"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            font.bold: false
            font.pointSize: 12
        }

        CustomTextField {
            id: purposeText
            x: 31
            y: 162
            anchors.bottom: reserveBtn.top
            anchors.bottomMargin: 10
            font.pointSize: 12
            placeholderText: "Purpose"
        }

    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:864;width:1609}D{i:12}
}
##^##*/
