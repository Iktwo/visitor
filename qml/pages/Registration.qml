import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import com.iktwo.visitor 1.0
import ".."

FocusScope {
    id: root

    signal accepted
    signal rejected

    MouseArea {
        anchors.fill: parent
        onClicked: Qt.inputMethod.hide()
    }

    Rectangle {
        id: rectangleContainer

        anchors {
            top: parent.top; topMargin: 150
            left: parent.left; leftMargin: 400
            right: parent.right; rightMargin: 400
        }

        height: column.height + 300
        color: "#ddF2F2F2"

        Behavior on x { NumberAnimation { } }
        Behavior on y { NumberAnimation { } }

        Column {
            id: column

            anchors.centerIn: parent

            spacing: 50

            Row {
                spacing: 50

                FormTextField {
                    id: textFieldFirstName

                    width: 500

                    placeholderText: "First Name"

                    inputMethodHints: Qt.ImhNoPredictiveText

                    onTextChanged: {
                        if (text === "")
                            missingInformation = true
                        else
                            missingInformation = false
                    }
                }

                FormTextField {
                    id: textFieldLastName

                    width: 700

                    placeholderText: "Last Name"

                    inputMethodHints: Qt.ImhNoPredictiveText

                    onTextChanged: {
                        if (text === "")
                            missingInformation = true
                        else
                            missingInformation = false
                    }
                }
            }

            FormTextField {
                id: textFieldEmail

                width: 1250

                placeholderText: "Email"

                inputMethodHints: Qt.ImhEmailCharactersOnly

                onTextChanged: {
                    if (text === "")
                        missingInformation = true
                    else
                        missingInformation = false
                }
            }

            FormTextField {
                id: textFieldVisiting

                width: 1250

                placeholderText: "Visiting"

                inputMethodHints: Qt.ImhNoPredictiveText

                onTextChanged: {
                    if (text === "")
                        missingInformation = true
                    else
                        missingInformation = false
                }
            }

            Item {
                width: 1
                height: 50
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter

                spacing: 50

                Button {
                    property var requiredFields: [textFieldFirstName, textFieldLastName, textFieldEmail, textFieldVisiting]

                    width: 500
                    text: "Register"
                    style: ButtonStyleBig {

                    }

                    onClicked: {
                        var ok = true
                        for (var i = 0; i < requiredFields.length; i++) {
                            /// TODO: find a better way to identify field
                            if (requiredFields[i].text === undefined || requiredFields[i].text === "") {
                                ok = false

                                if (requiredFields[i].missingInformation !== undefined)
                                    requiredFields[i].missingInformation = true
                            }
                        }

                        if (ok) {
                            notificationBar.showMessage("Thanks for registering!", Notifications.Succes, Notifications.Medium)
                            root.accepted()
                        } else {
                            notificationBar.showMessage("Please complete all the required fields", Notifications.Error, Notifications.Long)
                        }
                    }
                }

                Button {
                    width: 500
                    text: "Cancel"
                    style: ButtonStyleBig {
                        backgroundColor: "#bbe74c3c"
                        pressedColor: "#bbc0392b"
                    }

                    onClicked: root.rejected()
                }
            }
        }
    }
}

