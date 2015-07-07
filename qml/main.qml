import QtQuick 2.5
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import com.iktwo.visitor 1.0
import "pages" as Pages

ApplicationWindow {
    id: window

    width: 1280
    height: 768
    visible: true

    Background {
        id: background

        anchors.fill: parent

        source: "qrc:/images/background_" + Math.floor((Math.random() * 5) + 1)
    }

    FontsLoader {
        fonts: [
            "Roboto-Black.ttf", "Roboto-BlackItalic.ttf", "Roboto-Bold.ttf",
            "Roboto-BoldItalic.ttf", "Roboto-Italic.ttf", "Roboto-Light.ttf",
            "Roboto-LightItalic.ttf", "Roboto-Medium.ttf", "Roboto-MediumItalic.ttf",
            "Roboto-Regular.ttf", "Roboto-Thin.ttf", "Roboto-ThinItalic.ttf"
        ]

        pathToFonts: "qrc:/fonts/resources/fonts/"
    }

    FocusScope {
        anchors.centerIn: parent

        width: 2560
        height: 1600

        scale: Math.min(parent.height / height, parent.width / width)

        NotificationBar {
            id: notificationBar

            anchors {
                top: parent.top; topMargin: ScreenValues.statusBarHeight
            }

            width: 2560
        }

        FocusScope {
            anchors {
                top: notificationBar.bottom
                bottom: parent.bottom; bottomMargin: ScreenValues.navBarVisible ? ScreenValues.navigationBarHeight : 0
                left: parent.left
                right: parent.right

            }

            StackView {
                id: stackView

                anchors.fill: parent
                initialItem: welcomePage
            }

            Component {
                id: welcomePage

                Pages.Welcome {
                    onClicked: {
                        background.blur()
                        stackView.push(registrationPage)
                    }
                }
            }

            Component {
                id: registrationPage

                Pages.Registration {
                }
            }
        }
    }
}
