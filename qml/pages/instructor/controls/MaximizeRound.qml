import QtQuick 2.15
import QtQuick.Controls 2.15

RoundButton {
    id: customRoundBtn
    text: qsTr('')
    clip: true
    implicitHeight: 20
    implicitWidth: 20

    Rectangle {
        x: 0
        y: 0
        width: customRoundBtn.width
        height: customRoundBtn.height
        color: '#27CA41'
        radius: 10
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:16;height:20;width:20}
}
##^##*/
