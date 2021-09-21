import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property string labelText
    property string buttonText

    Layout.preferredWidth: 100
    Layout.preferredHeight: 100

    Layout.fillHeight: true
    Layout.fillWidth: true

    property var buttonClickHandler

    LayoutLabel {
        text: labelText

        Layout.fillHeight: false
        Layout.preferredHeight: parent.height * 0.2
    }

    LayoutButton {
        text: buttonText
        onClicked: buttonClickHandler()
    }
}
