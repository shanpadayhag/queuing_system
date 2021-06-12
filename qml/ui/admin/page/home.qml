import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"

Item {
    
    property real returneeListViewWidth: returneeScrollView.width - 20
    property real courseListViewWidth: courseScrollView.width - 20
    property int indexSelectedReturnee: 0
    
    function returneeLongestWidth(itemWidth) {
        if (itemWidth > returneeListViewWidth) {
            returneeListViewWidth = itemWidth
        }
    }
    
    function courseLongestWidth(itemWidth) {
        if (itemWidth > courseListViewWidth) {
            courseListViewWidth = itemWidth
        }
    }
    
    function highlightLength(itemWidth) {
        if (itemWidth > (returneeScrollView.width - 20)) {
            return itemWidth
        } else {
            return (returneeScrollView.width - 20)
        }
    }
    
    function addCourse(code, name) {
        if (AdminHome.addCourse(code, name)) {
            courseListModel.clear()
            AdminHome.displayCourses()
            courseCodeText.text = ""
            courseNameText.text = ""
        }
    }
    
    function returneeLiveView() {
        returneeListModel.clear()
        AdminHome.displayRequests()
        returneeListView.currentIndex = indexSelectedReturnee
    }

    function accept_queue(id_queue) {
        AdminHome.accept_queue(id_queue)
        queueLineListModel.clear()
        AdminHome.getQueueLineNumbers()
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
            width: rectangle13.width + rectangle10.width + rectangle.width +80
            
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
                        font.bold: true
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
                                        AdminHome.keyReturned(returneeListModel.get(index).id_reserved_room, returneeRoom.text)
                                        returneeListModel.clear()
                                        AdminHome.displayRequests()
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
                                AdminHome.displayRequests()
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
                        font.bold: true
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
                            AdminHome.returnKey()
                            returneeListModel.clear()
                            AdminHome.displayRequests()
                            success_pop_up("Request to return key successful")
                        }
                    }
                }
            }
            
            Rectangle {
                id: rectangle10
                x: 416
                y: 20
                width: 376
                color: "#58697e"
                radius: 10
                anchors.left: rectangle13.right
                anchors.top: parent.top
                anchors.bottom: rectangle7.top
                anchors.bottomMargin: 20
                anchors.topMargin: 20
                anchors.leftMargin: 20
                Rectangle {
                    id: rectangle11
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
                        x: 77
                        y: 19
                        color: "#ffffff"
                        text: qsTr("Course Subject List")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 13
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                
                Rectangle {
                    id: rectangle12
                    color: "#111d2b"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: rectangle11.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 5
                    anchors.rightMargin: 10
                    anchors.bottomMargin: 10
                    anchors.leftMargin: 10
                    
                    ScrollView {
                        id: courseScrollView
                        anchors.fill: parent
                        ScrollBar.horizontal.interactive: true
                        ScrollBar.vertical.interactive: true
                        contentWidth: courseListViewWidth + 20
                        clip: true
                        
                        ListModel {
                            id: courseListModel
                        }
                        
                        Component {
                            id: courseDelegate
                            
                            Item {
                                width: highlightLength(10 + courseCode.width + (100 - courseCode.width) + courseName.width)
                                height: 25
                                
                                Label {
                                    id: courseCode
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    color: "white"
                                    text: code
                                    font.pixelSize: 13
                                    height: 25
                                    verticalAlignment: Text.AlignVCenter
                                }
                                
                                Label {
                                    id: courseName
                                    anchors.left: parent.left
                                    anchors.leftMargin: 100
                                    color: "white"
                                    text: name
                                    font.pixelSize: 13
                                    height: 25
                                    verticalAlignment: Text.AlignVCenter
                                }
                                
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        courseListView.currentIndex = index
                                    }
                                    onDoubleClicked: {
                                        courseListModel.clear()
                                        AdminHome.deleteCourse(courseCode.text)
                                        AdminHome.displayCourses()
                                    }
                                }
                                
                                Component.onCompleted: courseLongestWidth(10 + courseCode.width + (100 - courseCode.width) + courseName.width)
                            }
                        }
                        
                        ListView {
                            id: courseListView
                            anchors.fill: parent
                            anchors.topMargin: 10
                            anchors.bottomMargin: 10
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                            
                            model: courseListModel
                            delegate: courseDelegate
                            
                            highlight: Rectangle {
                                width: courseListView.width
                                color: "#233A55"
                                radius: 10
                            }
                            
                            Component.onCompleted: {
                                courseListModel.clear()
                                AdminHome.displayCourses()
                            }
                        }
                    }
                }
            }
            
            Rectangle {
                id: rectangle7
                x: 416
                y: 284
                width: 376
                height: 210
                color: "#58697e"
                radius: 10
                anchors.left: rectangle4.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.leftMargin: 20
                Rectangle {
                    id: rectangle8
                    width: 200
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
                        x: 84
                        y: 19
                        color: "#ffffff"
                        text: qsTr("Add Course Subject")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 13
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                
                Rectangle {
                    id: rectangle9
                    width: 200
                    color: "#111d2b"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: rectangle8.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 5
                    anchors.rightMargin: 10
                    anchors.bottomMargin: 10
                    anchors.leftMargin: 10
                    
                    CustomTextField {
                        id: courseCodeText
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.rightMargin: 10
                        anchors.topMargin: 10
                        anchors.leftMargin: 10
                        placeholderText: "Course Subject Code"
                    }
                    
                    CustomTextField {
                        id: courseNameText
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: courseCodeText.bottom
                        anchors.rightMargin: 10
                        anchors.topMargin: 5
                        anchors.leftMargin: 10
                        placeholderText: "Course Subject Name"
                    }
                    
                    CustomButton {
                        id: addCourseBtn
                        x: 120
                        width: 150
                        height: 30
                        text: "Add"
                        anchors.top: courseNameText.bottom
                        font.letterSpacing: 0.2
                        font.pixelSize: 13
                        anchors.topMargin: 10
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: addCourse(courseCodeText.text, courseNameText.text)
                    }
                }
            }
            
            Rectangle {
                id: rectangle
                width: 376
                color: "#58697e"
                radius: 10
                anchors.left: rectangle10.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.leftMargin: 20
                anchors.topMargin: 20
                
                Rectangle {
                    id: rectangle1
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
                        id: label
                        x: 165
                        y: 14
                        color: "#ffffff"
                        text: qsTr("Queue Line")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 13
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
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

                    ListModel {
                        id: queueLineListModel
                    }

                    Component {
                        id: queueLineDelegate

                        Item {
                            height: 25
                            width: queueLineListView.width

                            Label {
                                id: queueLineNumber
                                anchors.left: parent.left
                                anchors.leftMargin: 10
                                color: "white"
                                text: number
                                font.pixelSize: 13
                                height: 25
                                verticalAlignment: Text.AlignVCenter
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: queueLineListView.currentIndex = index
                                onDoubleClicked: accept_queue(queueLineListModel.get(index).idQueue)
                            }
                        }
                    }

                    ScrollView {
                        anchors.fill: parent
                        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                        
                        ListView {
                            id: queueLineListView
                            anchors.fill: parent
                            anchors.topMargin: 10
                            anchors.bottomMargin: 10
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10

                            model: queueLineListModel
                            delegate: queueLineDelegate

                            highlight: Rectangle {
                                width: queueLineListView.width
                                color: "#233A55"
                                radius: 10
                            }

                            Component.onCompleted: {
                                AdminHome.getQueueLineNumbers()
                            }
                        }
                    }
                }
            }
            
        }
    }
    
    Component.onCompleted: AdminHome.getCurrentAccount()
    
    Connections {
        target: AdminHome
        function onSignalCourses(code, name) {
            courseListModel.append({"code": code, "name": name})
        }

        function onReturnKeySignal(name, room) {
            returneeListModel.append({"name": name, "room": room, "id_reserved_room": 0})
        }

        function onReturnKeySignal2(index, id_reserved_room) {
            returneeListModel.setProperty(index, "id_reserved_room", id_reserved_room)
        }

        function onGetQueueLineNumberSignal(queueNumber, id) {
            queueLineListModel.append({"number": queueNumber, "idQueue": id})
        }
    }
    
}
