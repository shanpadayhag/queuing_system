import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"

Item {

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: .3
    }

    Rectangle {
        id: rectangle18
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            id: rectangle
            height: 227
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: (((parent.width) / 3) * 2) + 10
            anchors.leftMargin: 20
            anchors.topMargin: 20

            Rectangle {
                id: rectangle1
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
                    id: label
                    x: 93
                    y: 14
                    color: "#ffffff"
                    text: qsTr("FH101")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 13
                }
            }

            Rectangle {
                id: rectangle2
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle1.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5

                Label {
                    id: fh101Availability
                    x: 98
                    color: "#ffffff"
                    text: qsTr("Label")
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 13
                }

                CustomTextField {
                    id: fh101PurposeText
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: fh101Availability.bottom
                    font.pixelSize: 13
                    placeholderText: "Purpose"
                    anchors.topMargin: 15
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                }

                CustomButton {
                    id: fh101ReserveBtn
                    width: 150
                    height: 30
                    text: "Reserve Room"
                    anchors.bottom: parent.bottom
                    font.bold: true
                    font.pixelSize: 13
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 20
                    enabled: false
                    onClicked: {
                        AdminReservation.reserveRoom("FH101", fh101PurposeText.text)
                        AdminReservation.checkAvailability()
                        AdminReservation.checkRecent()
                    }
                }
            }
        }

        Rectangle {
            id: rectangle3
            height: 227
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: ((parent.width) / 3) + 10
            anchors.leftMargin: ((parent.width) / 3) + 10
            anchors.topMargin: 20
            Rectangle {
                id: rectangle4
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.topMargin: 10
                anchors.leftMargin: 10

                Label {
                    id: label1
                    x: 96
                    y: 14
                    color: "#ffffff"
                    text: qsTr("FH201")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 13
                }
            }

            Rectangle {
                id: rectangle5
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle4.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5
                anchors.leftMargin: 10

                Label {
                    id: fh201Availability
                    x: 103
                    color: "#ffffff"
                    text: qsTr("Label")
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 13
                }

                CustomTextField {
                    id: fh201PurposeText
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: fh201Availability.bottom
                    font.pixelSize: 13
                    placeholderText: "Purpose"
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                    anchors.topMargin: 15
                }

                CustomButton {
                    id: fh201ReserveBtn
                    width: 150
                    height: 30
                    text: "Reserve Room"
                    anchors.bottom: parent.bottom
                    font.bold: true
                    font.pixelSize: 13
                    anchors.bottomMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    enabled: false
                    onClicked: {
                        AdminReservation.reserveRoom("FH201", fh201PurposeText.text)
                        AdminReservation.checkAvailability()
                        AdminReservation.checkRecent()
                    }
                }
            }
        }

        Rectangle {
            id: rectangle6
            height: 227
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: (((parent.width) / 3) * 2) + 10
            anchors.rightMargin: 20
            anchors.topMargin: 20
            Rectangle {
                id: rectangle7
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.topMargin: 10
                anchors.leftMargin: 10

                Label {
                    id: label2
                    x: 89
                    y: 14
                    color: "#ffffff"
                    text: qsTr("FH301")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 13
                }
            }

            Rectangle {
                id: rectangle8
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle7.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5
                anchors.leftMargin: 10

                Label {
                    id: fh301Availability
                    x: 106
                    color: "#ffffff"
                    text: qsTr("Label")
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 13
                }

                CustomTextField {
                    id: fh301PurposeText
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: fh301Availability.bottom
                    font.pixelSize: 13
                    placeholderText: "Purpose"
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                    anchors.topMargin: 15
                }

                CustomButton {
                    id: fh301ReserveBtn
                    x: 118
                    y: 75
                    width: 150
                    height: 30
                    text: "Reserve Room"
                    anchors.bottom: parent.bottom
                    font.bold: true
                    font.pixelSize: 13
                    anchors.bottomMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    enabled: false
                    onClicked: {
                        AdminReservation.reserveRoom("FH301", fh301PurposeText.text)
                        AdminReservation.checkAvailability()
                        AdminReservation.checkRecent()
                    }
                }
            }
        }

        Rectangle {
            id: rectangle9
            height: 227
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle.bottom
            anchors.topMargin: 20
            anchors.rightMargin: (((parent.width) / 3) * 2) + 10
            anchors.leftMargin: 20
            Rectangle {
                id: rectangle10
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.topMargin: 10
                anchors.leftMargin: 10

                Label {
                    id: label3
                    x: 71
                    y: 19
                    color: "#ffffff"
                    text: qsTr("FH102")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 13
                }
            }

            Rectangle {
                id: rectangle11
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle10.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5
                anchors.leftMargin: 10

                Label {
                    id: fh102Availability
                    x: 104
                    color: "#ffffff"
                    text: qsTr("Label")
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 20
                    font.pixelSize: 13
                }

                CustomTextField {
                    id: fh102PurposeText
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: fh102Availability.bottom
                    font.pixelSize: 13
                    placeholderText: "Purpose"
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                    anchors.topMargin: 15
                }

                CustomButton {
                    id: fh102ReserveBtn
                    x: 119
                    y: 70
                    width: 150
                    height: 30
                    text: "Reserve Room"
                    anchors.bottom: parent.bottom
                    font.bold: true
                    font.pixelSize: 13
                    anchors.bottomMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    enabled: false
                    onClicked: {
                        AdminReservation.reserveRoom("FH102", fh102PurposeText.text)
                        AdminReservation.checkAvailability()
                        AdminReservation.checkRecent()
                    }
                }
            }
        }

        Rectangle {
            id: rectangle12
            height: 227
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle3.bottom
            anchors.topMargin: 20
            anchors.rightMargin: ((parent.width) / 3) + 10
            anchors.leftMargin: ((parent.width) / 3) + 10
            Rectangle {
                id: rectangle13
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.topMargin: 10
                anchors.leftMargin: 10

                Label {
                    id: label4
                    x: 87
                    y: 8
                    color: "#ffffff"
                    text: qsTr("FH202")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 13
                }
            }

            Rectangle {
                id: rectangle14
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle13.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5
                anchors.leftMargin: 10

                Label {
                    id: fh202Availability
                    x: 110
                    color: "#ffffff"
                    text: qsTr("Label")
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 20
                    font.pixelSize: 13
                }

                CustomTextField {
                    id: fh202PurposeText
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: fh202Availability.bottom
                    font.pixelSize: 13
                    placeholderText: "Purpose"
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                    anchors.topMargin: 15
                }

                CustomButton {
                    id: fh202ReserveBtn
                    x: 108
                    y: 75
                    width: 150
                    height: 30
                    text: "Reserve Room"
                    anchors.bottom: parent.bottom
                    font.bold: true
                    font.pixelSize: 13
                    anchors.bottomMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    enabled: false
                    onClicked: {
                        AdminReservation.reserveRoom("FH202", fh202PurposeText.text)
                        AdminReservation.checkAvailability()
                        AdminReservation.checkRecent()
                    }
                }
            }
        }

        Rectangle {
            id: rectangle15
            height: 227
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle6.bottom
            anchors.topMargin: 20
            anchors.leftMargin: (((parent.width) / 3) * 2) + 10
            anchors.rightMargin: 20
            Rectangle {
                id: rectangle16
                height: 40
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.topMargin: 10
                anchors.leftMargin: 10

                Label {
                    id: label5
                    x: 87
                    y: 19
                    color: "#ffffff"
                    text: qsTr("FH302")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 13
                }
            }

            Rectangle {
                id: rectangle17
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle16.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5
                anchors.leftMargin: 10

                Label {
                    id: fh302Availability
                    x: 110
                    color: "#ffffff"
                    text: qsTr("Label")
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 20
                    font.pixelSize: 13
                }

                CustomTextField {
                    id: fh302PurposeText
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: fh302Availability.bottom
                    font.pixelSize: 13
                    placeholderText: "Purpose"
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                    anchors.topMargin: 15
                }

                CustomButton {
                    id: fh302ReserveBtn
                    x: 117
                    y: 70
                    width: 150
                    height: 30
                    text: "Reserve Room"
                    anchors.bottom: parent.bottom
                    font.bold: true
                    font.pixelSize: 13
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 20
                    enabled: false
                    onClicked: {
                        AdminReservation.reserveRoom("FH302", fh302PurposeText.text)
                        AdminReservation.checkAvailability()
                        AdminReservation.checkRecent()
                    }
                }
            }
        }

        Component.onCompleted: {
            AdminReservation.checkAvailability()
            AdminReservation.getCurrentAccount()
            AdminReservation.checkRecent()
        }

        Connections {
            target: AdminReservation
            
            function onAvailableSignal(name, status) {
                if (name === "FH101") {
                    if (status === 1) {
                        fh101Availability.text = "Available"
                        fh101Availability.color = "#30BD44"
                        fh101ReserveBtn.enabled = true
                    } else {
                        fh101Availability.text = "Unavailable"
                        fh101Availability.color = "#EF534F"
                        fh101ReserveBtn.enabled = false
                    }
                }
                
                if (name === "FH102") {
                    if (status === 1) {
                        fh102Availability.text = "Available"
                        fh102Availability.color = "#30BD44"
                        fh102ReserveBtn.enabled = true
                    } else {
                        fh102Availability.text = "Unavailable"
                        fh102Availability.color = "#EF534F"
                        fh102ReserveBtn.enabled = false
                    }
                }
                
                if (name === "FH201") {
                    if (status === 1) {
                        fh201Availability.text = "Available"
                        fh201Availability.color = "#30BD44"
                        fh201ReserveBtn.enabled = true
                    } else {
                        fh201Availability.text = "Unavailable"
                        fh201Availability.color = "#EF534F"
                        fh201ReserveBtn.enabled = false
                    }
                }
                
                if (name === "FH202") {
                    if (status === 1) {
                        fh202Availability.text = "Available"
                        fh202Availability.color = "#30BD44"
                        fh202ReserveBtn.enabled = true
                    } else {
                        fh202Availability.text = "Unavailable"
                        fh202Availability.color = "#EF534F"
                        fh202ReserveBtn.enabled = false
                    }
                }
                
                if (name === "FH301") {
                    if (status === 1) {
                        fh301Availability.text = "Available"
                        fh301Availability.color = "#30BD44"
                        fh301ReserveBtn.enabled = true
                    } else {
                        fh301Availability.text = "Unavailable"
                        fh301Availability.color = "#EF534F"
                        fh301ReserveBtn.enabled = false
                    }
                }
                
                if (name === "FH302") {
                    if (status === 1) {
                        fh302Availability.text = "Available"
                        fh302Availability.color = "#30BD44"
                        fh302ReserveBtn.enabled = true
                    } else {
                        fh302Availability.text = "Unavailable"
                        fh302Availability.color = "#EF534F"
                        fh302ReserveBtn.enabled = false
                    }
                }
            }

            function onCheckRecentSignal() {
                fh101ReserveBtn.enabled = false
                fh102ReserveBtn.enabled = false
                fh201ReserveBtn.enabled = false
                fh202ReserveBtn.enabled = false
                fh301ReserveBtn.enabled = false
                fh302ReserveBtn.enabled = false
            }
        }
    }
}
