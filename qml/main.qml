import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Timeline 1.0

Window {
    id: window
    width: 553
    height: 344
    visible: true
    color: "#00000000"
    
    flags: Qt.SplashScreen | Qt.FramelessWindowHint

    Timer {
        id: timer

        function startTimer(callback, milliseconds) {
            timer.interval = milliseconds;
            timer.repeat = false;
            timer.triggered.connect(callback);
            timer.start();
        }

        function stopTimer(callback) {
            timer.stop();
            timer.triggered.disconnect(callback);
        }
    }

    Rectangle {
        id: rectangle1
        width: 543
        height: 334
        opacity: 1
        color: "#0b131c"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        clip: true
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0
                color: "#0B131C"
            }
            GradientStop {
                position: 1
                color: "#233A55"
            }
        }

        Label {
            id: label
            text: "New Program Available!"
            color: "#FFFFFF"
            font.pointSize: 20
            font.letterSpacing: 2
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -20
            anchors.left: parent.left
            anchors.leftMargin: 50
        }

        Label {
            id: label1
            text: "BS Entertainment and Multimedia Computing"
            font.pointSize: 8
            color: "#FFFFFF"
            font.letterSpacing: 2
            anchors.top: label.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 50
        }
        
        Rectangle {
            id: rectangle2
            height: 10
            opacity: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            color: "#0B131C"

            Rectangle {
                id: rectangle
                width: 543
                opacity: 1
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                color: "#233A55"
            }
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                duration: 4400
                running: true
                loops: 1
                to: 4400
                from: 0
            }
        ]
        endFrame: 4400
        enabled: true
        startFrame: 0

        KeyframeGroup {
            target: rectangle
            property: "width"

            Keyframe {
                value: 0
                frame: 8
            }
            
            Keyframe {
                easing.bezierCurve: [0.659,0.00129,0.563,1,1,1]
                value: 543
                frame: 4395
            }
        }
    }
    Connections {
        target: SplashScreen
    }

    Component.onCompleted: {
        timer.startTimer(function done() {
            SplashScreen.userInterface();
            window.close()
        }, 4500)
        timer.stopTimer(done())
    }
}
