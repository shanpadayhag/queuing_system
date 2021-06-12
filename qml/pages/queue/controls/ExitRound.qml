import QtQuick 2.15
import QtQuick.Controls 2.15

RoundButton {
    id: customRoundBtn
    text: qsTr('')
    clip: true
    implicitHeight: 15
    implicitWidth: 15

    Rectangle {
        x: 0
        y: 0
        width: customRoundBtn.width
        height: customRoundBtn.height
        color: '#EE5C53'
        radius: 10
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.01;height:20;width:20}
}
##^##*/
