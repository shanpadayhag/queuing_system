import QtQuick 2.4
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import "components"

Item {
    Rectangle {
        id: rectangle
        color: "#1e1e1e"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        function acceptUser() {
            modelName.insert(0, {'name': 'Ulol', 'name1': ''})
        }

        Rectangle {
            id: rectangle1
            color: "#313131"
            anchors.fill: parent
            anchors.rightMargin: 360

            Rectangle {
                id: listViewRectangle
                color: "#1e1e1e"
                radius: 20
                border.color: "#00000000"
                anchors.fill: parent
                anchors.topMargin: 109
                anchors.rightMargin: 30
                anchors.leftMargin: 30
                anchors.bottomMargin: 30
                clip: true

                ListModel {
                    id: modelName
                    ListElement {name: 'Mariel Padilla'; name1: 'asf'}
                    ListElement {name: 'Shan Padayhag'; name1: 'adfasdf'}
                    ListElement {name: 'Coleen sa ML45'; name1: 'adfasdf'}
                    ListElement {name: 'Coleen nga Garcia'; name1: 'adfasdf'}
                    ListElement {name: 'Ryan Bang'; name1: 'adfasdf'}
                    ListElement {name: 'Angel Locsin'; name1: 'adfasdf'}
                    ListElement {name: 'Anne Curtis'; name1: 'adfasdf'}
                    ListElement {name: 'Vice Ganda'; name1: 'adfasdf'}
                    ListElement {name: 'Pres Panget'; name1: 'adfasdf'}
                }

                Component {
                    id: delegateName
                    Item {
                        width: parent.width
                        height: 30
                        Text {
                            height: 30
                            text: name
                            anchors.left: parent.left
                            verticalAlignment: Text.AlignVCenter
                            anchors.leftMargin: 25
                            font.pointSize: 14
                            color: '#FFFFFF'
                        }
                        Text {
                            height: 30
                            text: name1
                            anchors.left: parent.left
                            verticalAlignment: Text.AlignVCenter
                            anchors.leftMargin: 300
                            font.pointSize: 14
                            color: '#FFFFFF'
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: listName.currentIndex = index
                        }
                    }
                }
                ListView {
                    id: listName
                    x: 304
                    y: 50
                    anchors.fill: parent
                    anchors.rightMargin: 20
                    anchors.leftMargin: 20
                    anchors.bottomMargin: 20
                    anchors.topMargin: 20
                    clip: true
                    model: modelName
                    delegate: delegateName
                    highlight: Rectangle {
                        width: parent.width
                        color: '#313131'
                        radius: 10
                    }
                }
            }

            Label {
                id: label
                x: 411
                y: 54
                color: "#ffffff"
                text: qsTr("Users List")
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.topMargin: 42
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 24
            }
        }

        CustomButton {
            id: addBtn
            x: 1052
            y: 381
            width: 179
            height: 45
            text: "Add"
            anchors.right: parent.right
            anchors.bottom: editBtn.top
            anchors.rightMargin: 92
            anchors.bottomMargin: 40
            font.pointSize: 14
            onClicked: {
                modelName.append({name: 'yoho', name1: 'yaho'})
            }
        }

        CustomButton {
            id: editBtn
            x: 814
            y: 481
            width: 179
            height: 45
            text: "Edit"
            anchors.right: parent.right
            anchors.bottom: removeBtn.top
            anchors.rightMargin: 92
            anchors.bottomMargin: 40
            font.pointSize: 14
        }

        CustomButton {
            id: removeBtn
            x: 1037
            y: 580
            width: 179
            height: 45
            text: "Delete"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 92
            anchors.bottomMargin: 70
            font.pointSize: 14
        }

        CustomTextField {
            id: nameField
            x: 976
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 32
            anchors.topMargin: 55
            font.pointSize: 14
        }

        CustomTextField {
            id: sIDField
            x: 976
            anchors.right: parent.right
            anchors.top: nameField.bottom
            anchors.rightMargin: 32
            anchors.topMargin: 40
            font.pointSize: 14
        }

        CustomTextField {
            id: programField
            x: 976
            anchors.right: parent.right
            anchors.top: sIDField.bottom
            anchors.topMargin: 40
            anchors.rightMargin: 32
            font.pointSize: 14
        }

        CustomTextField {
            id: typeField
            x: 976
            anchors.right: parent.right
            anchors.top: programField.bottom
            anchors.topMargin: 40
            anchors.rightMargin: 32
            font.pointSize: 14
        }


        //'listSwipeName.currentIndex = index' ### Use this to get the index
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:693;width:1308}D{i:2}D{i:23}D{i:25}
D{i:26}D{i:27}D{i:28}
}
##^##*/
