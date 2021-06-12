import QtQuick 2.0
import QtQuick.Controls 2.15
import 'controls'

Item {
    Rectangle {
        id: rectangle
        color: "#13141f"
        radius: 10
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            x: 1215
            width: 350
            height: 264
            color: "#0e0b19"
            radius: 10
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.rightMargin: 50

            Rectangle {
                id: rectangle2
                height: 40
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 10

                Label {
                    id: label1
                    x: 70
                    y: 17
                    color: "#ffffff"
                    text: qsTr("Add Course Subjects")
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pointSize: 12
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle3
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle2.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 5
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.rightMargin: 10

                CustomTextField {
                    id: courseCodeText
                    x: 14
                    y: 19
                    placeholderText: "Enter course code"
                    font.pointSize: 12
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                CustomTextField {
                    id: courseNameText
                    x: 14
                    anchors.top: courseCodeText.bottom
                    placeholderText: "Enter course name"
                    font.pointSize: 12
                    anchors.topMargin: 20
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                CustomButton {
                    id: addCourseBtn
                    x: 84
                    width: 100
                    height: 40
                    text: "Add"
                    anchors.top: courseNameText.bottom
                    font.bold: true
                    font.pointSize: 12
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 20
                    onClicked: {
                        Home.saveCourses(courseCodeText.text, courseNameText.text)
                        Home.getCourses()
                    }
                }
            }
        }

        Rectangle {
            id: rectangle4
            x: 1299
            width: 350
            color: "#0e0b19"
            radius: 10
            anchors.top: rectangle1.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            anchors.topMargin: 20
            anchors.horizontalCenter: rectangle1.horizontalCenter

            Rectangle {
                id: rectangle5
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle6.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 10
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10

                Rectangle {
                    id: rectangle7
                    color: "#00000000"
                    radius: 10
                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 10
                    clip: true

                    ScrollView {
                        id: scrollView
                        anchors.fill: parent

                        ListModel {
                            id: modelCourseSubjects
                        }

                        Component {
                            id: delegateCourseSubjects
                            Item {
                                width: listViewCourseSubjects.width
                                height: 30
                                Text {
                                    id: namename
                                    text: courseName
                                    anchors.left: parent.left
                                    height: 30
                                    color: "#ffffff"
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.leftMargin: 10
                                    font.pointSize: 12
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        listViewCourseSubjects.currentIndex = index
                                    }
                                    onDoubleClicked: {
                                        Home.deleteCourse(namename.text)
                                        Home.getCourses()
                                    }
                                }
                            }
                        }

                        ListView {
                            id: listViewCourseSubjects
                            anchors.fill: parent
                            focus: true

                            model: modelCourseSubjects
                            delegate: delegateCourseSubjects

                            highlight: Rectangle {
                                width: listViewCourseSubjects.width
                                color: "#313131"
                                radius: 10
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle6
                height: 40
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                Label {
                    id: label2
                    x: 108
                    y: 19
                    color: "#ffffff"
                    text: qsTr("Course Subjects List")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                    font.pointSize: 12
                }
            }
        }

        Rectangle {
            id: rectangle8
            x: 839
            y: 50
            width: 350
            height: 419
            color: "#0e0b19"
            radius: 10
            anchors.right: rectangle1.left
            anchors.rightMargin: 20

            Rectangle {
                id: rectangle9
                width: 200
                height: 40
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 10

                Label {
                    id: label3
                    x: 163
                    y: 19
                    color: "#ffffff"
                    text: qsTr("Key Return Confirmation")
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pointSize: 12
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: rectangle10
                height: 200
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle9.bottom
                clip: true
                anchors.topMargin: 5
                anchors.rightMargin: 10
                anchors.leftMargin: 10

                Rectangle {
                    id: rectangle11
                    color: "#00000000"
                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 10
                    radius: 10
                    clip: true

                    ScrollView {
                        anchors.fill: parent
                        clip: true

                        ListModel {
                            id: keyReturnModel
                        }

                        Component {
                            id: keyReturnDelegate

                            Item {
                                width: keyReturnListView.width
                                height: 30

                                Label {
                                    id: keyReturnee
                                    height: parent.height
                                    color: "#ffffff"
                                    text: returneeID
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    font.pointSize: 12
                                    }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        keyReturnListView.currentIndex = index
                                    }
                                }
                            }
                        }

                        ListView {
                            id: keyReturnListView
                            anchors.fill: parent

                            model: keyReturnModel
                            delegate: keyReturnDelegate

                            highlight: Rectangle {
                                width: keyReturnListView.width
                                color: '#313131'
                                radius: 10
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle12
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle13.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 5
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10

                CustomButton {
                    id: customButton
                    x: 142
                    y: 37
                    width: 175
                    height: 40
                    text: "Return Key"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                    font.pointSize: 12
                }
            }

            Rectangle {
                id: rectangle13
                height: 40
                color: "#1a1724"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle10.bottom
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 5

                Label {
                    id: label4
                    x: 175
                    y: 19
                    color: "#ffffff"
                    text: qsTr("Key Return Request")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                    font.pointSize: 12
                }
            }
        }
    }
    Connections {
        target: Home
        function onGetCoursesData(a) {
            modelCourseSubjects.append({'courseName': a})
        }
        function onClearModel() {
            modelCourseSubjects.clear()
        }
        function onReturnKeyReturneeID(x) {
            keyReturnModel.append({'returneeID': x})
        }
    }
    Component.onCompleted: {
        Home.getCourses()
        //Home.getKeyRuterneeID()
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.33;height:864;width:1609}
}
##^##*/
