import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

TextFieldStyle {
    id: root

    property color borderColor: "#7DC5B2"

    background: Item {
        implicitWidth: 200
        implicitHeight: 120

        Rectangle {
            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            height: parent.height * 0.05
            color: root.borderColor
        }
    }

    font {
        family: "Roboto"
        weight: Font.Light
        pixelSize: 88
    }

    textColor: "#34495e"
}
