import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 400
    height: 500
    visible: true
    
    Button {
        text: "ADMIN"
        font.pointSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        onClicked: Admin.homeBtn()
    }

    Connections {
        target: Admin
    }
}