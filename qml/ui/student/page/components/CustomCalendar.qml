import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
 
 
Rectangle{
    width: 300
    height: 300
    color: "transparent"
    property alias calendar: the_calendar
    // Here is not the font color and so on, as a control need to define these
    Calendar{
        id:the_calendar
        minimumDate: new Date(2020, 0, 1)
        anchors.fill: parent
        anchors.margins: 2
        style: CalendarStyle {
            gridColor:"white"
            //gridVisible: false
 
            background: Rectangle{
                id:background
                anchors.fill: parent
                color: "#0B131C"
            }
 
                         //title year and month
            navigationBar:Item{
                //color: "transparent"
                height: the_calendar.height/8
                Canvas {
                    id: prevYear
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    width: parent.height/2
                    height: width
                    //color: bgColor
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.lineWidth = 2
                        ctx.strokeStyle = "white"
                        ctx.beginPath()
                        ctx.moveTo(0,height*3/4)
                        ctx.lineTo(width/2,height/4)
                        ctx.lineTo(width,height*3/4)
                        //ctx.closePath()
                        ctx.stroke()
                    }
 
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            control.showPreviousYear()
                        }
                        cursorShape: Qt.PointingHandCursor
                    }
                }
                Canvas {
                    id: nextYear
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: prevYear.right
                    anchors.leftMargin: 10
                    width: parent.height/2
                    height: width
                    //color: bgColor
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.lineWidth = 2
                        ctx.strokeStyle = "white"
                        ctx.beginPath()
                        ctx.moveTo(0,height/4)
                        ctx.lineTo(width/2,height*3/4)
                        ctx.lineTo(width,height/4)
                        //ctx.closePath()
                        ctx.stroke()
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            control.showNextYear()
                        }
                        cursorShape: Qt.PointingHandCursor
                    }
                }
                Label {
                    id: labelYear
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: nextYear.right
                    anchors.leftMargin: 15
                                         //text: the_calendar.selectedDate.getFullYear()+qsTr('year')
                                         text:control.visibleYear
                    //elide: Text.ElideRight
                    horizontalAlignment: text.AlignLeft
                    font.pointSize: 12
                    color: "white"
                }
 
                Canvas {
                    id: nextMonth
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    width: parent.height/2
                    height: width
                    //color: bgColor
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.lineWidth = 2
                        ctx.strokeStyle = "white"
                        ctx.beginPath()
                        ctx.moveTo(0,height/4)
                        ctx.lineTo(width/2,height*3/4)
                        ctx.lineTo(width,height/4)
                        //ctx.closePath()
                        ctx.stroke()
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            control.showNextMonth()
                        }
                        cursorShape: Qt.PointingHandCursor
                    }
                }
                Canvas {
                    id: prevMonth
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: nextMonth.left
                    anchors.rightMargin: 10
                    width: parent.height/2
                    height: width
                    //color: bgColor
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.lineWidth = 2
                        ctx.strokeStyle = "white"
                        ctx.beginPath()
                        ctx.moveTo(0,height*3/4)
                        ctx.lineTo(width/2,height/4)
                        ctx.lineTo(width,height*3/4)
                        //ctx.closePath()
                        ctx.stroke()
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            control.showPreviousMonth()
                        }
                        cursorShape: Qt.PointingHandCursor
                    }
                }
                Label {
                    id: labelMonth
                    //model: 
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: prevMonth.left
                    anchors.rightMargin: 15
                                         //Note that the original month of Date is 0.
                                         text: (control.visibleMonth+1)+qsTr('month')
                    //elide: Text.ElideRight
                    horizontalAlignment: text.AlignRight
                    font.pointSize: 12
                    color: "white"
                }
 
                Rectangle{
                    width: parent.width
                    height: 1
                    anchors.bottom: parent.bottom
                    color: "white"
                }
            }
                         //week
            dayOfWeekDelegate: Item{
                //color: "transparent"
                height: the_calendar.height/8
                Label {
                    text: control.__locale.dayName(styleData.dayOfWeek, control.dayOfWeekFormat)
                    anchors.centerIn: parent
                    color: "white"
                    font.pointSize: 12
                }
            }
            dayDelegate: Rectangle {
                                 //Checked - the month is not selected - other
                Rectangle {
                    id: rect
                    anchors.fill: parent
                    color: styleData.selected
                        ? "#0B131C"
                        : (styleData.visibleMonth && styleData.valid
                            ? "#0B131C"
                            : "#172638");

                    Label {
                        id: dayDelegateText
                        text: styleData.date.getDate()
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignRight
                        font.pointSize: 10
                        color: '#FFFFFF'
                        font.bold: styleData.selected
                    }

                    MouseArea {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        width: styleData.selected ? parent.width / 2 : 0
                        height: styleData.selected ? parent.height / 2 : 0
                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"
                            border.color: "#FFFFFF"
                        }
                    }
                }
            }
 
        }
    }
}
