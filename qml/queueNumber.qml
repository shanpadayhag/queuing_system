import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

import "controls"

Window {
    id: queueNumberUI
    width: 1400
    height: 800
    visible: true
    color: "#151515"
    title: qsTr("Hello Admin!!")

    Label {
        id: queueNumber
        x: 305
        y: 156
        width: 1224
        height: 138
        color: "#ffffff"
        text: qsTr("This is NUMBEEEERR!!!")
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 89
        anchors.topMargin: 272
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        id: label
        x: 549
        color: "#ffffff"
        text: qsTr("Please memorize or write down your priority number")
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
        anchors.topMargin: 106
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 25
    }

    CustomButton {
        id: customButton
        x: 553
        y: 523
        width: 278
        height: 60
        text: "Done"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 177
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 40
        onClicked: queueNumberUI.close()
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:1}D{i:2}
}
##^##*/
