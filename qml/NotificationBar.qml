import QtQuick 2.5
import QtQuick.Controls 1.4
import com.iktwo.visitor 1.0

Rectangle {
    id: root

    function close() {
        timerClose.stop()
        labelMessage.text = ""
        height = 0
    }

    function showMessage(message, type, duration) {
        labelMessage.text = message
        height = 180
        color = Notifications.colorForType(type)
        timerClose.interval = duration

        if (type === Notifications.Succes)
            labelMessage.color = "#34495e"
        else
            labelMessage.color = "#fcfcfc"

        if (duration === Notifications.Infinite)
            return

        timerClose.restart()
    }

    color: "#3498db"
    Behavior on height { NumberAnimation { easing.type: Easing.InOutCubic } }

    Timer {
        id: timerClose
        onTriggered: root.close()
    }

    Label {
        id: labelMessage

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left; leftMargin: 15
            right: parent.right; rightMargin: 15
        }

        clip: true
        color: "#ffffff"
        verticalAlignment: "AlignVCenter"
        maximumLineCount: 4
        wrapMode: "Wrap"

        font {
            pixelSize: 88
            family: "Roboto"
            weight: Font.Light
        }
    }

    Image {
        id: imageClose

        anchors {
            right: parent.right; rightMargin: 10
            verticalCenter: parent.verticalCenter
        }

        source: "qrc:/images/remove"
        height: Math.min(parent.height * 0.9, parent.width / 5)
        width: height
        sourceSize.height: Math.min(parent.height * 0.9, parent.width / 5)
        sourceSize.width: Math.min(parent.height * 0.9, parent.width / 5)

        MouseArea {
            anchors.fill: parent
            onClicked: root.close()
        }
    }
}
