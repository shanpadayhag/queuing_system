import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnLeftMenu
    text: qsTr("Text")

    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 18
    property int iconHeight: 18
    property color activeMenuColor: "#27CA41"
    property bool isActive: false

    QtObject{
        id: internal

        property var dynamicColor: if(btnLeftMenu.down){
                                       btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    implicitWidth: 110
    implicitHeight: 30

    background: Rectangle{
        id: bgBtn
        color: 'transparent'
    }

    contentItem: Item{
        anchors.fill: parent
        id: content
        Text{
            color: "#ffffff"
            text: btnLeftMenu.text
            font: btnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.25;height:30;width:110}
}
##^##*/
