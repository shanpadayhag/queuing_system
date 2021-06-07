import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#55aaff"
        anchors.fill: parent

        Label {
            id: label
            x: 562
            y: 272
            text: qsTr("Home ni siya")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 20
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66;height:693;width:1308}
}
##^##*/
