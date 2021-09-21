import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import '../elements'

KeyboardHeader {
    CustomGridLayout {
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
