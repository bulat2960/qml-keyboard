import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property string labelText
    property string buttonText

    Layout.preferredWidth: 100
    Layout.preferredHeight: 100

    Label {
        text: labelText

        Layout.fillHeight: true
        Layout.fillWidth: true

        Layout.preferredHeight: 20

        fontSizeMode: Text.Fit
        font.pixelSize: 100

        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
    }

    CustomLayoutButton {
        text: buttonText

        Layout.preferredHeight: 80
    }
}
