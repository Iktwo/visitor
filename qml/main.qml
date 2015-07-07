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

    FocusScope {
        anchors.centerIn: parent

        width: 2560
        height: 1600

        scale: Math.min(parent.height / height, parent.width / width)

        FocusScope {
            anchors {
                top: parent.top; topMargin: ScreenValues.statusBarHeight
                /// TODO: ask orientation and ask if nav bar is actually visible
                /// it might not be in devices with hardware controls
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
