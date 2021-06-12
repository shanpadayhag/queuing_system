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

    function chooseProgram(text) {
        if (text.text === "Computer Science") {
            text.text = "Entertainment and Multimedia Computing"
        } else if (text.text === "Entertainment and Multimedia Computing") {
            text.text = "Information System"
        } else if (text.text === "Information System") {
            text.text = "Information Technology"
        } else if ( text.text === "Information Technology") {
             text.text = "Computer Science"
        }  else {
            text.text = "Entertainment and Multimedia Computing"
        }
    }

    function add_student_function() {
        AdminStudent.addAccount(addStudentName.text, addStudentID.text, addStudentProgram.text)
        listModel.clear()
        AdminStudent.display()
        addStudentName.text = ""
        addStudentID.text = ""
        addStudentProgram.text = ""
        listView.currentIndex = 0
        removeStudentName.text = listModel.get(listView.currentIndex).name
        editStudentName.text = listModel.get(listView.currentIndex).name
        removeStudentID.text = listModel.get(listView.currentIndex).school_id
        editStudentID.text = listModel.get(listView.currentIndex).school_id
        editStudentProgram.text = listModel.get(listView.currentIndex).program
    }

    function remove_student_function() {
        AdminStudent.removeStudent(listModel.get(listView.currentIndex).account_id)
        listModel.clear()
        AdminStudent.display()

        try {
            listView.currentIndex = 0
            removeStudentName.text = listModel.get(listView.currentIndex).name
            editStudentName.text = listModel.get(listView.currentIndex).name
            removeStudentID.text = listModel.get(listView.currentIndex).school_id
            editStudentID.text = listModel.get(listView.currentIndex).school_id
            editStudentProgram.text = listModel.get(listView.currentIndex).program
        } catch (e) {
            removeStudentName.text = ""
            editStudentName.text = ""
            removeStudentID.text = ""
            editStudentID.text = ""
            editStudentProgram.text = ""
        }
    }

    function edit_student_function() {
        AdminStudent.editStudent(listModel.get(listView.currentIndex).account_id, editStudentID.text, editStudentName.text, editStudentProgram.text)
        listModel.clear()
        AdminStudent.display()
        listView.currentIndex = indexSelected
        removeStudentName.text = editStudentName.text
        removeStudentID.text = editStudentID.text
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
                    text: qsTr("Student Accounts")
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
                            width: highlightLength(390 + studentProgram.width + 10)
                            height: 25

                            Label {
                                id: studentName
                                anchors.left: parent.left 
                                anchors.leftMargin: 10
                                height: 25
                                color: "white"
                                text: name 
                                font.pixelSize: 13
                                verticalAlignment: Text.AlignVCenter
                            }

                            Label {
                                id: studentID
                                anchors.left: parent.left 
                                anchors.leftMargin: 200
                                height: 25
                                color: "white"
                                text: school_id 
                                font.pixelSize: 13
                                verticalAlignment: Text.AlignVCenter
                            }

                            Label {
                                id: studentProgram
                                anchors.left: parent.left 
                                anchors.leftMargin: 390
                                height: 25
                                color: "white"
                                text: program 
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
                            Component.onCompleted: listViewLongestWidth(390 + studentProgram.width + 10), forceActiveFocus()
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
                                removeStudentName.text = listModel.get(listView.currentIndex).name
                                editStudentName.text = listModel.get(listView.currentIndex).name
                                removeStudentID.text = listModel.get(listView.currentIndex).school_id
                                editStudentID.text = listModel.get(listView.currentIndex).school_id
                                editStudentProgram.text = listModel.get(listView.currentIndex).program
                            } catch (e) {
                                removeStudentName.text = ""
                                editStudentName.text = ""
                                removeStudentID.text = ""
                                editStudentID.text = ""
                                editStudentProgram.text = ""
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
                            AdminStudent.display()
                            if (currentIndex != -1) {
                                currentIndex = 0
                                removeStudentName.text = listModel.get(currentIndex).name
                                editStudentName.text = listModel.get(currentIndex).name
                                removeStudentID.text = listModel.get(currentIndex).school_id
                                editStudentID.text = listModel.get(currentIndex).school_id
                                editStudentProgram.text = listModel.get(currentIndex).program
                            }
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
                x: 434
                width: 360
                height: 295
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
                        id: addStudentName
                        anchors.left: parent.left
                        anchors.top: parent.top
                        placeholderText: "Student's full name"
                        font.pixelSize: 13
                        anchors.leftMargin: 20
                        anchors.topMargin: 20
                        onPressed: fieldSelected = 0
                    }

                    CustomTextField {
                        id: addStudentID
                        anchors.left: parent.left
                        anchors.top: addStudentName.bottom
                        font.pixelSize: 13
                        placeholderText: "Student's school ID"
                        anchors.leftMargin: 20
                        anchors.topMargin: 10
                        validator: RegExpValidator{regExp: /[0-9]+/}
                        onPressed: fieldSelected = 1
                    }

                    CustomTextField {
                        id: addStudentProgram
                        anchors.left: parent.left
                        anchors.top: addStudentID.bottom
                        font.pixelSize: 13
                        placeholderText: "Student's program"
                        anchors.leftMargin: 20
                        anchors.topMargin: 10
                        readOnly: true
                    }

                    CustomButton {
                        id: chooseProgramBtn
                        x: 20
                        width: 130
                        height: 30
                        text: "Choose Program"
                        anchors.top: addStudentProgram.bottom
                        anchors.horizontalCenterOffset: -70
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 20
                        font.bold: true
                        font.pixelSize: 13
                        onClicked: chooseProgram(addStudentProgram)
                    }

                    CustomButton {
                        id: addStudentBtn
                        x: 190
                        y: 197
                        width: 130
                        height: 30
                        text: "Add Student"
                        anchors.top: addStudentProgram.bottom
                        anchors.horizontalCenterOffset: 70
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 20
                        font.bold: true
                        font.pixelSize: 13
                        onClicked: add_student_function()
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
                        id: removeStudentName
                        anchors.left: parent.left
                        anchors.top: parent.top
                        font.pixelSize: 13
                        placeholderText: "Student name"
                        anchors.leftMargin: 20
                        anchors.topMargin: 20
                        readOnly: true
                    }

                    CustomTextField {
                        id: removeStudentID
                        x: -424
                        y: 64
                        anchors.left: parent.left
                        anchors.top: removeStudentName.bottom
                        font.pixelSize: 13
                        placeholderText: "Student school ID"
                        anchors.topMargin: 10
                        anchors.leftMargin: 20
                        readOnly: true
                    }

                    CustomButton {
                        id: removeStudentBtn
                        x: 51
                        width: 130
                        height: 30
                        text: "Remove Student"
                        anchors.top: removeStudentID.bottom
                        anchors.topMargin: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.pixelSize: 13
                        onClicked: remove_student_function()
                    }
                }
            }

            Rectangle {
                id: rectangle11
                x: 434
                width: 360
                height: 295
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
                        id: editStudentName
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 20
                        anchors.topMargin: 20
                        placeholderText: "Student name"
                        font.pixelSize: 13
                        onPressed: fieldSelected = 2
                    }

                    CustomTextField {
                        id: editStudentID
                        anchors.left: parent.left
                        anchors.top: editStudentName.bottom
                        anchors.leftMargin: 20
                        anchors.topMargin: 10
                        placeholderText: "Student school ID"
                        font.pixelSize: 13
                        validator: RegExpValidator{regExp: /[0-9]+/}
                        onPressed: fieldSelected = 3
                    }

                    CustomTextField {
                        id: editStudentProgram
                        anchors.left: parent.left
                        anchors.top: editStudentID.bottom
                        anchors.leftMargin: 20
                        anchors.topMargin: 10
                        placeholderText: "Student's program"
                        font.pixelSize: 13
                        readOnly: true
                    }

                    CustomButton {
                        id: editProgramBtn
                        x: 20
                        width: 130
                        height: 30
                        text: "Choose Program"
                        anchors.top: editStudentProgram.bottom
                        anchors.horizontalCenterOffset: -70
                        font.bold: true
                        font.pixelSize: 13
                        anchors.topMargin: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: chooseProgram(editStudentProgram)
                    }

                    CustomButton {
                        id: editBtn
                        x: 147
                        width: 130
                        height: 30
                        text: "Edit Student"
                        anchors.top: editStudentProgram.bottom
                        anchors.horizontalCenterOffset: 70
                        anchors.topMargin: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.pixelSize: 13
                        onClicked: edit_student_function()
                    }
                }
            }
        }
    }

    Shortcut {
        sequence: "Ctrl+P"
        onActivated: {
            if (addStudentProgram.text === "Computer Science") {
                addStudentProgram.text = "Entertainment and Multimedia Computing"
            } else if (addStudentProgram.text === "Entertainment and Multimedia Computing") {
                addStudentProgram.text = "Information System"
            } else if (addStudentProgram.text === "Information System") {
                addStudentProgram.text = "Information Technology"
            } else if ( addStudentProgram.text === "Information Technology") {
                addStudentProgram.text = "Computer Science"
            }  else {
                addStudentProgram.text = "Entertainment and Multimedia Computing"
            }
        }
    }

    Shortcut {
        sequence: "Ctrl+Shift+P"
        onActivated: {
            if (editStudentProgram.text === "Computer Science") {
                editStudentProgram.text = "Entertainment and Multimedia Computing"
            } else if (editStudentProgram.text === "Entertainment and Multimedia Computing") {
                editStudentProgram.text = "Information System"
            } else if (editStudentProgram.text === "Information System") {
                editStudentProgram.text = "Information Technology"
            } else if ( editStudentProgram.text === "Information Technology") {
                editStudentProgram.text = "Computer Science"
            }  else {
                editStudentProgram.text = "Entertainment and Multimedia Computing"
            }
        }
    }

    Shortcut {
        sequence: "Ctrl+S"
        onActivated: add_student_function()
    }

    Shortcut {
        sequence: "Ctrl+R"
        onActivated: remove_student_function()
    }

    Shortcut {
        sequence: "Ctrl+E"
        onActivated: {
            AdminStudent.editStudent(listModel.get(listView.currentIndex).account_id, editStudentID.text, editStudentName.text, editStudentProgram.text)
            listModel.clear()
            AdminStudent.display()
            listView.currentIndex = indexSelected
            removeStudentName.text = editStudentName.text
            removeStudentID.text = editStudentID.text
        }
    }

    Shortcut {
        sequence: "Tab"
        onActivated: {
            if (fieldSelected === 0) {
                addStudentID.forceActiveFocus()
                addStudentID.selectAll()
                fieldSelected = 1
            } else if (fieldSelected === 1) {
                fieldSelected = 2
                editStudentName.forceActiveFocus()
                editStudentName.selectAll()
            } else if (fieldSelected === 2) {
                editStudentID.forceActiveFocus()
                editStudentID.selectAll()
                fieldSelected = 3
            } else {
                addStudentName.forceActiveFocus()
                addStudentName.selectAll()
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
        target: AdminStudent

        function onDisplaySignal(name, id) {
            listModel.append({"name": name, "school_id": id, "program": "", "account_id": -1})
        }

        function onDisplaySignal2(index, program) {
            listModel.setProperty(index, "program", program)
        }

        function onDisplaySignal3(index, id) {
            listModel.setProperty(index, "account_id", id)
        }
    }
}
