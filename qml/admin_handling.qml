import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "ui/login/components"

Window {
    id: window
    width: 1000
    height: 650
    visible: true
    color: "#00000000"

    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle {
        id: rectangle
        color: "#0b131c"
        radius: 10
        anchors.fill: parent
        clip: true

        Rectangle {
            id: rectangle9
            width: closeBtn.width + minimizeBtn.width
            height: closeBtn.height
            color: "#00000000"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.rightMargin: 0

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

            TopBarButton {
                id: minimizeBtn
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.right: closeBtn.left
                btnIconSource: "../img/icon/minimize.svg"
                btnColorDefault: "transparent"
                btnColorMouseOver: "#58697E"
                btnColorClicked: "#233A55"
                onClicked: {
                    window.showMinimized()
                }
            }
        }

        Rectangle {
            id: rectangle1
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle10.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 10
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            anchors.rightMargin: 20

            Rectangle {
                id: rectangle3
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.leftMargin: (rectangle1.width / 2) + 2
                anchors.topMargin: 10

                Label {
                    id: label
                    x: 287
                    y: 19
                    color: "#ffffff"
                    text: qsTr("Admin")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 13
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    styleColor: "#ffffff"
                }
            }

            Rectangle {
                id: rectangle4
                x: 123
                width: 200
                color: "#111d2b"
                radius: 10
                anchors.right: parent.right
                anchors.top: rectangle3.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin:  (rectangle1.width / 2) + 2
                anchors.topMargin: 5
                anchors.bottomMargin: 10
                anchors.rightMargin: 10
                anchors.left: parent.left

                ScrollView {
                    anchors.fill: parent

                    ListModel {
                        id: adminListModel
                    }

                    Component {
                        id: adminDelegate

                        Item {
                            width: adminListView.width
                            height: 25
                            
                            Label {
                                id: adminName
                                anchors.left: parent.left
                                anchors.leftMargin: 10
                                color: "white"
                                text: nameAdmn
                                font.pixelSize: 13
                                verticalAlignment: Text.AlignVCenter
                                height: 25
                            }
                            
                            Label {
                                id: adminId
                                anchors.left: parent.left
                                anchors.leftMargin: 200
                                color: "white"
                                text: idAdmn
                                font.pixelSize: 13
                                verticalAlignment: Text.AlignVCenter
                                height: 25
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    adminListView.currentIndex = index
                                }
                                onDoubleClicked: {
                                    AdminHandling.makeInstructor(idAdmn)
                                    instructorListModel.clear()
                                    adminListModel.clear()
                                    AdminHandling.getInstructors()
                                    AdminHandling.getAdmins()
                                }
                            }
                        }
                    }

                    ListView {
                        id: adminListView
                        anchors.fill: parent
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 10
                        anchors.topMargin: 10

                        model: adminListModel
                        delegate: adminDelegate

                        highlight: Rectangle {
                            width: adminListView.width
                            color: "#233A55"
                            radius: 10
                        }

                        Component.onCompleted: {
                            AdminHandling.getAdmins()
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle5
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: (rectangle1.width / 2) + 3
                anchors.top: rectangle3.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 5
                anchors.bottomMargin: 10
                anchors.leftMargin: 10

                ScrollView {
                    anchors.fill: parent

                    ListModel {
                        id: instructorListModel
                    }

                    Component {
                        id: instructorDelegate

                        Item {
                            width: instructorListView.width
                            height: 25
                            
                            Label {
                                id: instructorName
                                anchors.left: parent.left
                                anchors.leftMargin: 10
                                color: "white"
                                text: nameIns
                                font.pixelSize: 13
                                verticalAlignment: Text.AlignVCenter
                                height: 25
                            }
                            
                            Label {
                                id: instructorId
                                anchors.left: parent.left
                                anchors.leftMargin: 200
                                color: "white"
                                text: idIns
                                font.pixelSize: 13
                                verticalAlignment: Text.AlignVCenter
                                height: 25
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: instructorListView.currentIndex = index
                                onDoubleClicked: {
                                    AdminHandling.makeAdmin(idIns)
                                    instructorListModel.clear()
                                    adminListModel.clear()
                                    AdminHandling.getInstructors()
                                    AdminHandling.getAdmins()
                                }
                            }
                        }
                    }

                    ListView {
                        id: instructorListView
                        anchors.fill: parent
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 10
                        anchors.topMargin: 10

                        model: instructorListModel
                        delegate: instructorDelegate

                        highlight: Rectangle {
                            width: instructorListView.width
                            color: "#233A55"
                            radius: 10
                        }

                        Component.onCompleted: {
                            instructorListModel.clear()
                            AdminHandling.getInstructors()
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle8
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: (rectangle1.width / 2) + 3
                anchors.leftMargin: 10
                anchors.topMargin: 10

                Label {
                    id: label2
                    x: 119
                    y: 14
                    color: "#ffffff"
                    text: qsTr("Instructors")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 13
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        Rectangle {
            id: rectangle10
            width: 200
            height: closeBtn.height
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: rectangle9.left
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            DragHandler {
                onActiveChanged: if (active) {
                    window.startSystemMove()
                }
            }
        }
    }

    Connections {
        target: AdminHandling

        function onGetInstructorSignal(name, id) {
            instructorListModel.append({"nameIns": name, "idIns": id})
        }

        function onGetAdminSignal(name, id) {
            adminListModel.append({"nameAdmn": name, "idAdmn": id})
        }
    }
}
