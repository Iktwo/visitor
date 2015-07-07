import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ButtonStyle {
    property color backgroundColor: "#bb3498db"
    property color pressedColor: "#bb2980b9"

    label: Label {
        width: control.width

        horizontalAlignment: Text.AlignHCenter

        text: control.text
        font.pixelSize: 88
        color: "#fcfcfc"
    }

    background: Rectangle {
        color: control.pressed ? backgroundColor : pressedColor
        implicitWidth: 200
        implicitHeight: 120
        radius: 20
    }
}
