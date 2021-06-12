import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"

Item {

    function success_pop_up(message) {
        var component = Qt.createComponent("../../popup/successful.qml")
        var win = component.createObject()
        win.message = message
        win.show()
    }

    function error_pop_up(message) {
        var component = Qt.createComponent("../../popup/error.qml")
        var win = component.createObject()
        win.message = message
        win.show()
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        color: "black"
        opacity: .3
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        contentHeight: content.height
        contentWidth: content.width

        Rectangle {
            id: content
            color: "#00000000"
            height: rect.height
            width: rectangle4.width + 40

            Rectangle {
                id: rectangle4
                x: 20
                y: 379
                width: 376
                height: 115
                color: "#58697e"
                radius: 10
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.leftMargin: 20

                Rectangle {
                    id: rectangle5
                    height: 40
                    color: "#111d2b"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10

                    Label {
                        id: label1
                        x: 150
                        y: 134
                        color: "#ffffff"
                        text: qsTr("Key Return Request")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 13
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: rectangle6
                    color: "#111d2b"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: rectangle5.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 5
                    anchors.rightMargin: 10
                    anchors.bottomMargin: 10
                    anchors.leftMargin: 10

                    CustomButton {
                        id: returnKeyBtn
                        width: 150
                        height: 30
                        text: "Return"
                        anchors.top: parent.top
                        font.letterSpacing: 0.4
                        font.pixelSize: 13
                        anchors.topMargin: 10
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            StudentHome.returnKey()
                            success_pop_up("Request to return key successful")
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: StudentHome.getCurrentAccount()

    Connections {
        target: StudentHome
    }
}
