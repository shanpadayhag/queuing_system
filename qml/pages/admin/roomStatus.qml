import QtQuick 2.0
import QtQuick.Controls 2.15
import "controls"

Item {
    id: item1

    property string roomNumber: ''

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

    function disablingBtns() {
        roomOne.enabled = false
        roomTwo.enabled = false
        roomThree.enabled = false
        roomFour.enabled = false
        roomFive.enabled = false
        roomSix.enabled = false
    }

    Rectangle {
        id: roomButtons
        color: "#1a1724"
        radius: 10
        anchors.fill: parent
        clip: true

        CustomButton {
            id: roomOne
            text: "FH101"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.rightMargin: (parent.width*2)/3
            anchors.bottomMargin: parent.height/2
            anchors.topMargin: 0
            anchors.leftMargin: 0
            onClicked: {
                if (roomNumber === '') {
                    animationMenu.running = true
                }
                roomNumber = 'FH101'
                roomText.text = roomNumber
                Room.checkAvailability(roomText.text)
                disablingBtns()
            }
        }

        CustomButton {
            id: roomTwo
            text: "FH102"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.rightMargin: parent.width/3
            anchors.leftMargin: parent.width/3
            anchors.bottomMargin: parent.height/2
            anchors.topMargin: 0
            onClicked: {
                if (roomNumber === '') {
                    animationMenu.running = true
                }
                roomNumber = 'FH102'
                roomText.text = roomNumber
                Room.checkAvailability(roomText.text)
                disablingBtns()
            }
        }

        CustomButton {
            id: roomThree
            text: "FH103"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.leftMargin: (parent.width*2)/3
            anchors.bottomMargin: parent.height/2
            anchors.topMargin: 0
            anchors.rightMargin: 0
            onClicked: {
                if (roomNumber === '') {
                    animationMenu.running = true
                }
                roomNumber = 'FH103'
                roomText.text = roomNumber
                Room.checkAvailability(roomText.text)
                disablingBtns()
            }
        }

        CustomButton {
            id: roomFour
            text: "FH201"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.topMargin: parent.height/2
            anchors.rightMargin: (parent.width*2)/3
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            onClicked: {
                if (roomNumber === '') {
                    animationMenu.running = true
                }
                roomNumber = 'FH201'
                roomText.text = roomNumber
                Room.checkAvailability(roomText.text)
                disablingBtns()
            }
        }

        CustomButton {
            id: roomFive
            text: "FH202"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.topMargin: parent.height/2
            anchors.rightMargin: parent.width/3
            anchors.leftMargin: parent.width/3
            anchors.bottomMargin: 0
            onClicked: {
                if (roomNumber === '') {
                    animationMenu.running = true
                }
                roomNumber = 'FH202'
                roomText.text = roomNumber
                Room.checkAvailability(roomText.text)
                disablingBtns()
            }
        }

        CustomButton {
            id: roomSix
            text: "FH203"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.bold: true
            colorPressed: "#b3202056"
            colorMouseOver: "#1a1a40"
            colorDefault: "#00000000"
            font.pointSize: 15
            anchors.topMargin: parent.height/2
            anchors.leftMargin: (parent.width*2)/3
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            onClicked: {
                if (roomNumber === '') {
                    animationMenu.running = true
                }
                roomNumber = 'FH203'
                roomText.text = roomNumber
                Room.checkAvailability(roomText.text)
                disablingBtns()
            }
        }

        Rectangle {
            id: information
            x: 1609
            y: 302
            width: 10
            height: 260
            color: "#66646d"
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: -10
            clip: true

            PropertyAnimation {
                id: animationMenu
                target: information
                property: "width"
                to: if (information.width === 10) return 370; else return 10
                duration: 1000
                easing.type: Easing.OutQuint
            }

            CustomButton {
                id: backBtn
                width: 113
                height: 58
                text: "Back >"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.topMargin: 0
                colorPressed: "#00000000"
                colorMouseOver: "#00000000"
                colorDefault: "#00000000"
                font.bold: true
                font.pointSize: 12
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        roomNumber = ''
                        animationMenu.running = true

                        timer.startTimer(function ablingBtns() {
                                roomOne.enabled = true
                                roomTwo.enabled = true
                                roomThree.enabled = true
                                roomFour.enabled = true
                                roomFive.enabled = true
                                roomSix.enabled = true
                            }, 1000)
                        timer.stopTimer(ablingBtns)
                    }
                }
            }

            Label {
                id: statusLabel
                width: 57
                height: 23
                color: "#ffffff"
                text: qsTr("Status:")
                anchors.left: parent.left
                anchors.top: roomLabel.bottom
                font.bold: true
                anchors.leftMargin: 30
                anchors.topMargin: 20
                font.pointSize: 12
            }

            Label {
                id: statusText
                width: 66
                height: 23
                text: qsTr("Available")
                anchors.verticalCenter: statusLabel.verticalCenter
                anchors.left: statusLabel.right
                anchors.leftMargin: 20
                font.pointSize: 12
            }

            CustomTextField {
                id: purposeText
                x: 31
                anchors.top: statusLabel.bottom
                anchors.topMargin: 20
                font.pointSize: 12
                placeholderText: "Purpose"
            }

            CustomButton {
                id: reserveBtn
                x: 134
                width: 94
                height: 33
                text: "Reserve"
                anchors.top: purposeText.bottom
                anchors.topMargin: 20
                font.bold: true
                font.pointSize: 12
                onClicked: {
                    Room.borrow(roomText.text, purposeText.text)
                    animationMenu.running = true
                    roomNumber = ''

                    timer.startTimer(function ablingBtns() {
                            roomOne.enabled = true
                            roomTwo.enabled = true
                            roomThree.enabled = true
                            roomFour.enabled = true
                            roomFive.enabled = true
                            roomSix.enabled = true
                        }, 1000)
                    timer.stopTimer(ablingBtns)
                }
            }


            Label {
                id: roomLabel
                color: "#ffffff"
                text: qsTr("Room:")
                anchors.left: parent.left
                anchors.right: statusLabel.right
                anchors.top: parent.top
                anchors.leftMargin: 34
                anchors.topMargin: 65
                anchors.rightMargin: 0
                font.bold: true
                font.pointSize: 12
            }

            Label {
                id: roomText
                y: 49
                color: "#ffffff"
                text: qsTr("Room Number")
                anchors.verticalCenter: roomLabel.verticalCenter
                anchors.left: roomLabel.right
                anchors.leftMargin: 20
                font.bold: false
                font.pointSize: 12
            }
        }
    }
    Connections {
        target: Room
        function onCheckAvailabilitySignal(x) {
            if (x === 0) {
                reserveBtn.enabled = false
            } else {
                reserveBtn.enabled = true
            }
        }
    }
}





/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.33;height:864;width:1609}
}
##^##*/
