import QtQuick 2.7
import QtGraphicalEffects 1.0

Item {

    property color overlayColor: "transparent"
    property url svgSource: ""

    Image {
        id: img
        anchors.fill: parent
        source: svgSource

        antialiasing: true
        visible: false
    }
    ColorOverlay{
        anchors.fill: img
        source: img
        color: overlayColor
    }

}
