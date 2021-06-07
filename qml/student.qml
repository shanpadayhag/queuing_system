import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

import "components"
import "controls"

Window {
    id: studentUI
    width: 1400
    height: 800
    minimumWidth: 800
    minimumHeight: 500
    visible: true
    color: "#00000000"
    title: qsTr("")

    flags: Qt.Window | Qt.FramelessWindowHint

    property int windowStatus: 0
    property int windowMargin: 10

    QtObject {
        id: internal
        function maximizeRestore() {
            if (windowStatus == 0) {
                studentUI.showMaximized()
                windowStatus = 1
                windowMargin = 0
                maximize.btnIconSource = "../imgs/svg_images/restore_icon.svg"
            } else {
                studentUI.showNormal()
                windowStatus = 0
                windowMargin = 10
                maximize.btnIconSource = "../imgs/svg_images/maximize_icon.svg"
            }
        }
        function ifMaximizedWindowRestore() {
            if(windowStatus == 1) {
                studentUI.showNormal()
                windowStatus = 0
                windowMargin = 10
                maximize.btnIconSource = "../imgs/svg_images/maximize_icon.svg"
            }
        }
        function ifMinimizedWindowRestore() {
            windowStatus = 0
            windowMargin = 10
            maximize.btnIconSource = "../imgs/svg_images/maximize_icon.svg"
        }
    }

    Rectangle {
        id: background
        color: "#404142"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z: 1

        Rectangle {
            id: container
            color: "#1e1e1e"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#37373d"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleBtn {
                    id: asdf
                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: toggleBarDescriptioin
                    y: 30
                    height: 25
                    color: "#2f2f2f"
                    anchors.left: asdf.right
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0

                    Label {
                        id: topInfoLabel
                        color: "#576a82"
                        text: qsTr("Welcome Student")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.rightMargin: 300
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.leftMargin: 20
                    }

                    Label {
                        id: rightLabel
                        color: "#576a82"
                        text: qsTr("| HOME")
                        anchors.left: topInfoLabel.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        anchors.rightMargin: 10
                        font.pointSize: 10
                    }
                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.left: asdf.right
                    anchors.right: row.left
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    DragHandler {
                        onActiveChanged: if (active) {
                                             studentUI.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: appIcon
                        width: 28
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../imgs/favicon.png"
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: titleLabel
                        color: "#c3cbdd"
                        text: qsTr("Student")
                        anchors.left: appIcon.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.leftMargin: 10
                    }
                }

                Row {
                    id: row
                    x: 1178
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.rightMargin: 0

                    TopBarButton {
                        id: minimize
                        onClicked: {
                            studentUI.showMinimized()
                            internal.ifMinimizedWindowRestore()
                        }
                    }

                    TopBarButton {
                        id: maximize
                        btnIconSource: "../imgs/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: close
                        btnColorMouseOver: "#e81123"
                        btnColorClicked: "#f1707a"
                        btnIconSource: "../imgs/svg_images/close_icon.svg"
                        onClicked: studentUI.close()
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#252526"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    PropertyAnimation {
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if (leftMenu.width == 70) return 250; else return 70
                        duration: 1000
                        easing.type: Easing.OutBounce
                    }

                    Column {
                        id: column
                        width: 200
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0

                        LeftMenuBtn {
                            id: btnHome
                            width: leftMenu.width
                            text: qsTr("Home")
                            isActiveMenu: true
                        }

                        LeftMenuBtn {
                            id: btnHome1
                            width: leftMenu.width
                            text: qsTr("Home")
                            btnIconSource: "../imgs/svg_images/open_icon.svg"
                            isActiveMenu: false
                        }

                        LeftMenuBtn {
                            id: btnHome2
                            width: leftMenu.width
                            text: qsTr("Home")
                            btnIconSource: "../imgs/svg_images/save_icon.svg"
                        }
                    }

                    LeftMenuBtn {
                        id: btnHome3
                        x: 0
                        y: 180
                        width: leftMenu.width
                        text: qsTr("Log out")
                        anchors.bottom: parent.bottom
                        btnIconSource: "../imgs/log-out.svg"
                        anchors.bottomMargin: 25
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#1e1e1e"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0
                }

                Rectangle {
                    id: bottomBar
                    y: 510
                    height: 25
                    color: "#2f2f2f"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0

                    Label {
                        id: bottomInfoLabel
                        color: "#576a82"
                        text: qsTr("Welcome Student")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 20
                        anchors.rightMargin: 30
                        font.pointSize: 10
                    }

                    MouseArea {
                        id: mouseAreaCorner
                        x: 1283
                        y: 0
                        width: 17
                        height: 17
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 4
                        anchors.bottomMargin: 4
                        cursorShape: Qt.SizeFDiagCursor

                        Image {
                            id: image
                            anchors.fill: parent
                            source: "../imgs/svg_images/resize_icon.svg"
                            fillMode: Image.PreserveAspectFit
                            antialiasing: false
                        }

                        DragHandler {
                            target: null
                            onActiveChanged: if (active) {studentUI.startSystemResize(Qt.RightEdge | Qt.BottomEdge)}
                        }

                    }
                }
            }
        }
    }

    DropShadow {
        anchors.fill: background
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#000000"
        source: background
        z: 0
    }

    MouseArea {
        id: mouseAreaLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {studentUI.startSystemResize(Qt.LeftEdge)}
        }
    }

    MouseArea {
        id: mouseAreaRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {studentUI.startSystemResize(Qt.RightEdge)}
        }
    }

    MouseArea {
        id: mouseAreaBottom
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {studentUI.startSystemResize(Qt.BottomEdge)}
        }
    }

    MouseArea {
        id: mouseAreaTop
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) {studentUI.startSystemResize(Qt.TopEdge)}
        }
    }
}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
