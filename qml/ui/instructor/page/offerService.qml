import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"

Item {
    
    property real listViewWidth: scrollView.width
    property int index_selected: 0
    
    function listViewLongestWidth(itemWidth) {
        if (itemWidth > listViewWidth) {
            listViewWidth = itemWidth
        }
    }
    
    function highlightLength(itemWidth) {
        if (itemWidth > scrollView.width) {
            return itemWidth
        } else {
            return scrollView.width
        }
    }
    
    function refresh() {
        try {
            listModel.clear()
            console.log(listView.currentIndex)
            InstructorOfferService.display()
            listView.currentIndex = index_selected
        } catch(err) {}
    }
    
    function update_list() {
        refresh()
        
        try {
            serviceTitleText.text = listModel.get(index_selected).title
            serviceMessageText.text = listModel.get(index_selected).message

            removeServiceText.text = listModel.get(index_selected).title
        } catch(err){
            serviceTitleText.text = ""
            serviceMessageText.text = ""

            removeServiceText.text = ""
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
        opacity: 0.3
        anchors.fill: parent
        color: "black"
    }
    
    Rectangle {
        id: rectangle1
        color: "#00000000"
        anchors.fill: parent
        
        Rectangle {
            id: rectangle
            width: 338
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20
            
            Rectangle {
                id: rectangle2
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
                    x: 146
                    y: 14
                    color: "#ffffff"
                    text: qsTr("Service Offered")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 13
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            
            Rectangle {
                id: rectangle3
                color: "#111d2b"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle2.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5
                
                ScrollView {
                    id: scrollView
                    anchors.fill: parent
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    ScrollBar.horizontal.interactive: true
                    ScrollBar.vertical.interactive: true
                    contentWidth: listViewWidth
                    clip: true
                    
                    ListModel {
                        id: listModel
                    }
                    
                    Component {
                        id: delegateName
                        
                        Item {
                            width: highlightLength(10 + serviceTitle.width + 10)
                            height: 25
                            
                            Label {
                                id: serviceTitle
                                anchors.left: parent.left 
                                anchors.leftMargin: 10
                                height: 25
                                color: "white"
                                text: title 
                                font.pixelSize: 13
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            MouseArea {
                                anchors.fill: parent 
                                onClicked: {
                                    index_selected = index
                                    listView.currentIndex = index
                                    
                                    serviceTitleText.text = serviceTitle.text
                                    serviceMessageText.text = listModel.get(index).message

                                    removeServiceText.text = serviceTitle.text
                                }
                                onDoubleClicked: refresh()
                            }
                            Component.onCompleted: listViewLongestWidth(10 + serviceTitle.width + 10)
                        }
                    }
                    
                    ListView {
                        id: listView 
                        anchors.fill: parent 
                        
                        model: listModel
                        delegate: delegateName
                        
                        highlight: Rectangle {
                            width: listView.width
                            color: "#233A55"
                            radius: 10
                        }
                        
                        Component.onCompleted: {
                            listModel.clear()
                            InstructorOfferService.display()
                            // timer.startTimer(refresh, 1000)
                        }
                    }
                }
            }
        }
        
        ScrollView {
            id: scrollView1
            anchors.left: rectangle.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
            anchors.topMargin: 20
            anchors.leftMargin: 20
            contentHeight: rectangle10.height
            
            Rectangle {
                id: rectangle10
                height: rectangle4.height + 20 + rectangle7.height
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                
                Rectangle {
                    id: rectangle4
                    x: 0
                    y: 0
                    height: 474
                    color: "#58697e"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    
                    Rectangle {
                        id: rectangle5
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
                            x: 185
                            y: 19
                            color: "#ffffff"
                            text: qsTr("Offer Service")
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 13
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
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 10
                        anchors.topMargin: 5
                        
                        CustomTextField {
                            id: serviceTitleText
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            font.pixelSize: 13
                            anchors.rightMargin: 20
                            anchors.leftMargin: 20
                            anchors.topMargin: 20
                            placeholderText: "Service title"
                        }
                        
                        CustomTextArea {
                            id: serviceMessageText
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: serviceTitleText.bottom
                            anchors.bottom: addServiceBtn.top
                            anchors.rightMargin: 20
                            anchors.leftMargin: 20
                            anchors.bottomMargin: 20
                            anchors.topMargin: 20
                            font.pixelSize: 13
                            placeholderText: "Message"
                            wrapMode: Text.Wrap
                        }
                        
                        CustomButton {
                            id: addServiceBtn
                            width: 150
                            height: 30
                            text: "Add"
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenterOffset: -85
                            anchors.bottomMargin: 20
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            font.pixelSize: 13
                            onClicked: {
                                InstructorOfferService.addService(serviceTitleText.text, serviceMessageText.text)
                                listView.currentIndex = 0
                                update_list()
                            }
                        }
                        
                        CustomButton {
                            id: editServiceBtn
                            x: 262
                            y: 190
                            width: 150
                            height: 30
                            text: "Edit"
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenterOffset: 85
                            anchors.bottomMargin: 20
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            font.pixelSize: 13
                            onClicked: {
                                InstructorOfferService.editService(listModel.get(listView.currentIndex).idService, serviceTitleText.text, serviceMessageText.text)
                                refresh()
                            }
                        }
                    }
                }
                
                Rectangle {
                    id: rectangle7
                    x: 0
                    y: 494
                    height: 195
                    color: "#58697e"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: rectangle4.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 20
                    Rectangle {
                        id: rectangle8
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
                            id: label2
                            x: 185
                            y: 19
                            color: "#ffffff"
                            text: qsTr("Remove Service")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 13
                        }
                    }
                    
                    Rectangle {
                        id: rectangle9
                        color: "#111d2b"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: rectangle8.bottom
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 10
                        anchors.topMargin: 5

                        CustomTextField {
                            id: removeServiceText
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.rightMargin: 20
                            anchors.leftMargin: 20
                            placeholderText: "Service title"
                            anchors.topMargin: 20
                            font.pixelSize: 13
                        }
                        
                        CustomButton {
                            id: removeServiceBtn
                            width: 150
                            height: 30
                            text: "Remove"
                            anchors.top: removeServiceText.bottom
                            anchors.topMargin: 20
                            font.bold: true
                            anchors.horizontalCenterOffset: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 13
                            onClicked: {
                                InstructorOfferService.removeService(listModel.get(listView.currentIndex).idService)    
                                index_selected--
                                update_list()
                            }
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: InstructorOfferService.getCurrentAccount()
    
    Connections {
        target: InstructorOfferService

        function onDisplaySignal(title, message) {
            listModel.append({"title": title, "message": message, "idService": 0})
        }

        function onDisplaySignal2(index, id) {
            listModel.setProperty(index, "idService", id)
        }
    }
}
