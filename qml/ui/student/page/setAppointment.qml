import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"

Item {

    property string dateChosen: ""
    property string timeChosen: customTimer.theHour + ":" + customTimer.theMinute
    property real listViewWidth: instructor_scrollView.width
    property var indexSelected: 0
    
    function listViewLongestWidth(itemWidth) {
        if (itemWidth > listViewWidth) {
            listViewWidth = itemWidth
        }
    }
    
    function highlightLength(itemWidth) {
        if (itemWidth > instructor_scrollView.width) {
            return itemWidth
        } else {
            return instructor_scrollView.width
        }
    }

    function statusChecker(value) {
        if (value === 1) {
            statusLabel.text = "Available"
            statusLabel.color = "#30BD44"
        } else {
            statusLabel.text = "Unavailable"
            statusLabel.color = "#EF534F"
        }
    }

    function refresh() {
        StudentAppointment.refresh_index(indexSelected, instructorListModel.get(indexSelected).idAcc)
    }

    function display_about() {
        try {
            instructorListView.currentIndex = indexSelected
            image.source = instructorListModel.get(indexSelected).img
            statusChecker(instructorListModel.get(indexSelected).status)
            nameLabel.text = instructorListModel.get(indexSelected).name
            courseListModel.clear()
            StudentAppointment.displayCourses(instructorListModel.get(indexSelected).idAcc)
        } catch(err){}
    }

    function set_appointment() {
        if (StudentAppointment.setAppointment(dateChosen, timeChosen, reasonText.text, instructorListModel.get(instructorListView.currentIndex).idAcc)) {
            open_pop_up("Appointment Set")
        }
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
        opacity: 0.5
        color: "#000000"
        anchors.fill: parent
    }

    Rectangle {
        id: rectangle1
        color: "#00000000"
        anchors.fill: parent

        Rectangle {
            id: rectangle2
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20
            width: 380
            radius: 10
            color: "#58697e"

            Rectangle {
                id: rectangle3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 10
                height: 40
                radius: 10
                color: "#111d2b"

                Label {
                    id: label
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#ffffff"
                    text: "Instructors"
                    font.pixelSize: 13
                }
            }

            Rectangle {
                id: rectangle4
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: rectangle3.bottom
                anchors.topMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                radius: 10
                color: "#111d2b"

                ScrollView {
                    id: instructor_scrollView
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
                        id: instructorListModel
                    }

                    Component {
                        id: instructorDelegate
                        
                        Item {
                            width: highlightLength(10 + instructorName.width + 10)
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

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    indexSelected = index
                                    instructorListView.currentIndex = index
                                    display_about()
                                }
                            }
                            Component.onCompleted: listViewLongestWidth(10 + instructorName.width + 10)
                        }
                    }

                    ListView {
                        id: instructorListView
                        anchors.fill: parent

                        model: instructorListModel
                        delegate: instructorDelegate

                        highlight: Rectangle {
                            width: instructorListView.width
                            color: "#233A55"
                            radius: 10
                        }

                        Component.onCompleted: {
                            instructorListModel.clear()
                            StudentAppointment.displayInstructors()
                            display_about()
                            timer.startTimer(refresh, 1000)
                        }
                    }
                }
            }
        }

        ScrollView {
            anchors.left: rectangle2.right
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            clip: false
            contentHeight: rectangle5.height + rectangle7.height + 20

            Rectangle {
                id: rectangle5
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                height: rectangle8.height + rectangle6.height + 25
                radius: 10
                color: "#58697e"

                Rectangle {
                    id: rectangle8
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    height: 40
                    radius: 10
                    color: "#111d2b"

                    Label {
                        id: label1
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#ffffff"
                        text: "About"
                        font.pixelSize: 13
                    }
                }

                Rectangle {
                    id: rectangle6
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.top: rectangle8.bottom
                    height: image.height + statusLabel.height + nameLabel.height + rectangle.height + 100
                    anchors.topMargin: 5
                    color: "#111d2b"
                    radius: 10

                    Image {
                        id: image
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 20
                        width: 150
                        height: 150
                        source: "../../../../img/favicon.png"
                    }

                    Label {
                        id: label2
                        anchors.right: label3.right
                        anchors.rightMargin: 0
                        anchors.top: image.bottom
                        anchors.topMargin: 20
                        color: "#ffffff"
                        text: "Current status:"
                        font.pixelSize: 13
                    }

                    Label {
                        id: label3
                        anchors.right: label4.right
                        anchors.rightMargin: 0
                        anchors.top: label2.bottom
                        anchors.topMargin: 20
                        color: "#ffffff"
                        text: "Name:"
                        font.pixelSize: 13
                    }

                    Label {
                        id: label4
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.top: nameLabel.bottom
                        anchors.topMargin: 20
                        color: "#ffffff"
                        text: "Courses handled:"
                        font.pixelSize: 13
                    }

                    Label {
                        id: statusLabel
                        anchors.verticalCenter: label2.verticalCenter
                        anchors.left: label2.right
                        anchors.leftMargin: 5
                        color: "#ffffff"
                        text: "Loading..."
                        font.pixelSize: 13
                    }

                    Label {
                        id: nameLabel
                        anchors.top: label3.top
                        anchors.left: label3.right
                        anchors.leftMargin: 5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        color: "#ffffff"
                        text: "Loading..."
                        font.pixelSize: 13
                        wrapMode: Text.Wrap
                    }

                    Rectangle {
                        id: rectangle
                        color: "#00000000"
                        radius: 10
                        border.color: "#ffffff"
                        anchors.left: label4.right
                        anchors.right: parent.right
                        anchors.top: label4.top
                        anchors.rightMargin: 20
                        anchors.leftMargin: 10
                        anchors.topMargin: 0
                        height: 130
                        clip: true
                
                        ScrollView {
                            id: courseScrollView
                            anchors.fill: parent
                            anchors.topMargin: 10
                            anchors.bottomMargin: 10
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                            clip: true

                            ListModel {
                                id: courseListModel
                            }

                            Component {
                                id: courseDelegate
                                
                                Item {
                                    width: courseListView.width
                                    height: 25

                                    Label {
                                        id: courseCode
                                        anchors.left: parent.left 
                                        anchors.leftMargin: 10
                                        height: 25
                                        color: "white"
                                        text: code 
                                        font.pixelSize: 13
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                            }

                            ListView {
                                id: courseListView 
                                anchors.fill: parent 
                                
                                model: courseListModel
                                delegate: courseDelegate
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle7
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle5.bottom
                anchors.topMargin: 20
                height: 1065
                color: "#58697e"
                radius: 10

                Rectangle {
                    id: rectangle9
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
                        id: label8
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#ffffff"
                        text: "Set Appointment"
                        font.pixelSize: 13
                    }
                }

                Rectangle {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.top: rectangle9.bottom
                    anchors.topMargin: 5
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    color: "#111d2b"
                    radius: 10

                    CustomCalendar {
                        id: customCalendar
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        height: 400
                        
                        calendar.onSelectedDateChanged:{
                            const indexDay = calendar.selectedDate.getDay();
                            const day = calendar.selectedDate.getDate();
                            const indexMonth = calendar.selectedDate.getMonth();
                            const year = calendar.selectedDate.getFullYear();
                            dateChosen = indexDay+','+day+','+indexMonth+','+year
                        }
                    }

                    CustomTimer {
                        id: customTimer
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: customCalendar.bottom
                        anchors.topMargin: 20
                    }

                    CustomTextArea {
                        id: reasonText
                        anchors.top: customTimer.bottom
                        anchors.topMargin: 20
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.right: parent.right
                        anchors.rightMargin: 20
                        height: 200
                        font.pixelSize: 13
                        placeholderText: "Reason for visit"
                        wrapMode: Text.Wrap
                    }

                    CustomButton {
                        id: setAppointmentBtn
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 20
                        anchors.top: reasonText.bottom
                        width: 150
                        height: 30
                        text: "Set Appointment"
                        font.letterSpacing: 0.2
                        font.bold: true
                        font.pixelSize: 13
                        onClicked: set_appointment()
                    }
                }
            }
        }
    }

    Component.onCompleted: StudentAppointment.getCurrentAccount()

    Connections {
        target: StudentAppointment

        function onDisplayInstructorSignal(name, id) {
            instructorListModel.append({"name": name, "idAcc": id, "status": 2, "img": ""})
        }

        function onDisplayInstructorSignal_v2(name, id) {
            instructorListModel.append({"name": name, "idAcc": id, "status": 2, "img": ""})
        }

        function onDisplayInstructorSignal2(index, status) {
            instructorListModel.setProperty(index, "status", status)
        }

        function onDisplayCoursesSignal(code) {
            courseListModel.append({"code": code})
        }

        function onDisplayInstructorSignal3(index, imgurl) {
            instructorListModel.setProperty(index, "img", imgurl)
        }

        function onRefresh_index_signal(index, status) {
            instructorListModel.setProperty(index, "status", status)
            statusChecker(instructorListModel.get(index).status)
        }
    }
}
