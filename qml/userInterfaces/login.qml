import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: window
    width: 400
    height: 500
    visible: true
    
    Button {
        text: "LOGIN"
        font.pointSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        onClicked: Login.admin()
    }

    Connections {
        target: Login
    }
}