import QtQuick 2.0
import QtQuick.Controls 2.15
import "controls"

Item {

    property int theIndex: 0
    property string dateSelected: ''
    property string nameSelected: ''
    property string timeSelected: ''

    function checkAvailability (stats) {
        if (stats === 0) {
            iStatusText.text = 'Unavailable'
            iStatusText.color = 'red'
        } else if (stats === 1) {
            iStatusText.text = 'Available'
            iStatusText.color = '#14eb2e'
        }else {
            iStatusText.text = 'Error 404'
            iStatusText.color = '#ffff00'
        }
    }
    Rectangle {
        id: rectangle
        color: "#13141f"
        radius: 10
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            width: 296
            color: "#0e0b19"
            radius: 10
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            anchors.topMargin: 20

            Rectangle {
                id: rectangle5
                height: 45
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10
                Label {
                    id: label1
                    color: "#ffffff"
                    text: qsTr("Instructors")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 12
                    font.bold: true
                }
                anchors.leftMargin: 10
                anchors.rightMargin: 10
            }

            Rectangle {
                id: listRectangle
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle5.bottom
                anchors.bottom: parent.bottom
                clip: true
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5

                ScrollView {
                    anchors.fill: parent
                    clip: true

                    ListModel {
                        id: modelName
                    }

                    Component {
                        id: delegateName
                        Item {
                            width: listViewName.width
                            height: 30
                            Text {
                                id: namename
                                height: 30
                                color: "#ffffff"
                                text: instructorName
                                anchors.left: parent.left
                                verticalAlignment: Text.AlignVCenter
                                font.pointSize: 12
                                anchors.leftMargin: 10
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    listViewName.currentIndex = index
                                    iNameText.text = namename.text
                                    checkAvailability(availability)
                                    Appointment.courseTaken(theID)
                                    nameSelected = namename.text
                                }
                            }
                        }
                    }

                    ListView {
                        id: listViewName
                        anchors.fill: parent
                        anchors.rightMargin: 20
                        anchors.leftMargin: 20
                        anchors.bottomMargin: 20
                        anchors.topMargin: 20

                        model: modelName
                        delegate: delegateName

                        highlight: Rectangle {
                            width: listViewName.width-20
                            color: '#313131'
                            radius: 10
                        }
                    }
                }
            }

        }

        Rectangle {
            id: rectangle10
            color: "#00000000"
            anchors.left: rectangle1.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.rightMargin: 0

            ScrollView {
                id: scrollView1
                anchors.fill: parent
                clip: true
                contentHeight: content.height

                Rectangle {
                    id: content
                    y: 20
                    height: 1686
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.rightMargin: 0

                    Rectangle {
                        id: rectangle2
                        x: -316
                        y: 0
                        height: 646
                        color: "#0e0b19"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.leftMargin: 20
                        anchors.topMargin: 20
                        anchors.rightMargin: 20

                        Rectangle {
                            id: rectangle3
                            x: -10
                            y: -10
                            height: 45
                            color: "#1a1724"
                            radius: 10
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.topMargin: 10
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10

                            Label {
                                id: label
                                height: 40
                                color: "#ffffff"
                                text: qsTr("Status")
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.pointSize: 12
                                font.bold: true
                            }

                        }

                        Rectangle {
                            id: rectangle6
                            x: 20
                            color: "#1a1724"
                            radius: 10
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: rectangle3.bottom
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 10
                            anchors.topMargin: 5

                            Image {
                                id: image
                                x: 173
                                width: 200
                                height: 200
                                anchors.top: parent.top
                                source: "../../../imgs/favicon.png"
                                fillMode: Image.PreserveAspectFit
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.topMargin: 25
                            }

                            Label {
                                id: iStatusLabel
                                color: "#ffffff"
                                text: qsTr("Current Status: ")
                                anchors.left: parent.left
                                anchors.top: image.bottom
                                font.bold: true
                                anchors.topMargin: 25
                                font.pointSize: 12
                                anchors.leftMargin: 75
                            }

                            Label {
                                id: iNameLabel
                                color: "#ffffff"
                                text: qsTr("Name:")
                                anchors.left: parent.left
                                anchors.top: iStatusLabel.bottom
                                font.bold: true
                                anchors.topMargin: 25
                                font.pointSize: 12
                                anchors.leftMargin: 75
                            }

                            Label {
                                id: iProgramsOfferedLabel
                                color: "#ffffff"
                                text: qsTr("Course he/she handles: ")
                                anchors.left: parent.left
                                anchors.top: iNameLabel.bottom
                                font.bold: true
                                anchors.topMargin: 25
                                font.pointSize: 12
                                anchors.leftMargin: 75
                            }

                            Label {
                                id: iStatusText
                                y: 256
                                color: "#ffffff"
                                text: qsTr("Available")
                                anchors.verticalCenter: iStatusLabel.verticalCenter
                                anchors.left: iStatusLabel.right
                                anchors.leftMargin: 20
                                font.pointSize: 12
                            }

                            Label {
                                id: iNameText
                                y: 300
                                color: "#ffffff"
                                text: qsTr("Instructor Name")
                                anchors.verticalCenter: iNameLabel.verticalCenter
                                anchors.left: iNameLabel.right
                                anchors.leftMargin: 20
                                font.pointSize: 12
                            }

                            Rectangle {
                                id: rectangle9
                                color: "#00000000"
                                radius: 10
                                border.color: "#ffffff"
                                anchors.left: iProgramsOfferedLabel.right
                                anchors.right: parent.right
                                anchors.top: iProgramsOfferedLabel.top
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 38
                                anchors.rightMargin: 50
                                anchors.leftMargin: 20
                                anchors.topMargin: 0

                                ScrollView {
                                    anchors.fill: parent

                                    ListModel {
                                        id: coursesModel
                                    }

                                    Component {
                                        id: coursesDelegate

                                        Item {
                                            width: courseListView.width
                                            height: 30

                                            Label {
                                                id: courseNameID
                                                text: courseName
                                                anchors.verticalCenter: parent.verticalCenter
                                                anchors.left: parent.left
                                                anchors.leftMargin: 10
                                                anchors.right: parent.right
                                                anchors.rightMargin: 10
                                                color: '#ffffff'
                                                font.pointSize: 12
                                            }
                                        }
                                    }

                                    ListView {
                                        id: courseListView
                                        anchors.fill: parent
                                        anchors.rightMargin: 10
                                        anchors.leftMargin: 10
                                        anchors.bottomMargin: 10
                                        anchors.topMargin: 10
                                        clip: true

                                        model: coursesModel
                                        delegate: coursesDelegate
                                    }
                                }
                            }
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                        }
                    }

                    Rectangle {
                        id: rectangle7
                        x: -316
                        y: 666
                        height: 977
                        color: "#0e0b19"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: rectangle2.bottom
                        anchors.rightMargin: 20
                        anchors.leftMargin: 20
                        anchors.topMargin: 20

                        Rectangle {
                            id: rectangle8
                            height: 40
                            color: "#1a1724"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.rightMargin: 10
                            anchors.leftMargin: 10
                            anchors.topMargin: 10

                            Label {
                                id: label3
                                x: 436
                                y: 14
                                color: "#ffffff"
                                text: qsTr("Appointment Reservation")
                                anchors.verticalCenter: parent.verticalCenter
                                font.bold: true
                                font.pointSize: 12
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }

                        Rectangle {
                            id: rectangle4
                            visible: true
                            color: "#1a1724"
                            radius: 10
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: rectangle8.bottom
                            anchors.bottom: parent.bottom
                            clip: true
                            anchors.bottomMargin: 10
                            anchors.topMargin: 10
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                            CalendarWidget {
                                id: calendarWidget
                                height: 437
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: parent.top
                                anchors.topMargin: 50
                                anchors.leftMargin: 50
                                anchors.rightMargin: 50
                                anchors.verticalCenterOffset: 140
                                calendar.onSelectedDateChanged:{
                                    const indexDay = calendar.selectedDate.getDay();
                                    const day = calendar.selectedDate.getDate();
                                    const indexMonth = calendar.selectedDate.getMonth();
                                    const year = calendar.selectedDate.getFullYear();
                                    dateSelected = (indexDay+','+day+','+indexMonth+','+year)
                                }
                            }

                            CustomButton {
                                id: customButton
                                x: 650
                                width: 250
                                height: 50
                                text: "Reserve an Appointment"
                                anchors.top: customTimer.bottom
                                font.bold: true
                                anchors.topMargin: 25
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pointSize: 12
                                onClicked: {
                                    dateText.text = dateSelected
                                    timeText.text = timeSelected
                                    appointmentNameText.text = nameSelected
                                    console.log(customTimer.theHour, customTimer.theMinute)
                                }
                            }

                            CustomTimer {
                                id: customTimer
                                x: 508
                                anchors.top: calendarWidget.bottom
                                anchors.topMargin: 25
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Rectangle {
                                id: rectangle11
                                x: 1049
                                y: 522
                                width: 10
                                height: 515
                                color: "#80807d"
                                radius: 10
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                clip: true
                                anchors.rightMargin: -10

                                Label {
                                    id: label2
                                    color: "#ffffff"
                                    text: qsTr("Back >")
                                    anchors.left: parent.left
                                    anchors.top: parent.top
                                    anchors.leftMargin: 25
                                    anchors.topMargin: 25
                                    font.bold: true
                                    font.pointSize: 12
                                }


                                Label {
                                    id: label4
                                    x: 68
                                    color: "#ffffff"
                                    text: qsTr("Date:")
                                    anchors.right: label5.right
                                    anchors.top: parent.top
                                    anchors.rightMargin: 0
                                    anchors.topMargin: 75
                                    font.bold: true
                                    font.pointSize: 12
                                }


                                Label {
                                    id: label7
                                    color: "#ffffff"
                                    text: qsTr("Time:")
                                    anchors.right: label5.right
                                    anchors.top: label4.bottom
                                    font.bold: true
                                    font.pointSize: 12
                                    anchors.rightMargin: 0
                                    anchors.topMargin: 25
                                }

                                Label {
                                    id: label5
                                    color: "#ffffff"
                                    text: qsTr("Instructor Name:")
                                    anchors.left: parent.left
                                    anchors.top: label7.bottom
                                    anchors.topMargin: 25
                                    anchors.leftMargin: 25
                                    font.bold: true
                                    font.pointSize: 12
                                }

                                Label {
                                    id: label6
                                    x: 73
                                    color: "#ffffff"
                                    text: qsTr("Concern:")
                                    anchors.right: label5.right
                                    anchors.top: label5.bottom
                                    anchors.rightMargin: 0
                                    anchors.topMargin: 25
                                    font.bold: true
                                    font.pointSize: 12
                                }

                                Rectangle {
                                    id: rectangle12
                                    height: 200
                                    color: "#2a2a29"
                                    radius: 10
                                    anchors.left: label6.right
                                    anchors.right: parent.right
                                    anchors.top: label6.top
                                    clip: true
                                    anchors.rightMargin: 25
                                    anchors.leftMargin: 25
                                    anchors.topMargin: 0

                                    TextArea {
                                        id: textArea
                                        anchors.fill: parent
                                        wrapMode: Text.Wrap
                                        placeholderTextColor: "#80807d"
                                        font.bold: true
                                        font.pointSize: 12
                                        placeholderText: qsTr("Aa")
                                    }
                                }

                                Label {
                                    id: dateText
                                    y: 100
                                    color: "#ffffff"
                                    text: qsTr("Date")
                                    anchors.verticalCenter: label4.verticalCenter
                                    anchors.left: label4.right
                                    anchors.leftMargin: 20
                                    font.pointSize: 12
                                }

                                Label {
                                    id: timeText
                                    color: "#ffffff"
                                    text: qsTr("Label")
                                    anchors.verticalCenter: label7.verticalCenter
                                    anchors.left: label7.right
                                    font.pointSize: 12
                                    anchors.leftMargin: 20
                                }

                                Label {
                                    id: appointmentNameText
                                    y: 150
                                    color: "#ffffff"
                                    text: qsTr("Label")
                                    anchors.verticalCenter: label5.verticalCenter
                                    anchors.left: label5.right
                                    anchors.leftMargin: 20
                                    anchors.verticalCenterOffset: 0
                                    font.pointSize: 12
                                }

                                CustomButton {
                                    id: customButton1
                                    x: 231
                                    width: 175
                                    height: 40
                                    text: "Confirm"
                                    anchors.top: rectangle12.bottom
                                    anchors.topMargin: 25
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.bold: true
                                    font.pointSize: 12
                                }


                            }

                        }

                    }


                }

            }
        }

    }
    Connections {
        target: Appointment
        function onCallTheFunctionSignal(iname, istatus, aID) {
            modelName.append({'instructorName': iname, 'availability': istatus, 'theID': aID})
        }
        function onClearTheModelSignal(){
            modelName.clear()
            coursesModel.clear()
        }
        function onGiveAdmin(adminName, adminStatus, aID) {
            modelName.append({'instructorName': adminName, 'availability': adminStatus, 'theID': aID})
        }
        function onTakenCourses(a) {
            coursesModel.append({'courseName': a})
        }
    }

    Component.onCompleted: {
        Appointment.callTheFunction('instructorinfo')
        Appointment.getAdminDB()
        iNameText.text = modelName.get(0).instructorName
        checkAvailability(modelName.get(0).availability)
        Appointment.courseTaken(modelName.get(0).theID)
        console.log(customTimer.theHour,customTimer.theMinute)
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:2000;width:1609}
}
##^##*/
