import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"

Item {

    property real returneeListViewWidth: returneeScrollView.width - 20
    property int indexSelectedReturnee: 0

    function returneeLongestWidth(itemWidth) {
        if (itemWidth > returneeListViewWidth) {
            returneeListViewWidth = itemWidth
        }
    }

    function highlightLength(itemWidth) {
        if (itemWidth > (returneeScrollView.width - 20)) {
            return itemWidth
        } else {
            return (returneeScrollView.width - 20)
        }
    }

    function returneeLiveView() {
        returneeListModel.clear()
        InstructorHome.displayRequests()
        returneeListView.currentIndex = indexSelectedReturnee
    }

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

    Timer {
        id: timer

        function startTimer(callback, milliseconds) {
            timer.interval = milliseconds;
            timer.repeat = false;
            timer.triggered.connect(callback);
            timer.start();
        }

        function stopTimer(callback) {
            timer.stop();
            timer.triggered.disconnect(callback);
        }
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
            width: rectangle13.width + 40

            Rectangle {
                id: rectangle13
                x: 20
                y: 20
                width: 376
                color: "#58697e"
                radius: 10
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: rectangle4.top
                anchors.bottomMargin: 20
                anchors.topMargin: 20
                anchors.leftMargin: 20
                Rectangle {
                    id: rectangle14
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
                        id: label4
                        x: 77
                        y: 19
                        color: "#ffffff"
                        text: qsTr("Key Returnee Request")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 13
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: rectangle15
                    color: "#111d2b"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: rectangle14.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.topMargin: 5
                    anchors.bottomMargin: 10
                    anchors.leftMargin: 10
                    clip: true

                    ScrollView {
                        id: returneeScrollView
                        anchors.fill: parent
                        ScrollBar.horizontal.interactive: true
                        ScrollBar.vertical.interactive: true
                        contentWidth: returneeListViewWidth + 20
                        clip: true

                        ListModel {
                            id: returneeListModel
                        }

                        Component {
                            id: returneeDelegate

                            Item {
                                width: highlightLength(10 + returneeName.width + (200 - returneeName.width) + returneeRoom.width)
                                height: 25

                                Label {
                                    id: returneeName
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    color: "white"
                                    text: name
                                    font.pixelSize: 13
                                    height: 25
                                    verticalAlignment: Text.AlignVCenter
                                }

                                Label {
                                    id: returneeRoom
                                    anchors.left: parent.left
                                    anchors.leftMargin: 200
                                    color: "white"
                                    text: room
                                    font.pixelSize: 13
                                    height: 25
                                    verticalAlignment: Text.AlignVCenter
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        indexSelectedReturnee = index
                                        returneeListView.currentIndex = indexSelectedReturnee
                                    }
                                    onDoubleClicked: {
                                        InstructorHome.keyReturned(returneeListModel.get(index).account_id, returneeRoom.text)
                                        returneeListModel.clear()
                                        InstructorHome.displayRequests()
                                    }
                                }

                                Component.onCompleted: returneeLongestWidth(10 + returneeName.width + (200 - returneeName.width) + returneeRoom.width)
                            }
                        }

                        ListView {
                            id: returneeListView
                            anchors.fill: parent
                            anchors.topMargin: 10
                            anchors.bottomMargin: 10
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10

                            model: returneeListModel
                            delegate: returneeDelegate

                            highlight: Rectangle {
                                width: returneeListView.width
                                color: "#233A55"
                                radius: 10
                            }

                            Component.onCompleted: {
                                timer.startTimer(returneeLiveView, 3000)
                                returneeListModel.clear()
                                InstructorHome.displayRequests()
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle4
                x: 20
                y: 379
                width: 376
                height: 115
                color: "#58697e"
                radius: 10
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
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
                            InstructorHome.returnKey()
                            returneeListModel.clear()
                            InstructorHome.displayRequests()
                            success_pop_up("Request to return key successful")
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: InstructorHome.getCurrentAccount()

    Connections {
        target: InstructorHome

        function onReturnKeySignal(name, room) {
            returneeListModel.append({"name": name, "room": room, "account_id": -1})
        }

        function onReturnKeySignal2(index, account_id) {
            returneeListModel.setProperty(index, "account_id", account_id)
        }
    }
}
