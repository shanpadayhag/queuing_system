import QtQuick 2.0
import QtQuick.Controls 2.15

Switch {
        id: control
        checked: true

        indicator: Rectangle {
            implicitWidth: 48
            implicitHeight: 26
            x: control.width - width - control.rightPadding
            y: parent.height / 2 - height / 2
            radius: 13
            color: control.checked ? "#27CA41" : "#616269"
            border.color: "#00000000"

            Rectangle {
                x: control.checked ? parent.width - width : 0
                width: 26
                height: 26
                radius: 13
                border.color: "#00000000"
            }
        }
    }
/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:2;height:480;width:640}
}
##^##*/
