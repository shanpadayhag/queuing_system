import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.14
import "components"
import "../"

Window {
    id: window
    width: 831
    height: 330
    visible: true
    color: "transparent"

    flags: Qt.Window | Qt.FramelessWindowHint

    property string number: ""
    property int currentValue: 0

    function get_queue() {
        QueueNumber.saveReport(queueNumberText.text)
        QueueNumber.incrementNumber(currentValue)
        Login.pop_up(queueNumberText.text + " is your queue number")
        window.destroy()
    }

    Rectangle {
        id: rectangle
        color: "#0b131c"
        anchors.fill: parent

        TopBarButton {
            id: closeBtn
            anchors.top: parent.top
            anchors.right: parent.right
            btnIconSource: "../../../img/icon/close.svg"
            btnColorDefault: "transparent"
            btnColorMouseOver: "#EF2938"
            btnColorClicked: "#E81123"
            onClicked: {
                qmlConnections.openWindow("login")
                window.destroy()
            }
        }

        Rectangle {
            id: rectangle1
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20
            width: 200
            height: 135
            color: "#58697e"
            radius: 10

            Rectangle {
                id: rectangle4
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                height: 40
                color: "#111d2b"
                radius: 10

                Label {
                    id: comSciLabel
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#ffffff"
                    text: qsTr("Computer Science")
                    font.pixelSize: 13
                }
            }

            Rectangle {
                id: rectangle7
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: rectangle4.bottom
                anchors.topMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                color: "#111d2b"
                radius: 10

                CustomButton {
                    id: comSciBtn
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 150
                    height: 30
                    text: "Select"
                    font.bold: true
                    font.pixelSize: 13
                    onClicked: queueNumberText.text = "CS" + ('000' + number).slice(-3)
                }
            }
        }

        Rectangle {
            id: rectangle2
            anchors.left: rectangle1.right
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20
            width: 200
            height: 135
            color: "#58697e"
            radius: 10

            Rectangle {
                id: rectangle5
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                height: 40
                color: "#111d2b"
                radius: 10

                Label {
                    id: infoTechLabel
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#ffffff"
                    text: qsTr("Information Technology")
                    font.pixelSize: 13
                }
            }

            Rectangle {
                id: rectangle8
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: rectangle5.bottom
                anchors.topMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                color: "#111d2b"
                radius: 10

                CustomButton {
                    id: infoTechBtn
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 150
                    height: 30
                    text: "Select"
                    font.bold: true
                    font.pixelSize: 13
                    onClicked: queueNumberText.text = "IT" + ('000' + number).slice(-3)
                }
            }
        }

        Rectangle {
            id: rectangle3
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: rectangle1.bottom
            anchors.topMargin: 20
            width: 200
            height: 135
            color: "#58697e"
            radius: 10

            Rectangle {
                id: rectangle6
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                height: 40
                color: "#111d2b"
                radius: 10

                Label {
                    id: label2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#ffffff"
                    text: qsTr("Information System")
                    font.pixelSize: 13
                }
            }

            Rectangle {
                id: rectangle9
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: rectangle6.bottom
                anchors.topMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                color: "#111d2b"
                radius: 10

                CustomButton {
                    id: customButton2
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 150
                    height: 30
                    text: "Select"
                    font.bold: true
                    font.pixelSize: 13
                    onClicked: queueNumberText.text = "IS" + ('000' + number).slice(-3)
                }
            }
        }

        Rectangle {
            id: rectangle10
            anchors.left: rectangle3.right
            anchors.leftMargin: 20
            anchors.top: rectangle2.bottom
            anchors.topMargin: 20
            width: 200
            height: 135
            color: "#58697e"
            radius: 10

            Rectangle {
                id: rectangle11
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                height: 40
                color: "#111d2b"
                radius: 10

                Label {
                    id: label3
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#ffffff"
                    text: qsTr("Entertainment and Multimedia Computing")
                    font.pixelSize: 13
                    wrapMode: Text.Wrap
                    width: 127
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            Rectangle {
                id: rectangle12
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: rectangle11.bottom
                anchors.topMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                color: "#111d2b"
                radius: 10

                CustomButton {
                    id: customButton3
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 150
                    height: 30
                    text: "Select"
                    font.bold: true
                    font.pixelSize: 13
                    onClicked: queueNumberText.text = "EMC" + ('000' + number).slice(-3)
                }
            }
        }

        Rectangle {
            id: rectangle13
            anchors.left: rectangle2.right
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            height: 200
            color: "#58697e"
            radius: 10

            Rectangle {
                id: rectangle14
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.bottom: rectangle15.top
                anchors.bottomMargin: 5
                color: "#111d2b"
                radius: 10

                Label {
                    id: queueNumberText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#ffffff"
                    text: qsTr("Click buttons\nfor Queue")
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 25
                }
            }

            Rectangle {
                id: rectangle15
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                y: 169
                height: 70
                color: "#111d2b"
                radius: 10

                CustomButton {
                    id: customButton4
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 150
                    height: 30
                    text: "Confirm"
                    font.bold: true
                    font.pixelSize: 13
                    onClicked: get_queue()
                }
            }
        }
    }

    Shortcut {
        sequence: "Escape"
        onActivated: {
            Login.queue_pop_up_login()
            window.destroy()
        }
    }

    QMLConnections {
        id: qmlConnections
    }

    Connections {
        target: QueueNumber
        function onSignalNumber(num) {
            number = num + 1
            currentValue = num
        }
    }

    Component.onCompleted: {
        QueueNumber.getNumber()
    }
}
