import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

KeyboardHeader {
    GridLayout {
        Layout.preferredHeight: 75

        rows: 4
        columns: 3

        columnSpacing: 3
        rowSpacing: 3

        Repeater {
            model: 9

            delegate: LayoutButton {
                text: modelData

                onClicked: controlLabel.text += text
            }
        }

        LayoutButton {
            text: "Применить"
            onClicked: accepted()
        }

        LayoutButton {
            text: "0"
            onClicked: controlLabel.text += text
        }

        LayoutButton {
            text: "Отмена"
            onClicked: rejected()
        }
    }
}
