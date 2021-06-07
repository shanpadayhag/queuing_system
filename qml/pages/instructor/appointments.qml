import QtQuick 2.15
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

        Rectangle {
            id: listViewRectangle
            color: "#1e1e1e"
            border.color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 175
            clip: true

            ListModel {
                id: modell
                ListElement {pics: ''; name: ''; sID: ''; program: ''; concern: ''}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Mariel Padilla'; sID: '0123';program: 'BSCS'; concern: ' asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadfa'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Shan Padayhag'; sID: '0124';program: 'BSIS'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Vanessa Amandoro'; sID: '0125';program: 'BSIT'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Donna Dagcuta'; sID: '0126';program: 'BSIS'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Raynhard Yray'; sID: '0127';program: 'BSIT'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Sherwin Bularon'; sID: '0128';program: 'BSCS'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Hans Rahnel'; sID: '0129';program: 'BSIS'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Rahnel Ocampo'; sID: '01210';program: 'BSCS'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Voltaire ISkayWalayCodingDAW'; sID: '01211';program: 'BSIT'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Gerald Bantilan'; sID: '01212';program: 'BSCS'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Ryan James'; sID: '01213';program: 'BSIS'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Ryan Bangs'; sID: '01214';program: 'BSCS'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'James Dobol-oseben'; sID: '01215';program: 'BSCS'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Bond Paper'; sID: '01216';program: 'BSIT'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Nano Nona'; sID: '01217';program: 'BSCS'; concern: 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadf'}
            }


            ListView {
                id: listView
                anchors.fill: parent
                clip: true
                anchors.topMargin: 135
                snapMode: ListView. SnapOneItem
                orientation: ListView.Horizontal

                model: modell

                delegate: Rectangle {
                    id: rectangle1
                    width: ListView.view.width
                    height: ListView.view.height
                    color: "#00000000"

                    Image {
                        anchors.top: parent.top
                        source: model.pics
                        sourceSize.height: 150
                        sourceSize.width: 150
                        anchors.topMargin: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Label {
                        text: model.name
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 150
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 14
                        color: "#FFFFFF"
                    }
                    Label {
                        text: model.sID
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 175
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 14
                        color: "#FFFFFF"
                    }
                    Label {
                        text: model.program
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 200
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 14
                        color: "#FFFFFF"
                    }
                    Text {
                        text: model.concern
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignJustify
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.WordWrap
                        font.bold: true
                        anchors.topMargin: 250
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 14
                        color: "#FFFFFF"
                    }
                }
                currentIndex: 1
                Repeater {
                        Loader {
                            active: listView.isNextItem || listView.isPreviousItem || listView.isCurrentItem
                    }
                }
            }

            Label {
                id: label
                x: 225
                color: "#ffffff"
                text: qsTr("Appointment List")
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 54
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 24
                font.bold: true
            }
        }

        CustomButton {
            id: acceptBtn
            x: 428
            y: 581
            width: 120
            height: 45
            text: "Accept"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 67
            anchors.horizontalCenterOffset: -120
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 15
        }

        CustomButton {
            id: declineBtn
            x: 764
            y: 581
            width: 120
            height: 45
            text: "Decline"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 67
            anchors.horizontalCenterOffset: 120
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 15
        }
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}
}
##^##*/
