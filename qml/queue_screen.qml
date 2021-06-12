import QtQuick 2.15
import QtQuick.Window 2.13
import QtQuick.Controls 2.15
import "ui/admin/components"

Window {
    id: window
    width: 1000
    height: 800
    visible: true
    color: "#00000000"
    title: qsTr("Queue Screen")
    
    flags: Qt.Window | Qt.FramelessWindowHint

    property int windowStatus: 0

    function refresh() {
        cs_model.clear()
        emc_model.clear()
        is_model.clear()
        it_model.clear()
        QueueScreen.get_queues()
    }

    function maximize() {
        if (windowStatus === 0) {
            window.showMaximized()
            windowStatus = 1
            maximizeBtn.btnIconSource = "../img/icon/normal.svg"
            rectangle.radius = 0
        } else {
            window.showNormal()
            windowStatus = 0
            maximizeBtn.btnIconSource = "../img/icon/maximize.svg"
            rectangle.radius = 10
        }
    }

    function ifMaximize() {
        if (windowStatus === 1) {
            window.showNormal()
            windowStatus = 0
            maximizeBtn.btnIconSource = "../img/icon/maximize.svg"
            rectangle.radius = 0
        }
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
        id: rectangle
        color: "#0b131c"
        radius: 10
        anchors.fill: parent
        
        Rectangle {
            id: rectangle1
            x: 823
            width: 70
            height: 35
            color: "#00000000"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.topMargin: 0
            
            TopBarButton {
                id: closeBtn
                anchors.right: parent.right
                anchors.top: parent.top
                btnColorMouseOver: "#ef534f"
                btnColorClicked: "#ef3a36"
                btnColorDefault: "#00000000"
                btnIconSource: "../img/icon/close.svg"
                anchors.topMargin: 0
                anchors.rightMargin: 0
                onClicked: window.close()
            }
            
            TopBarButton {
                id: maximizeBtn
                anchors.right: closeBtn.left
                anchors.top: parent.top
                btnIconSource: "../img/icon/maximize.svg"
                btnColorDefault: "transparent"
                btnColorMouseOver: "#58697E"
                btnColorClicked: "#233A55"
                onClicked: {
                    maximize()
                }
            }
        }
        
        Rectangle {
            id: rectangle20
            width: 200
            height: 35
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: rectangle1.left
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            
            DragHandler {
                onActiveChanged: if (active) {
                                     window.startSystemMove()
                                     ifMaximize()
                                 }
            }
            
            MouseArea {
                anchors.fill: parent
                onDoubleClicked: maximize()
            }
        }
        
        Rectangle {
            id: rectangle2
            width: ((rectangle.width - (5*20)) / 4)
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.top: rectangle14.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            
            Rectangle {
                id: rectangle3
                width: 200
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 10
                
                Label {
                    id: label1
                    x: 77
                    y: 19
                    color: "#ffffff"
                    text: qsTr("Following Queue")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 17
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
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5
                
                ListModel {
                    id: cs_model
                }

                Component {
                    id: cs_delegate

                    Item {
                        width: cs_listView.width
                        height: 50

                        Label {
                            id: cs_queue 
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 25
                            color: "white"
                            text: queue
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }

                ScrollView {
                    anchors.fill: parent
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

                    ListView {
                        id: cs_listView
                        anchors.fill: parent

                        model: cs_model
                        delegate: cs_delegate
                    }
                }
            }
        }
        
        Rectangle {
            id: rectangle5
            width: ((rectangle.width - (5*20)) / 4)
            color: "#58697e"
            radius: 10
            anchors.left: rectangle2.right
            anchors.top: rectangle14.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            Rectangle {
                id: rectangle6
                width: 200
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                
                Label {
                    id: label4
                    x: 89
                    y: 19
                    color: "#ffffff"
                    text: qsTr("Following Queue")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 17
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
                anchors.topMargin: 5
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                
                ListModel {
                    id: emc_model
                }

                Component {
                    id: emc_delegate

                    Item {
                        width: emc_listView.width
                        height: 50

                        Label {
                            id: emc_queue 
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 25
                            color: "white"
                            text: queue
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }

                ScrollView {
                    anchors.fill: parent
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

                    ListView {
                        id: emc_listView
                        anchors.fill: parent

                        model: emc_model
                        delegate: emc_delegate
                    }
                }
            }
        }
        
        Rectangle {
            id: rectangle8
            width: ((rectangle.width - (5*20)) / 4)
            color: "#58697e"
            radius: 10
            anchors.left: rectangle5.right
            anchors.top: rectangle14.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            Rectangle {
                id: rectangle9
                width: 200
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                
                Label {
                    id: label2
                    x: 77
                    y: 14
                    color: "#ffffff"
                    text: qsTr("Following Queue")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 17
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
                anchors.topMargin: 5
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                
                ListModel {
                    id: is_model
                }

                Component {
                    id: is_delegate

                    Item {
                        width: is_listView.width
                        height: 50

                        Label {
                            id: is_queue 
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 25
                            color: "white"
                            text: queue
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }

                ScrollView {
                    anchors.fill: parent
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

                    ListView {
                        id: is_listView
                        anchors.fill: parent

                        model: is_model
                        delegate: is_delegate
                    }
                }
            }
        }
        
        Rectangle {
            id: rectangle11
            width: ((rectangle.width - (5*20)) / 4)
            color: "#58697e"
            radius: 10
            anchors.left: rectangle8.right
            anchors.top: rectangle14.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            Rectangle {
                id: rectangle12
                width: 200
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                
                Label {
                    id: label3
                    x: 98
                    y: 19
                    color: "#ffffff"
                    text: qsTr("Following Queue")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 17
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
                anchors.topMargin: 5
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                
                ListModel {
                    id: it_model
                }

                Component {
                    id: it_delegate

                    Item {
                        width: it_listView.width
                        height: 50

                        Label {
                            id: it_queue 
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 25
                            color: "white"
                            text: queue
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }

                ScrollView {
                    anchors.fill: parent
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

                    ListView {
                        id: it_listView
                        anchors.fill: parent

                        model: it_model
                        delegate: it_delegate
                    }
                }
            }
        }
        
        Rectangle {
            id: rectangle14
            width: 865
            height: 286
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle1.bottom
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20
            
            Rectangle {
                id: rectangle15
                width: 200
                height: 70
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 10
                
                Label {
                    id: label
                    x: 336
                    y: 29
                    color: "#ffffff"
                    text: qsTr("Current Queue")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 17
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
            }
            
            Rectangle {
                id: rectangle16
                width: ((rectangle14.width - 35) / 4)
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.top: rectangle15.bottom
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.topMargin: 5
                anchors.leftMargin: 10
                
                Label {
                    id: cs_current_queue
                    x: 429
                    y: -58
                    color: "#ffffff"
                    text: qsTr("Label")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
            }
            
            Rectangle {
                id: rectangle17
                width: ((rectangle14.width - 35) / 4)
                color: "#111d2b"
                radius: 10
                anchors.left: rectangle16.right
                anchors.top: rectangle15.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: 5
                anchors.bottomMargin: 10
                anchors.topMargin: 5
                
                Label {
                    id: emc_current_queue
                    x: -161
                    y: 78
                    color: "#ffffff"
                    text: qsTr("Label")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
            }
            
            Rectangle {
                id: rectangle18
                width: ((rectangle14.width - 35) / 4)
                color: "#111d2b"
                radius: 10
                anchors.left: rectangle17.right
                anchors.top: rectangle15.bottom
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.leftMargin: 5
                anchors.topMargin: 5
                
                Label {
                    id: is_current_queue
                    x: -161
                    y: 78
                    color: "#ffffff"
                    text: qsTr("Label")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
            }
            
            Rectangle {
                id: rectangle19
                width: ((rectangle14.width - 35) / 4)
                color: "#111d2b"
                radius: 10
                anchors.left: rectangle18.right
                anchors.top: rectangle15.bottom
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.leftMargin: 5
                anchors.topMargin: 5
                
                Label {
                    id: it_current_queue
                    x: -161
                    y: 78
                    color: "#ffffff"
                    text: qsTr("Label")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
            }
        }
    }
    
    Component.onCompleted: {
        timer.startTimer(refresh, 1000)
    }
    
    Connections {
        target: QueueScreen

        function on_set_texts_signal(cs, emc, is, it) {
            cs_current_queue.text = cs
            emc_current_queue.text = emc
            is_current_queue.text = is
            it_current_queue.text = it
        }
        
        function on_cs_signal(queue) {
            cs_model.append({"queue": queue})
        }
        
        function on_emc_signal(queue) {
            emc_model.append({"queue": queue})
        }
        
        function on_is_signal(queue) {
            is_model.append({"queue": queue})
        }
        
        function on_it_signal(queue) {
            it_model.append({"queue": queue})
        }
    }
}
