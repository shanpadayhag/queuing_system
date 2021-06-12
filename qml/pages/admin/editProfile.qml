import QtQuick 2.0
import QtQuick.Window 2.14
import QtQuick.Controls 2.15
import 'controls'

Window {
    id: window
    height: 707
    color: "#00000000"

    Rectangle {
        id: rectangle
        color: "#13141f"
        anchors.fill: parent



        TopBarButton {
            id: topBarButton1
            x: 564
            anchors.right: topBarButton.left
            anchors.top: parent.top
            btnIconSource: "../../../imgs/svg_images/minimize_icon.svg"
            btnColorDefault: "#13141f"
            anchors.rightMargin: 0
            anchors.topMargin: 0
        }

        TopBarButton {
            id: topBarButton
            x: 605
            y: 0
            anchors.right: parent.right
            anchors.top: parent.top
            btnColorMouseOver: "#00000000"
            btnColorClicked: "#e81123"
            btnColorDefault: "#ef2938"
            btnIconSource: "../../../imgs/svg_images/close_icon.svg"
            anchors.rightMargin: 0
            anchors.topMargin: 0
        }

        CustomTextField {
            id: customTextField
            x: 163
            y: 109
        }

        CustomTextField {
            id: customTextField1
            x: 183
            y: 188
        }

        CustomTextField {
            id: customTextField2
            x: 170
            y: 280
        }

        CustomTextField {
            id: customTextField3
            x: 170
            y: 385
        }

        CustomTextField {
            id: customTextField4
            x: 197
            y: 474
        }



        Label {
            id: label
            x: 261
            y: 45
            text: qsTr("Label")
        }
        Label {
            id: label1
            text: qsTr("Label")
        }

        Label {
            id: label2
            text: qsTr("Label")
        }

        Label {
            id: label3
            text: qsTr("Label")
        }

        Label {
            id: label4
            text: qsTr("Label")
        }

        Label {
            id: label5
            text: qsTr("Label")
        }

        Rectangle {
            id: rectangle1
            x: 594
            y: 212
            width: 200
            height: 200
            color: "#ffffff"
        }
    }


}


