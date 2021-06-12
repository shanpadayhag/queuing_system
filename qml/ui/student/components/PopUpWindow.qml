import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    TextField {
        id: field
        width: parent.width
        onReleased: console.log("1")
    }
}