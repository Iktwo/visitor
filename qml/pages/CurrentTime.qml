import QtQuick 2.5
import QtQuick.Controls 1.4

Item {
    height: column.height
    width: column.width

    Column {
        id: column

        Label {
            id: currentTime

            font {
                weight: Font.Light
                pixelSize: 200
            }

            color: "#ffffff"
        }

        Label {
            id: currentDate

            font {
                weight: Font.Light
                pixelSize: 80
            }

            color: "#ffffff"
        }

        Timer {
            running: true
            triggeredOnStart: true

            onTriggered: {
                var date = new Date()
                currentTime.text = date.toTimeString().substring(0, 5)
                interval = 1000 * (60 - date.getSeconds())

                currentDate.text = date.toLocaleDateString(Qt.locale(), "dddd MMMM d yyyy")
                restart()
            }
        }
    }
}
