import QtQuick 2.0
import QtQuick.Controls 2.15
import "controls"

Item {
    property int indexx: 0
    Rectangle {
        id: rectangle
        color: "#13141f"
        anchors.fill: parent



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
                ListElement {pics: '../../../imgs/favicon.png'; name: 'Mariel Padilla'; sID: '12312312312'; dateAndTime: 'dateTime'; concern: 'so yung concern ko is that kelangan ko ng something na needed ko na bagay so nandito ako ngayon para mag hingi ng tulong sa mga nagbibigay ng tulong so patulong nalang po salamat HAHAHAHAHAHAHHAH ano pa ba magandang sabihin so yung usto ko lang may madagdag dito kasi nga kelangan ko tapos yorn ay oo kapagod mag code gurl. so ayon tapos kelangan ko pa mag dagdag para mag 500 yung word count ko no and di ko na alam anong idadagdag HAHAHAH tapos 60 nalang kulang since kanina tapos type lang ako ng '}
            }

            Component {
                id: delegateName
                Rectangle {
                    height: listView.height
                    width: listView.width
                    color: '#00000000'

                    Image {
                        id: requesterImage
                        width: 175
                        height: 175
                        anchors.top: parent.top
                        source: pics
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 75 //195
                    }

                    Label {
                        id: requesterName
                        text: name
                        font.pointSize: 15
                        anchors.top: requesterImage.bottom
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 20 //239
                        color: '#FFFFFF'
                    }

                    Label {
                        id: requesterID
                        text: sID
                        font.pointSize: 12
                        anchors.top: requesterName.bottom
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 20 //273
                        color: '#FFFFFF'
                    }

                    Label {
                        id: requesterProgram
                        text: dateAndTime
                        font.pointSize: 12
                        anchors.top: requesterID.bottom
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 20 //312
                        color: '#FFFFFF'
                    }

                    Label {
                        id: concernLabel
                        text: 'Concern:'
                        font.pointSize: 12
                        font.bold: true
                        anchors.left: parent.left
                        anchors.leftMargin: 50
                        anchors.top: requesterProgram.bottom
                        anchors.topMargin: 30
                        color: '#ffffff'
                    }

                    TextArea {
                        id: requesterConcern
                        readOnly: true
                        anchors.left: parent.left
                        anchors.leftMargin: 50
                        anchors.right: parent.right
                        anchors.rightMargin: 50
                        anchors.top: concernLabel.bottom
                        anchors.topMargin: 10
                        text: concern
                        font.pointSize: 12
                        wrapMode: Text.Wrap
                        color: '#FFFFFF'
                    }
                }
            }

            ListView {
                id: listView
                anchors.fill: parent
                snapMode: ListView. SnapOneItem
                orientation: ListView.Horizontal
                
                highlightRangeMode: ListView.StrictlyEnforceRange
                currentIndex: 0
                onCurrentIndexChanged: {
                    console.log("current selected index is: "+currentIndex);
                }

                model: modelName
                delegate: delegateName

                Repeater {
                    Loader {
                        active: listView.isNextItem || listView.isPreviousItem || listView.isCurrentItem
                    }
                }
            }
        }

        Rectangle {
            id: rectangle2
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle1.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            CustomButton {
                id: customButton
                x: 645
                y: 789
                width: 175
                height: 40
                text: "Accept"
                anchors.bottom: parent.bottom
                font.bold: true
                font.pointSize: 12
                anchors.bottomMargin: 45
                anchors.horizontalCenterOffset: -110
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    console.log(indexx+listView.currentIndex)
                }
            }

            CustomButton {
                id: customButton1
                x: 865
                y: 789
                width: 175
                height: 40
                text: "Decline"
                anchors.bottom: parent.bottom
                font.bold: true
                font.pointSize: 12
                anchors.bottomMargin: 45
                anchors.horizontalCenterOffset: 110
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
    /*modelname.append({'pics': , 'name': , 'sID': , 'dateAndTime': , 'concern': })*/
    Component.onCompleted: {
        console.log("current selected index is: "+listView.currentIndex);
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:864;width:1609}
}
##^##*/
