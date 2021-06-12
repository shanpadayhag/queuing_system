import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"

Item {

    property real listViewWidth: scrollView.width
    property int indexSelected: 0

    function listViewLongestWidth(itemWidth) {
        if (itemWidth > listViewWidth) {
            listViewWidth = itemWidth
        }
    }

    function highlightLength(itemWidth) {
        if (itemWidth > scrollView.width) {
            return itemWidth
        } else {
            return scrollView.width
        }
    }

    function refresh() {
        listModel.clear()
        AdminApplyService.display()
        
        listView.currentIndex = indexSelected
    }

    function open_pop_up(message) {
        var component = Qt.createComponent("../../popup/successful.qml")
        var win = component.createObject()
        win.message = message
        win.show()
    }

    Timer {
        id: timer

        function startTimer(callback, milliseconds) {
            timer.interval = milliseconds;
            timer.repeat = true;
            timer.triggered.connect(callback);
            timer.start();
        }

        function stopTimer(callback) {
            timer.stop();
            timer.triggered.disconnect(callback);
        }
    }

    Rectangle {
        opacity: 0.3
        color: "#000000"
        anchors.fill: parent
    }

    Rectangle {
        id: rectangle
        color: "#58697e"
        radius: 10
        anchors.fill: parent
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.topMargin: 20

        Rectangle {
            id: rectangle1
            color: "#111d2b"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: rectangle2.top
            anchors.bottomMargin: 5
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 10

            ScrollView {
                id: scrollView
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                contentWidth: listViewWidth
                clip: true

                ListModel {
                    id: listModel
                }

                Component {
                    id: delegate
                    
                    Item {
                        width: highlightLength(510 + serviceMessage.width + 10)
                        height: 25

                        Label {
                            id: instructorName
                            verticalAlignment: Text.AlignVCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            height: 25
                            color: "white"
                            text: name
                            font.pixelSize: 13
                        }

                        Label {
                            id: serviceTitle
                            verticalAlignment: Text.AlignVCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 260
                            height: 25
                            color: "white"
                            text: title
                            font.pixelSize: 13
                        }

                        Label {
                            id: serviceMessage
                            verticalAlignment: Text.AlignVCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 510
                            height: 25
                            color: "white"
                            text: message
                            font.pixelSize: 13
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                indexSelected = index
                                listView.currentIndex = indexSelected
                            }
                        }
                        
                        Component.onCompleted: listViewLongestWidth(510 + serviceMessage.width + 30)
                    }
                }

                ListView {
                    id: listView
                    anchors.fill: parent

                    model: listModel
                    delegate: delegate

                    highlight: Rectangle {
                        width: listView.width
                        color: "#233A55"
                        radius: 10
                    }

                    Component.onCompleted: timer.startTimer(refresh, 1000)
                }
            }
        }

        Rectangle {
            id: rectangle2
            y: 199
            height: 80
            color: "#111d2b"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10

            CustomButton {
                id: acceptServiceBtn
                x: 395
                y: 34
                width: 150
                height: 30
                text: "Accept Service"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pixelSize: 13
                onClicked: {
                    AdminApplyService.acceptService(listModel.get(listView.currentIndex).idService)
                    listModel.clear()
                    AdminApplyService.display()
                    open_pop_up("Service accepted")
                }
            }
        }
    }

    Component.onCompleted: AdminApplyService.getCurrentAccount()

    Connections {
        target: AdminApplyService

        function onDisplaySignal(title, message) {
            listModel.append({"name": "", "title": title, "message": message, "idService": 0})
        }

        function onDisplaySignal2(index, name) {
            listModel.setProperty(index, "name", name)
        }

        function onDisplaySignal3(index, id) {
            listModel.setProperty(index, "idService", id)
        }
    }
}
