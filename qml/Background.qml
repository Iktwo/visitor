import QtQuick 2.5
import QtGraphicalEffects 1.0

Item {
    property alias source: imageBackground.source

    function blur() {
        fastBlur.opacity = 0.6
        rectangleBlack.opacity = 0.3
    }

    function hideBlur() {
        fastBlur.opacity = 0
        rectangleBlack.opacity = 0.2
    }

    Image {
        id: imageBackground

        anchors.fill: parent

        fillMode: Image.PreserveAspectCrop
    }

    FastBlur {
        id: fastBlur

        anchors.fill: parent
        source: imageBackground
        radius: 32
        opacity: 0

        Behavior on opacity { NumberAnimation { } }
    }

    Rectangle {
        id: rectangleBlack

        anchors.fill: parent

        color: "#000000"

        opacity: 0.2

        Behavior on opacity { NumberAnimation { } }
    }
}
