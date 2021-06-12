import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#13141f"
        radius: 10
        anchors.fill: parent

        Label {
            id: label
            x: 379
            y: 204
            color: "#ffffff"
            text: qsTr("Home")
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:444;width:784}D{i:1}
}
##^##*/
