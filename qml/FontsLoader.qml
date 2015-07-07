import QtQuick 2.0

Item {
    property var fonts: []
    property string pathToFonts

    Repeater {
        model: fonts

        delegate: Item {
            FontLoader {
                source: pathToFonts + modelData
            }
        }
    }
}
