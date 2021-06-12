import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.15
import "../"

Window {
    id: window
    width: 280
    height: 340
    visible: true
    color: "transparent"
    
    flags: Qt.SplashScreen | Qt.FramelessWindowHint

    property string message: ""
    
    function done() {
        window.destroy()
    }

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
        id: rectangle
        radius: 10
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        color: "transparent"
        clip: true

        Image {
            id: image
            anchors.fill: parent
            source: "../../../img/background/error_pop_up.svg"
            fillMode: Image.PreserveAspectFit

            Rectangle {
                id: rectangle1
                x: 8
                y: 209
                width: 260
                height: 170
                color: "#00000000"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 0

                Label {
                    id: label
                    x: 69
                    color: "#ffffff"
                    text: qsTr("Something went wrong")
                    anchors.top: parent.top
                    font.pixelSize: 17
                    anchors.topMargin: 35
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    id: task_message
                    x: 99
                    color: "#ffffff"
                    text: message
                    anchors.top: label.bottom
                    font.pixelSize: 13
                    anchors.topMargin: 30
                    anchors.bottomMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.right: parent.right 
                    anchors.rightMargin: 20
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }

    DropShadow {
        anchors.fill: rectangle
        source: rectangle
        verticalOffset: 0
        horizontalOffset: 0
        radius: 10
        color: "#80000000"
        z: 0
    }
    
    QMLConnections {
        id: qmlConnections
    }

    Component.onCompleted: timer.startTimer(done, 3000)
}
