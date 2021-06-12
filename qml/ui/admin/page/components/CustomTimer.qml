import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3
import QtQuick.Layouts 1.1

Item {
    implicitWidth: 280; implicitHeight: 280
    property string theHour: outer.currentItem.text
    property string theMinute: inner.currentItem.text

    RowLayout {
        id: rowLayout
        anchors.centerIn: parent
        Text {
            id: hour
            font.pixelSize: 30
            font.bold: true
            color: 'white'
            text: theHour
        }
        Text {
            id: div
            font.pixelSize: 30
            font.bold: true
            color: 'white'
            text: qsTr(":")
        }
        Text {
            id: minute
            font.pixelSize: 30
            font.bold: true
            color: 'white'
            text: theMinute
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                outer.choiceActive = inner.choiceActive = !outer.choiceActive
            }
        }
    }


    PathView {
        id: outer
        property bool pressed: false
        model: 12

        interactive: false
        highlightRangeMode:  PathView.NoHighlightRange
        property bool choiceActive: false

        highlight: Rectangle {
            id: rect
            width: 30 * 1.5
            height: width
            radius: width / 2
            border.color: "darkgray"
            color: "#0B131C"
            visible: outer.choiceActive
        }

        delegate: Item {
            id: del
            width: 30
            height: 30
            property bool currentItem: PathView.view.currentIndex == index
            property alias text : textHou.text
            Text {
                id: textHou
                anchors.centerIn: parent
                font.pixelSize: 24
                font.bold: currentItem
                text: index + 1
                color: currentItem ? "white" : "gray"
            }

            MouseArea {
                anchors.fill: parent
                enabled: outer.choiceActive
                onClicked: outer.choiceActive = false
                hoverEnabled: true
                onEntered: outer.currentIndex = index
            }
        }

        path: Path {
            startX: 200; startY: 40
            PathArc {
                x: 80; y: 240
                radiusX: 110; radiusY: 110
                useLargeArc: false
            }
            PathArc {
                x: 200; y: 40
                radiusX: 110; radiusY: 110
                useLargeArc: false
            }
        }
    }

    PathView {
        id: inner
        property bool pressed: false
        model: 6
        interactive: false
        highlightRangeMode:  PathView.NoHighlightRange
        property bool choiceActive: false

        highlight: Rectangle {
            width: 30 * 1.5
            height: width
            radius: width / 2
            border.color: "darkgray"
            color: "#111D2B"
            visible: inner.choiceActive
        }

        delegate: Item {
            width: 30
            height: 30
            property bool currentItem: PathView.view.currentIndex == index
            property alias text : textMin.text
            Text {
                id: textMin
                anchors.centerIn: parent
                font.pixelSize: 24
                font.bold: currentItem
                text: ('00'+index * 10).slice(-2)//index * 15 //('00'+index * 15).slice(-2);
                color: currentItem ? "white" : "gray"
            }

            MouseArea {
                anchors.fill: parent
                enabled: inner.choiceActive
                onClicked: inner.choiceActive = false
                hoverEnabled: true
                onEntered: inner.currentIndex = index
            }
        }

        path: Path {
            startX: 140; startY: 60
            PathArc {
                x: 140; y: 220
                radiusX: 40; radiusY: 40
                useLargeArc: false
            }
            PathArc {
                x: 140; y: 60
                radiusX: 40; radiusY: 40
                useLargeArc: false
            }
        }
    }

    onVisibleChanged: {
        var d = new Date();
        outer.currentIndex = d.getUTCHours() % 12
        inner.currentIndex = d.getMinutes() / 10
    }
}
