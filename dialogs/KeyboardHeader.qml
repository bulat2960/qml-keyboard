import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import '../elements'

CustomDialog {
    property alias controlLabel: controlLabel

    RowLayout {
        Layout.fillHeight: false
        Layout.preferredHeight: parent.height * 0.15

        LayoutLabel {
            id: controlLabel

            text: "" // TODO [Logic]: remember user value

            Layout.fillWidth: false
            Layout.preferredWidth: parent.width * 0.8

            rightPadding: 5
            horizontalAlignment: Text.AlignRight

            background: Rectangle {
                color: "lightgrey"
                border.color: "black"
            }
        }

        LayoutButton {
            text: "<---"

            background: Rectangle {
                color: "lightgray"
                border.width: 2
                border.color: "black"
                radius: parent.height / 5
            }

            onClicked: {
                controlLabel.text = controlLabel.text.slice(0, controlLabel.text.length - 1)
            }

            onDoubleClicked: clicked()
        }
    }
}
