import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"

Item {

    property real listViewWidth: scrollView.width - 20
    property int indexSelected: 0
    property int fieldSelected: 3

    function listViewLongestWidth(itemWidth) {
        if (itemWidth > listViewWidth) {
            listViewWidth = itemWidth
        }
    }

    function highlightLength(itemWidth) {
        if (itemWidth > scrollView.width) {
            return itemWidth
        } else {
            return scrollView.width - 20
        }
    }

    function addInstructorFunction() {
        AdminInstructor.addInstructor(addInstructorID.text, addInstructorName.text)
        listModel.clear()
        AdminInstructor.display()
        addInstructorName.text = ""
        addInstructorID.text = ""
        removeName.text = listModel.get(0).name
        removeID.text = listModel.get(0).school_id
        editName.text = listModel.get(0).name
        editID.text = listModel.get(0).school_id
    }

    function removeInstructorFunction() {
        AdminInstructor.removeInstructor(listModel.get(listView.currentIndex).account_id)
        listModel.clear()
        AdminInstructor.display()
        try {
            removeName.text = listModel.get(0).name
            removeID.text = listModel.get(0).school_id
            editName.text = listModel.get(0).name
            editID.text = listModel.get(0).school_id
        } catch (e) {
            removeName.text = ""
            removeID.text = ""
            editName.text = ""
            editID.text = ""
        }
    }

    function editInstructorFunction() {
        AdminInstructor.editInstructor(listModel.get(listView.currentIndex).account_id, editID.text, editName.text)
        listModel.clear()
        AdminInstructor.display()
        listView.currentIndex = indexSelected
        removeName.text = editName.text
        removeID.text = editID.text
    }
    
    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: .3
    }

    Rectangle {
        id: rectangle3
        color: "transparent"
        anchors.fill: parent

        Rectangle {
            id: rectangle
            color: "#58697e"
            radius: 10
            anchors.left: parent.left
            anchors.right: scrollView1.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
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
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 10

                Label {
                    id: label
                    x: 77
                    y: 14
                    color: "#ffffff"
                    text: qsTr("Instructor Accounts")
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
                
                ScrollView {
                    id: scrollView
                    anchors.fill: parent
                    ScrollBar.horizontal.interactive: true
                    ScrollBar.vertical.interactive: true
                    contentWidth: listViewWidth + 20
                    clip: true

                    ListModel {
                        id: listModel
                    }

                    Component {
                        id: delegateName
                        
                        Item {
                            width: highlightLength(200 + instructorID.width + 10)
                            height: 25

                            Label {
                                id: instructorName
                                anchors.left: parent.left 
                                anchors.leftMargin: 10
                                height: 25
                                color: "white"
                                text: name 
                                font.pixelSize: 13
                                verticalAlignment: Text.AlignVCenter
                            }

                            Label {
                                id: instructorID
                                anchors.left: parent.left 
                                anchors.leftMargin: 200
                                height: 25
                                color: "white"
                                text: school_id 
                                font.pixelSize: 13
                                verticalAlignment: Text.AlignVCenter
                            }

                            MouseArea {
                                anchors.fill: parent 
                                onClicked: {
                                    indexSelected = index
                                    listView.currentIndex = index
                                }
                            }
                            Component.onCompleted: listViewLongestWidth(200 + instructorID.width + 10), forceActiveFocus()
                        }
                    }

                    ListView {
                        id: listView 
                        anchors.fill: parent 
                        anchors.topMargin: 10
                        anchors.bottomMargin: 10
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        
                        model: listModel
                        delegate: delegateName

                        onCurrentIndexChanged: {
                            try {
                                indexSelected = currentIndex
                                removeName.text = listModel.get(currentIndex).name
                                removeID.text = listModel.get(currentIndex).school_id
                                editName.text = listModel.get(currentIndex).name
                                editID.text = listModel.get(currentIndex).school_id
                            } catch (e) {
                                removeName.text = ""
                                removeID.text = ""
                                editName.text = ""
                                editID.text = ""
                            } finally {
                                fieldSelected = 3
                                forceActiveFocus()
                            }
                        }

                        highlight: Rectangle {
                            width: listView.width
                            color: "#233A55"
                            radius: 10
                        }

                        Component.onCompleted: {
                            listModel.clear()
                            AdminInstructor.display()
                        }
                    }
                }
            }
        }

        ScrollView {
            id: scrollView1
            width: 360
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
            anchors.topMargin: 20
            contentHeight: rectangle5.height + rectangle8.height + rectangle11.height + 40

            Rectangle {
                id: rectangle5
                x: 0
                width: 360
                height: 245
                color: "#58697e"
                radius: 10
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: rectangle6
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
                        x: 88
                        y: 19
                        color: "#ffffff"
                        text: qsTr("Add Account")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 13
                    }
                }

                Rectangle {
                    id: rectangle7
                    width: 200
                    color: "#111d2b"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: rectangle6.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 5
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10

                    CustomTextField {
                        id: addInstructorName
                        anchors.left: parent.left
                        anchors.top: parent.top
                        placeholderText: "Instuctor's full name"
                        font.pixelSize: 13
                        anchors.leftMargin: 20
                        anchors.topMargin: 20
                        onPressed: fieldSelected = 0
                    }

                    CustomTextField {
                        id: addInstructorID
                        anchors.left: parent.left
                        anchors.top: addInstructorName.bottom
                        font.pixelSize: 13
                        placeholderText: "Instuctor's school ID"
                        anchors.leftMargin: 20
                        anchors.topMargin: 10
                        validator: RegExpValidator{regExp: /[0-9]+/}
                        onPressed: fieldSelected = 1
                    }

                    CustomButton {
                        id: addBtn
                        x: 190
                        width: 130
                        height: 30
                        text: "Add Instuctor"
                        anchors.top: addInstructorID.bottom
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 20
                        font.bold: true
                        font.pixelSize: 13
                        onClicked: addInstructorFunction()
                    }
                }
            }

            Rectangle {
                id: rectangle8
                x: 434
                width: 360
                height: 245
                color: "#58697e"
                radius: 10
                anchors.right: parent.right
                anchors.top: rectangle5.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 20

                Rectangle {
                    id: rectangle9
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
                        x: 157
                        y: 14
                        color: "#ffffff"
                        text: qsTr("Remove Account")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 13
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: rectangle10
                    x: 50
                    y: 144
                    color: "#111d2b"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: rectangle9.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 5

                    CustomTextField {
                        id: removeName
                        anchors.left: parent.left
                        anchors.top: parent.top
                        font.pixelSize: 13
                        placeholderText: "Instructor name"
                        anchors.leftMargin: 20
                        anchors.topMargin: 20
                        readOnly: true
                    }

                    CustomTextField {
                        id: removeID
                        x: -424
                        y: 64
                        anchors.left: parent.left
                        anchors.top: removeName.bottom
                        font.pixelSize: 13
                        placeholderText: "Instructor school ID"
                        anchors.topMargin: 10
                        anchors.leftMargin: 20
                        readOnly: true
                    }

                    CustomButton {
                        id: removeBtn
                        x: 51
                        width: 150
                        height: 30
                        text: "Remove Instructor"
                        anchors.top: removeID.bottom
                        anchors.topMargin: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.pixelSize: 13
                        onClicked: removeInstructorFunction()
                    }
                }
            }

            Rectangle {
                id: rectangle11
                x: 434
                width: 360
                height: 245
                color: "#58697e"
                radius: 10
                anchors.right: parent.right
                anchors.top: rectangle8.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 20

                Rectangle {
                    id: rectangle12
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
                        id: label3
                        x: 151
                        y: 19
                        color: "#ffffff"
                        text: qsTr("Edit Account")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 13
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: rectangle13
                    width: 200
                    color: "#111d2b"
                    radius: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: rectangle12.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 5

                    CustomTextField {
                        id: editName
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 20
                        anchors.topMargin: 20
                        placeholderText: "Instructor name"
                        font.pixelSize: 13
                        onPressed: fieldSelected = 2
                    }

                    CustomTextField {
                        id: editID
                        anchors.left: parent.left
                        anchors.top: editName.bottom
                        anchors.leftMargin: 20
                        anchors.topMargin: 10
                        placeholderText: "Instructor school ID"
                        font.pixelSize: 13
                        validator: RegExpValidator{regExp: /[0-9]+/}
                        onPressed: fieldSelected = 3
                    }

                    CustomButton {
                        id: editBtn
                        x: 147
                        width: 130
                        height: 30
                        text: "Edit Instructor"
                        anchors.top: editID.bottom
                        anchors.topMargin: 20
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.pixelSize: 13
                        onClicked: editInstructorFunction()
                    }
                }
            }
        }
    }

    Shortcut {
        sequence: "Ctrl+R"
        onActivated: removeInstructorFunction()
    }

    Shortcut {
        sequence: "Ctrl+E"
        onActivated: editInstructorFunction()
    }

    Shortcut {
        sequence: "Ctrl+S"
        onActivated: addInstructorFunction()
    }

    Shortcut {
        sequence: "Tab"
        onActivated: {
            if (fieldSelected === 0) {
                addInstructorID.forceActiveFocus()
                addInstructorID.selectAll()
                fieldSelected = 1
            } else if (fieldSelected === 1) {
                editName.forceActiveFocus()
                editName.selectAll()
                fieldSelected = 2
            } else if (fieldSelected === 2) {
                editID.forceActiveFocus()
                editID.selectAll()
                fieldSelected = 3
            } else {
                addInstructorName.forceActiveFocus()
                addInstructorName.selectAll()
                fieldSelected = 0
            }
        }
    }

    Shortcut {
        sequence: "Shift+Tab"
        onActivated: {
            listView.forceActiveFocus()
            fieldSelected = 3
        }
    }

    Connections {
        target: AdminInstructor

        function onDisplaySignal(name, id) {
            listModel.append({"name": name, "school_id": id, "account_id": -1})
        }

        function onDisplaySignal2(index, id) {
            listModel.setProperty(index, "account_id", id)
        }
    }
}
