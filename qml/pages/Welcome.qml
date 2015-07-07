import QtQuick 2.5
import QtQuick.Controls 1.4

FocusScope {
    id: root

    signal clicked

    CurrentTime {
        anchors {
            top: parent.top; topMargin: 20
            left: parent.left; leftMargin: 40
        }
    }

    Label {
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left; leftMargin: parent.width * 0.1
            right: parent.right; rightMargin: parent.width * 0.1
        }

        font {
            capitalization: Font.AllUppercase
            weight: Font.Light
            pixelSize: 100
        }

        horizontalAlignment: Text.AlignHCenter

        text: "touch anywhere to register"

        wrapMode: Text.Wrap
        color: "white"
    }

    MouseArea {
        anchors.fill: parent

        onClicked: root.clicked()
    }
}

