import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

TextFieldStyle {
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 120

        color: "#bbfdfdfd"
        radius: 20

        border {
            color: "#333333"
            width: 1
        }
    }

    font {
        pixelSize: 88
    }

    textColor: "#34495e"
}
