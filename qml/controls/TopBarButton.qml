import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Button {
    id: btnTopBar

    property url btnIconSource: "../../imgs/svg_images/minimize_icon.svg"
    property color btnColorDefault: "#252526"
    property color btnColorMouseOver: "#6D6D6E"
    property color btnColorClicked: "#181819"

    QtObject {
        id: internal

        property var dynamicColor: if (btnTopBar.down) {
                                       btnTopBar.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    height: 35
    width: 35

    background: Rectangle {
        id: bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: false
        }

        ColorOverlay {
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:6}
}
##^##*/
