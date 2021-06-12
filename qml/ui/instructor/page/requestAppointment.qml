import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"

Item {
    Rectangle {
        opacity: 0.5
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
            
            Rectangle {
                id: rectangle3
                color: "#00000000"
                anchors.fill: parent
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                ListModel {
                    id: listModel
                }
                
                Component {
                    id: delegate
                    ScrollView {
                        width: listView.width
                        height: listView.height
                        Item {
                            anchors.fill: parent
                            Image {
                                id: idImage
                                width: 175
                                height: 175
                                anchors.top: parent.top
                                source: image
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.topMargin: 25
                            }
                            
                            Label {
                                id: idName
                                color: "#ffffff"
                                text: name
                                anchors.top: idImage.bottom
                                font.pointSize: 20
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.topMargin: 20
                            }
                            
                            Label {
                                id: idID
                                color: "#ffffff"
                                text: idRequester
                                anchors.top: idName.bottom
                                font.pointSize: 12
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.topMargin: 10
                            }
                            
                            Label {
                                id: idProgram
                                color: "#ffffff"
                                text: program
                                anchors.top: idID.bottom
                                font.pointSize: 12
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.topMargin: 10
                            }

                            Label {
                                id: idSched
                                color: "#ffffff"
                                text: sched
                                anchors.top: idProgram.bottom
                                font.pointSize: 12
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.topMargin: 10
                            }

                            TextArea {
                                id: idConcern
                                color: "#ffffff"
                                text: concern
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: idSched.bottom
                                horizontalAlignment: Text.AlignHCenter
                                wrapMode: Text.Wrap
                                font.pointSize: 12
                                anchors.rightMargin: 50
                                readOnly: true
                                anchors.topMargin: 20
                                anchors.leftMargin: 50
                            }
                        }
                        contentHeight: idImage.height + idName.height + idID.height + idProgram.height + idSched.height + idConcern.height + 165
                    }
                }
                
                ListView {
                    id: listView
                    anchors.fill: parent
                    delegate: delegate
                    orientation: ListView.Horizontal
                    model: listModel
                    highlightRangeMode: ListView.StrictlyEnforceRange
                    /*onCurrentIndexChanged: {
                        console.log(currentIndex)
                    }*/
                    snapMode: ListView.SnapOneItem
                    Repeater {
                        Loader {
                            active: listView.isPreviousItem || listView.isCurrentItem || listView.isNextItem
                        }
                    }
                    currentIndex: 0
                    Component.onCompleted: InstructorRequest.display()
                }
                clip: true
            }
        }
        
        Rectangle {
            id: rectangle2
            y: 358
            height: 100
            color: "#111d2b"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            
            Rectangle {
                x: -30
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                CustomButton {
                    id: acceptBtn
                    width: 130
                    height: 30
                    text: "Accept"
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pixelSize: 13
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -100
                    onClicked: {
                        InstructorRequest.acceptRequest(listModel.get(listView.currentIndex).idAppointment)
                        InstructorRequest.display()
                    }
                }
                
                CustomButton {
                    id: declineBtn
                    width: 130
                    height: 30
                    text: "Decline"
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pixelSize: 13
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: 100
                    onClicked: {
                        InstructorRequest.declineRequest(listModel.get(listView.currentIndex).idAppointment)
                        InstructorRequest.display()
                    }
                }
            }
        }
    }
    
    Component.onCompleted: InstructorRequest.getCurrentAccount()
    
    Connections {
        target: InstructorRequest
        
        function onDisplaySignal(name, id) {
            listModel.append({"image": "../../../../img/favicon.png", "name": name, "idRequester": id, "program": "", "sched": "", "concern": "", "idAppointment": 0})
        }
        
        function onDisplaySignal2(index, program) {
            if (program != "") {
                listModel.setProperty(index, "program", program)
            } else {
                listModel.setProperty(index, "program", "Instructor")
            }
        }
        
        function onDisplaySignal3(index, sched) {
            listModel.setProperty(index, "sched", sched)
        }
        
        function onDisplaySignal4(index, concern) {
            listModel.setProperty(index, "concern", concern)
        }
        
        function onDisplaySignal5(index, id) {
            listModel.setProperty(index, "idAppointment", id)
        }
        
        function onDisplaySignal6(index, imgurl) {
            listModel.setProperty(index, "image", imgurl)
        }

        function onDisplayClearSignal() {
            listModel.clear()
        }
    }
    
}