import QtQuick 2.5
import QtQuick.Controls 1.4

TextField {
    id: root

    property bool missingInformation: false

    style: TextFieldStyleBig {
        borderColor: root.missingInformation ? "#e74c3c" : "#7DC5B2"
    }
}
