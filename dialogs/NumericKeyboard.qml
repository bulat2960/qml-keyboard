import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import '../elements'

CustomDialog {
    TextLine {
        id: textLine

        Layout.fillHeight: false // Prevent to be resized by layout
        Layout.preferredHeight: parent.height * 0.14 // Set fixed height - 14% of parent height
    }

    CustomGridLayout {
        Repeater {
            model: 9

            delegate: LayoutButton {
                text: modelData

                onClicked: textLine.addSymbol(text)
            }
        }

        LayoutButton {
            text: "Применить"

            onClicked: accepted()
        }

        LayoutButton {
            text: "0"

            onClicked: textLine.controlLabel.text += text
        }

        LayoutButton {
            text: "Отмена"

            onClicked: rejected()
        }
    }
}
