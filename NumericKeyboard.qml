import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

KeyboardHeader {
    GridLayout {
        Layout.preferredHeight: 80

        rows: 4
        columns: 3

        columnSpacing: 3
        rowSpacing: 3

        Repeater {
            model: 9

            delegate: CustomLayoutButton {
                text: modelData

                onClicked: symbolChosen(text)
            }
        }

        CustomLayoutButton {
            text: "Применить"
            onClicked: cancelled() // TODO: create signal 'accepted'
        }

        CustomLayoutButton {
            text: "0"
            onClicked: symbolChosen(text)
        }

        CustomLayoutButton {
            text: "Отмена"
            onClicked: cancelled()
        }
    }
}
