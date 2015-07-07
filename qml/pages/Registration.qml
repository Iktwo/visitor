import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import ".."

FocusScope {
    MouseArea {
        anchors.fill: parent
        onClicked: Qt.inputMethod.hide()
    }

    Rectangle {
        anchors {
            top: parent.top; topMargin: 150
            left: parent.left; leftMargin: 400
            right: parent.right; rightMargin: 400
        }

        height: column.height + 300
        color: "#ddF2F2F2"

        Column {
            id: column

            anchors.centerIn: parent

            spacing: 50

            Row {
                spacing: 50

                TextField {
                    width: 600

                    placeholderText: "First Name"

                    style: TextFieldStyleBig { }

                    inputMethodHints: Qt.ImhNoPredictiveText
                }

                TextField {
                    width: 600

                    placeholderText: "Last Name"

                    style: TextFieldStyleBig { }

                    inputMethodHints: Qt.ImhNoPredictiveText
                }
            }

            TextField {
                width: 1250

                placeholderText: "Email"

                style: TextFieldStyleBig {
                    font.capitalization: control.text === "" ? Font.Capitalize : Font.AllLowercase
                }

                inputMethodHints: Qt.ImhEmailCharactersOnly
            }

            TextField {
                width: 1250

                placeholderText: "Visiting"

                style: TextFieldStyleBig { }

                inputMethodHints: Qt.ImhNoPredictiveText
            }

            Item {
                width: 1
                height: 50
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter

                spacing: 50

                Button {
                    width: 400
                    text: "Register"
                    style: ButtonStyleBig {

                    }
                }

                Button {
                    width: 400
                    text: "Cancel"
                    style: ButtonStyleBig {
                        backgroundColor: "#bbe74c3c"
                        pressedColor: "#bbc0392b"
                    }
                }
            }
        }
    }
}

