import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {
    property string leftLabelText
    property string rightLabelText

    property bool rightLabelTextBold: false

    LayoutLabel {
        text: leftLabelText

        Layout.preferredWidth: 25

        horizontalAlignment: Qt.AlignLeft
    }

    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true

        Layout.preferredWidth: 50

        Rectangle {
            anchors.fill: parent;
            color: "transparent"
        }
    }

    LayoutLabel {
        text: rightLabelText

        font.bold: rightLabelTextBold

        Layout.preferredWidth: 25

        horizontalAlignment: Qt.AlignRight
    }
}
