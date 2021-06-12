import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Rectangle{
    width: 300
    height: 300
    color: "#00000000"
    property alias calendar: the_calendar
    // Here is not the font color and so on, as a control need to define these
    Calendar{
        id:the_calendar
        anchors.fill: parent
        anchors.margins: 2
        style: CalendarStyle {
            gridColor: '#FFFFFF'
            //gridVisible: false

            background: Rectangle{
                id:background
                anchors.fill: parent
                color: '#13141F'
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
                        ctx.lineWidth = 1
                        ctx.strokeStyle = '#FFFFFF'
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
                        ctx.lineWidth = 1
                        ctx.strokeStyle = '#FFFFFF'
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
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 15
                    font.bold: true
                    color: '#FFFFFF'
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
                        ctx.lineWidth = 1
                        ctx.strokeStyle = '#FFFFFF'
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
                        ctx.lineWidth = 1
                        ctx.strokeStyle = '#FFFFFF'
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
                    }
                }
                Label {
                    id: labelMonth
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: prevMonth.left
                    anchors.rightMargin: 15
                                         //Note that the original month of Date is 0.
                                         text: (control.visibleMonth+1)+qsTr('month')
                    //elide: Text.ElideRight
                    horizontalAlignment: Text.AlignRight
                    font.pixelSize: 15
                    font.bold: true
                    color: '#FFFFFF'
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
                    color: 'white'
                    font.pixelSize: 15
                    font.bold: true
                }
            }
            dayDelegate: Item {
                Rectangle {
                    id: rect
                    anchors.fill: parent
                    color: '#13141F'

                    Label {
                        id: dayDelegateText
                        text: styleData.date.getDate()
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignRight
                        font.pointSize: 12
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
