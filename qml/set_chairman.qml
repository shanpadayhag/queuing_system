import QtQuick 2.15
import QtQuick.Window 2.13
import QtQuick.Controls 2.15
import "ui/admin/page/components"
import "ui/admin/components"

Window {
    id: window
    width: 500
    height: 399
    visible: true
    color: "#00000000"
    title: qsTr("Chairman Setter")

    flags: Qt.Window | Qt.FramelessWindowHint

    function setChairman() {
        SetChairman.set_chairman(csChairman.text, emcChairman.text, isChairman.text, itChairman.text)
        window.close()
    }

    Rectangle {
        id: rectangle
        color: "#0b131c"
        anchors.fill: parent

        TopBarButton {
            id: closeBtn
            anchors.top: parent.top
            anchors.right: parent.right
            btnIconSource: "../img/icon/close.svg"
            btnColorDefault: "transparent"
            btnColorMouseOver: "#EF2938"
            btnColorClicked: "#E81123"
            onClicked: {
                window.close()
            }
        }

        ScrollView {
            id: scrollView
            anchors.fill: parent
            clip: true
            contentHeight: content.height
            anchors.topMargin: 35

            Rectangle {
                id: content
                height: rectangle2.height + rectangle5.height + rectangle8.height + rectangle11.height + 100
                color: "#00000000"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0

                Rectangle {
                    id: rectangle2
                    height: 170
                    color: "#58697e"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 30
                    anchors.leftMargin: 20
                    anchors.topMargin: 20
                    Rectangle {
                        id: rectangle3
                        height: 40
                        color: "#111d2b"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        anchors.topMargin: 10

                        Label {
                            id: label
                            x: 360
                            y: 19
                            color: "#ffffff"
                            text: qsTr("Computer Science Chairman")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 13
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle4
                        color: "#111d2b"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: rectangle3.bottom
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        anchors.topMargin: 5
                        anchors.bottomMargin: 10

                        CustomTextField {
                            id: csChairman
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            font.pixelSize: 13
                            placeholderText: "Computer science chairman school ID"
                            font.bold: false
                            anchors.rightMargin: 20
                            anchors.leftMargin: 20
                            anchors.topMargin: 10

                        }

                        CustomButton {
                            width: 175
                            height: 35
                            text: "Update CS Chairman"
                            anchors.top: csChairman.bottom
                            font.pixelSize: 13
                            font.bold: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.topMargin: 10
                            onClicked: setChairman()
                        }
                    }
                }

                Rectangle {
                    id: rectangle5
                    width: 200
                    height: 170
                    color: "#58697e"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: rectangle2.bottom
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                    anchors.topMargin: 20
                    Rectangle {
                        id: rectangle6
                        height: 40
                        color: "#111d2b"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        anchors.topMargin: 10

                        Label {
                            id: label1
                            x: 362
                            y: 14
                            color: "#ffffff"
                            text: qsTr("Entertainment Media Computer Chairman")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 13
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle7
                        color: "#111d2b"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: rectangle6.bottom
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        anchors.topMargin: 5
                        anchors.bottomMargin: 10

                        CustomTextField {
                            id: emcChairman
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            font.pixelSize: 13
                            anchors.leftMargin: 20
                            font.bold: false
                            anchors.rightMargin: 20
                            anchors.topMargin: 10
                            placeholderText: "Computer science chairman school ID"
                        }

                        CustomButton {
                            width: 175
                            height: 35
                            text: "Update EMC Chairman"
                            anchors.top: emcChairman.bottom
                            font.pixelSize: 13
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            anchors.topMargin: 10
                            onClicked: setChairman()
                        }
                    }
                }

                Rectangle {
                    id: rectangle8
                    height: 170
                    color: "#58697e"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: rectangle5.bottom
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                    anchors.topMargin: 20
                    Rectangle {
                        id: rectangle9
                        height: 40
                        color: "#111d2b"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        anchors.topMargin: 10

                        Label {
                            id: label2
                            x: 332
                            y: 19
                            color: "#ffffff"
                            text: qsTr("Information System Chairman")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 13
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle10
                        color: "#111d2b"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: rectangle9.bottom
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        anchors.topMargin: 5
                        anchors.bottomMargin: 10

                        CustomTextField {
                            id: isChairman
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            font.pixelSize: 13
                            anchors.leftMargin: 20
                            font.bold: false
                            anchors.rightMargin: 20
                            anchors.topMargin: 10
                            placeholderText: "Information system chairman school ID"
                        }

                        CustomButton {
                            width: 175
                            height: 35
                            text: "Update IS Chairman"
                            anchors.top: isChairman.bottom
                            font.pixelSize: 13
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            anchors.topMargin: 10
                            onClicked: setChairman()
                        }
                    }
                }

                Rectangle {
                    id: rectangle11
                    height: 170
                    color: "#58697e"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: rectangle8.bottom
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                    anchors.topMargin: 20
                    Rectangle {
                        id: rectangle12
                        height: 40
                        color: "#111d2b"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        anchors.topMargin: 10

                        Label {
                            id: label3
                            x: 347
                            y: 19
                            color: "#ffffff"
                            text: qsTr("Information Technology Chairman")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 13
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                        }
                    }

                    Rectangle {
                        id: rectangle13
                        color: "#111d2b"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: rectangle12.bottom
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        anchors.topMargin: 5
                        anchors.bottomMargin: 10

                        CustomTextField {
                            id: itChairman
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            font.pixelSize: 13
                            anchors.leftMargin: 20
                            font.bold: false
                            anchors.rightMargin: 20
                            anchors.topMargin: 10
                            placeholderText: "Information technology chairman school ID"
                        }

                        CustomButton {
                            width: 175
                            height: 35
                            text: "Update IT Chairman"
                            anchors.top: itChairman.bottom
                            font.pixelSize: 13
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            anchors.topMargin: 10
                            onClicked: setChairman()
                        }
                    }
                }
            }
        }
    }

    Shortcut {
        sequence: "Ctrl+S"
        onActivated: setChairman()
    }
    
    Component.onCompleted: {
        SetChairman.get_chairmans()
    }

    Connections {
        target: SetChairman

        function onGet_chairmans_signal(id, position) {
            if (position == "CS") {
                csChairman.text = id
            } else if (position == "EMC") {
                emcChairman.text = id
            } else if (position == "IS") {
                isChairman.text = id
            } else if (position == "IT") {
                itChairman.text = id
            }
        }
    }
}
