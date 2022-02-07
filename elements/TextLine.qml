import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import '../elements'

RowLayout {
    property string labelData

    Layout.fillHeight: false

    LayoutLabel {
        id: controlLabel

        text: labelData

        Layout.preferredWidth: 85
        //Layout.fillWidth: false

        rightPadding: 5
        horizontalAlignment: Text.AlignRight

        background: Rectangle {
            color: "lightgrey"
            border.color: "black"
        }
    }

    LayoutButton {
        text: "<---"

        Layout.preferredWidth: 15

        background: Rectangle {
            color: "lightgray"
            border.width: 2
            border.color: "black"
            radius: parent.height / 5
        }

        onClicked: {
            labelData = labelData.slice(0, labelData.length - 1)
            //controlLabel.text = controlLabel.text.slice(0, controlLabel.text.length - 1)
        }

        /* Uncomment this to fix slow response on Qt5.15 */
        //onDoubleClicked: clicked()
    }

    function addSymbol(symbol) {
        labelData += symbol
        //controlLabel.text += symbol
    }
}
