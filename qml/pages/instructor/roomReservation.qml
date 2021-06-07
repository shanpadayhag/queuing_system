import QtQuick 2.0
import QtQuick.Controls 2.15
import "components"

Item {
    Rectangle {
        id: rectangle
        color: "#313131"
        anchors.fill: parent

        Rectangle {
            id: room1
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: (parent.width*2)/3
            anchors.bottomMargin: parent.height/2
            anchors.leftMargin: 0
            anchors.topMargin: 0

            CustomButton {
                id: room01Btn
                text: "Room 01"
                anchors.fill: parent
                font.pointSize: 40
            }
        }

        Rectangle {
            id: room2
            x: 364
            y: 132
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: parent.width/3
            anchors.bottomMargin: parent.height/2
            anchors.leftMargin: parent.width/3
            anchors.topMargin: 0

            CustomButton {
                id: room01Btn1
                text: "Room 02"
                anchors.fill: parent
                font.pointSize: 40
            }
        }

        Rectangle {
            id: room3
            x: 785
            y: 47
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: parent.height/2
            anchors.leftMargin: (parent.width*2)/3
            anchors.topMargin: 0

            CustomButton {
                id: room01Btn2
                text: "Room 03"
                anchors.fill: parent
                font.pointSize: 40
            }
        }

        Rectangle {
            id: room4
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: (parent.width*2)/3
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: parent.height/2

            CustomButton {
                id: room01Btn3
                text: "Room 04"
                anchors.fill: parent
                font.pointSize: 40
            }
        }

        Rectangle {
            id: room5
            x: 427
            y: 402
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: parent.width/3
            anchors.bottomMargin: 0
            anchors.leftMargin: parent.width/3
            anchors.topMargin: parent.height/2

            CustomButton {
                id: room01Btn4
                text: "Room 05"
                anchors.fill: parent
                font.pointSize: 40
            }
        }

        Rectangle {
            id: room6
            x: 830
            y: 465
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: (parent.width*2)/3
            anchors.topMargin: parent.height/2

            CustomButton {
                id: room01Btn5
                text: "Room 06"
                anchors.fill: parent
                font.pointSize: 40
            }
        }



    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:693;width:1308}D{i:3}D{i:5}D{i:7}D{i:9}
D{i:11}D{i:13}
}
##^##*/
