import QtQuick
import QtQuick.Controls.Basic
ApplicationWindow {
    visible: true
    width: 600
    height: 500
    title: "HelloApp"
    flags: Qt.FramelessWindowHint | Qt.Window
    x: screen.desktopAvailableWidth - width - 12
    y: screen.desktopAvailableHeight - height - 48

    property string currTime: "00:00:00"
    property QtObject backend
    Connections {
        target: backend
        function onUpdated(msg) {
            currTime = msg;
        }
    }
    Rectangle {
        anchors.fill: parent
        Image {
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            source: "../images/cover.jpg"
            fillMode: Image.PreserveAspectCrop
        }
        Rectangle {
            anchors.fill: parent
            // anchors {
            //     bottom: parent.bottom
            //     left: parent.left
            // }
            color: "transparent"
            Text {
                //anchors.centerIn: parent
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                }
                text: currTime
                font.pixelSize: 36
                color: "red"
            }
        }
    }
}