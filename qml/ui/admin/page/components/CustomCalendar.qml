import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
 
 
Rectangle{
    width: 300
    height: 300
    color: "transparent"
    property alias calendar: the_calendar

    function month_label(month_number) {
        if (month_number === 1) {
            return "January"
        } else if (month_number === 2) {
            return "February"
        } else if (month_number === 3) {
            return "March"
        } else if (month_number === 4) {
            return "April"
        } else if (month_number === 5) {
            return "May"
        } else if (month_number === 6) {
            return "June"
        } else if (month_number === 7) {
            return "July"
        } else if (month_number === 8) {
            return "August"
        } else if (month_number === 9) {
            return "September"
        } else if (month_number === 10) {
            return "October"
        } else if (month_number === 11) {
            return "November"
        } else {
            return "December"
        }
    }
    
    Calendar{
        id:the_calendar
        minimumDate: new Date(2020, 0, 1)
        anchors.fill: parent
        anchors.margins: 2
        style: CalendarStyle {
            gridColor:"white"
 
            background: Rectangle{
                id:background
                anchors.fill: parent
                color: "#0B131C"
            }
 
            navigationBar:Item{
                height: the_calendar.height/8
                Canvas {
                    id: prevYear
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    width: parent.height/2
                    height: width
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.lineWidth = 2
                        ctx.strokeStyle = "white"
                        ctx.beginPath()
                        ctx.moveTo(0,height*3/4)
                        ctx.lineTo(width/2,height/4)
                        ctx.lineTo(width,height*3/4)
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
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.lineWidth = 2
                        ctx.strokeStyle = "white"
                        ctx.beginPath()
                        ctx.moveTo(0,height/4)
                        ctx.lineTo(width/2,height*3/4)
                        ctx.lineTo(width,height/4)
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
                    text:control.visibleYear
                    horizontalAlignment: text.AlignLeft
                    font.pixelSize: 15
                    color: "white"
                    font.letterSpacing: 1
                    font.bold: true
                }
 
                Canvas {
                    id: nextMonth
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    width: parent.height/2
                    height: width
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.lineWidth = 2
                        ctx.strokeStyle = "white"
                        ctx.beginPath()
                        ctx.moveTo(0,height/4)
                        ctx.lineTo(width/2,height*3/4)
                        ctx.lineTo(width,height/4)
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
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.lineWidth = 2
                        ctx.strokeStyle = "white"
                        ctx.beginPath()
                        ctx.moveTo(0,height*3/4)
                        ctx.lineTo(width/2,height/4)
                        ctx.lineTo(width,height*3/4)
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
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: prevMonth.left
                    anchors.rightMargin: 15
                    text: month_label(control.visibleMonth+1)
                    horizontalAlignment: text.AlignRight
                    font.pixelSize: 15
                    color: "white"
                    font.bold: true
                }
 
                Rectangle{
                    width: parent.width
                    height: 1
                    anchors.bottom: parent.bottom
                    color: "white"
                }
            }
            dayOfWeekDelegate: Item{
                height: the_calendar.height/8
                Label {
                    text: control.__locale.dayName(styleData.dayOfWeek, control.dayOfWeekFormat)
                    anchors.centerIn: parent
                    color: "white"
                    font.pixelSize: 14
                }
            }
            dayDelegate: Rectangle {
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
                        font.pixelSize: 13
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
