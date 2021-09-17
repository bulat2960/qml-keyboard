import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property string headerLabelText

    signal cancelled()
    signal symbolChosen(string symbol)
    signal accepted()

    CustomLayoutLabel {
        text: headerLabelText

        font.bold: true

        Layout.preferredHeight: 10
    }

    RowLayout {
        //Layout.fillHeight: true
        Layout.preferredHeight: 10

        Label {
            id: controlLabel

            text: "" // TODO: remember user value

            rightPadding: 5
            horizontalAlignment: Text.AlignRight

            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.preferredWidth: 200

            font.pixelSize: 500
            fontSizeMode: Text.VerticalFit

            background: Rectangle {
                color: "lightgrey"
                border.color: "black"
            }
        }

        CustomLayoutButton {
            Layout.preferredWidth: 50

            background: Rectangle {
                color: "lightgray"
                border.width: 2
                border.color: "black"
                radius: parent.height / 5
            }

            text: "<---"

            onClicked: {
                controlLabel.text = controlLabel.text.slice(0, controlLabel.text.length - 1)
            }

            onDoubleClicked: clicked()
        }
    }

    onSymbolChosen: {
        controlLabel.text += symbol
    }
}
