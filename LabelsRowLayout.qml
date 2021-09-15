import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {
    property string firstLabelText
    property string secondLabelText

    property int labelPreferredHeight

    Label {
        text: firstLabelText

        Layout.fillHeight: true
        Layout.fillWidth: true

        Layout.preferredWidth: 40
        Layout.preferredHeight: labelPreferredHeight

        horizontalAlignment: Qt.AlignLeft
        verticalAlignment: Qt.AlignVCenter
    }

    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true

        Layout.preferredWidth: 100
        Layout.preferredHeight: labelPreferredHeight

        Rectangle {
            anchors.fill: parent;
            color: "transparent"
        }
    }

    Label {
        text: secondLabelText

        Layout.fillHeight: true
        Layout.fillWidth: true

        Layout.preferredWidth: 40
        Layout.preferredHeight: labelPreferredHeight

        horizontalAlignment: Qt.AlignRight
        verticalAlignment: Qt.AlignVCenter
    }
}
