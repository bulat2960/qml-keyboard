import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {
    property string leftLabelText
    property string rightLabelText

    property bool rightLabelTextBold: false

    Layout.fillHeight: true
    Layout.fillWidth: true

    Layout.preferredHeight: 100
    Layout.preferredWidth: 100

    LayoutLabel {
        text: leftLabelText

        Layout.fillWidth: false
        Layout.preferredWidth: parent.width * 0.4

        font.pixelSize: 100
        fontSizeMode: Text.Fit

        horizontalAlignment: Qt.AlignLeft
    }

    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            anchors.fill: parent;
            color: "transparent"
        }
    }

    LayoutLabel {
        text: rightLabelText

        font.bold: rightLabelTextBold

        Layout.fillWidth: false
        Layout.preferredWidth: parent.width * 0.4

        font.pixelSize: 100
        fontSizeMode: Text.Fit

        horizontalAlignment: Qt.AlignRight
    }
}
