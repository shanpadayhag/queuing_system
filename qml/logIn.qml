import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Timeline 1.0
import "components"

Window {
    id: splashScreen
    width: 380
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("")

    flags: Qt.splashScreen | Qt.FramelessWindowHint

    function logInChecker() {
        if (login.chooseSoT(inputLogInSchoolID.text, inputLogInPassword.text)) {
            var component = Qt.createComponent("admin.qml")
            var win = component.createObject()
            win.show()
            visible = false
        }
    }

    function enrollmentQueue() {
        var component = Qt.createComponent("queueNumber.qml")
        var win = component.createObject()
        win.show()
        visible = true
    }

    Rectangle {
        id: bg
        x: 68
        y: 151
        width: 360
        height: 560
        color: "#151515"
        radius: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1


        CircularProgressBar {
            id: circularProgressBar
            x: 55
            y: 55
            opacity: 0
            text: "%"
            anchors.verticalCenter: parent.verticalCenter
            value: 100
            strokeBgWidth: 9
            progressWidth: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: logoImage
            x: 143
            width: 300
            height: 216
            opacity: 1
            anchors.top: parent.top
            source: "../imgs/compstud_logo-removebg-preview.png"
            anchors.topMargin: 18
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }

        CustomTextField {
            id: inputLogInSchoolID
            x: 30
            y: 359
            opacity: 1
            anchors.bottom: inputLogInPassword.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 15
            placeholderText: "School ID"
        }

        CustomTextField {
            id: inputLogInPassword
            x: 30
            y: 416
            opacity: 1
            anchors.bottom: logInBtn.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 15
            placeholderText: "Password"
            echoMode: TextInput.Password
        }

        CustomButton {
            id: logInBtn
            x: 172
            y: 442
            width: 300
            height: 40
            opacity: 0
            text: "Sign in"
            anchors.bottom: enrollBtn.top
            anchors.bottomMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                logInChecker()

            }
        }

        Label {
            id: label
            x: 55
            y: 287
            opacity: 1
            color: "#ffffff"
            text: qsTr("Sign in to Queuing System")
            anchors.bottom: label1.top
            anchors.bottomMargin: 10
            anchors.horizontalCenterOffset: 0
            font.pointSize: 16
            font.family: "sego ui"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: label1
            x: 110
            y: 321
            width: 140
            height: 25
            opacity: 1
            color: "#ffffff"
            text: qsTr("School ID and Password")
            anchors.bottom: inputLogInSchoolID.top
            anchors.bottomMargin: 20
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
            font.family: "sego ui"
        }

        CustomButton {
            id: closeBtn
            x: 305
            width: 30
            height: 30
            opacity: 1
            text: "X"
            anchors.right: parent.right
            anchors.top: parent.top
            colorDefault: "#00000000"
            font.bold: true
            font.pointSize: 12
            colorMouseOver: "#ff5555"
            anchors.rightMargin: 15
            anchors.topMargin: 15
            onClicked: splashScreen.close()
        }

        CustomButton {
            id: enrollBtn
            x: 30
            y: 485
            width: 300
            height: 40
            opacity: 0
            text: "Get queue number for enrollment"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 45
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                enrollmentQueue()
            }
        }

    }

    DropShadow{
        anchors.fill: bg
        source: bg
        verticalOffset: 0
        horizontalOffset: 0
        radius: 10
        color: "#000000"
        z: 0
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                duration: 3000
                loops: 1
                to: 3000
                from: 0
            }
        ]
        enabled: true
        endFrame: 3000
        startFrame: 0

        KeyframeGroup {
            target: circularProgressBar
            property: "value"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 100
                frame: 1300
            }
        }

        KeyframeGroup {
            target: circularProgressBar
            property: "opacity"
            Keyframe {
                value: 1
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 1300
            }

            Keyframe {
                value: 0
                frame: 1800
            }
        }

        KeyframeGroup {
            target: label
            property: "opacity"
            Keyframe {
                value: 0
                frame: 1898
            }

            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 2400
            }
        }

        KeyframeGroup {
            target: label1
            property: "opacity"
            Keyframe {
                value: 0
                frame: 2001
            }

            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 2500
            }
        }

        KeyframeGroup {
            target: inputLogInSchoolID
            property: "opacity"
            Keyframe {
                value: 0
                frame: 2101
            }

            Keyframe {
                value: 1
                frame: 2600
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: inputLogInPassword
            property: "opacity"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 2200
            }

            Keyframe {
                value: 1
                frame: 2700
            }
        }

        KeyframeGroup {
            target: logInBtn
            property: "opacity"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 2300
            }

            Keyframe {
                value: 1
                frame: 2801
            }
        }

        KeyframeGroup {
            target: logoImage
            property: "opacity"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 0
                frame: 1299
            }

            Keyframe {
                value: 1
                frame: 1800
            }
        }

        KeyframeGroup {
            target: bg
            property: "height"
            Keyframe {
                value: 360
                frame: 1299
            }

            Keyframe {
                easing.bezierCurve: [0.223,-0.000898,0.22,0.997,1,1]
                value: 560
                frame: 1901
            }

            Keyframe {
                value: 360
                frame: 0
            }
        }

        KeyframeGroup {
            target: enrollBtn
            property: "opacity"
            Keyframe {
                value: 1
                frame: 2900
            }

            Keyframe {
                value: 0
                frame: 2400
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }
    }

    Connections {
        target: login

    }


}


/*##^##
Designer {
    D{i:0}D{i:22;property:"opacity";target:"label"}D{i:26;property:"opacity";target:"label1"}
D{i:30;property:"opacity";target:"inputLogInSchoolID"}D{i:32;property:"opacity";target:"inputLogInSchoolID"}
D{i:34;property:"opacity";target:"inputLogInPassword"}D{i:38;property:"opacity";target:"logInBtn"}
D{i:46;property:"height";target:"bg"}D{i:12}
}
##^##*/
