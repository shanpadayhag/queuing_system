import QtQuick 2.0
import QtQuick.Controls 2.15
import "controls"

Item {
    Rectangle {
        id: rectangle
        color: "#13141f"
        anchors.fill: parent

        CustomButton {
            id: customButton
            x: 251
            y: 369
            width: 100
            height: 30
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 45
            anchors.horizontalCenterOffset: -110
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomButton {
            id: customButton1
            x: 417
            y: 369
            width: 100
            height: 30
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 45
            anchors.horizontalCenterOffset: 110
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rectangle1
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 115
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            ListModel {
                id: modelName
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
                snapMode: ListView. SnapOneItem
                orientation: ListView.Horizontal

                model: modelName
                delegate:Rectangle {
                    id: delegateName
                    height: listView.height
                    width: listView.width
                    color: '#00000000'

                    Image {
                        width: 175
                        height: 175
                        anchors.top: parent.top
                        source: model.pics
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 20
                    }

                    Label {
                        text: model.name
                        font.pointSize: 15
                        anchors.top: parent.top
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 205
                        color: '#FFFFFF'
                    }

                    Label {
                        text: model.sID
                        font.pointSize: 15
                        anchors.top: parent.top
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 235
                        color: '#FFFFFF'
                    }

                    Label {
                        text: model.program
                        font.pointSize: 15
                        anchors.top: parent.top
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 265
                        color: '#FFFFFF'
                    }

                    Label {
                        text: model.concern
                        font.pointSize: 15
                        anchors.top: parent.top
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 315
                        color: '#FFFFFF'
                    }
                }

                currentIndex: 1
                Repeater {
                        Loader {
                            active: listView.isNextItem || listView.isPreviousItem || listView.isCurrentItem
                    }
                }
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:444;width:784}D{i:3}D{i:4}
}
##^##*/
