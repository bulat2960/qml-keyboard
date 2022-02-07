import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import '../elements'

CustomDialog {
    CustomGridLayout {
        rows: 2

        LabeledButtonLayout {
            labelText: "Кол-во АКБ"
            buttonText: "1"

        }

        LabeledButtonLayout {
            labelText: "Тип"
            buttonText: "Стартерн."
        }

        LabeledButtonLayout {
            labelText: "Плотность"
            buttonText: "1.5"
        }

        LabeledButtonLayout {
            labelText: "Напряжение"
            buttonText: "0 В"
        }

        LabeledButtonLayout {
            labelText: "Модель АКБ"
            buttonText: "VGB001"
        }

        LabeledButtonLayout {
            labelText: "Стандарт Iхп" // TODO: add rich text support
            buttonText: "EN"
        }
    }

    RowLayout {
        Layout.fillHeight: false
        Layout.preferredHeight: parent.height * 0.2

        LayoutButton {
            text: "Сохранить" // TODO: save settings
        }

        LayoutButton {
            text: undefined
        }

        LayoutButton {
            text: "Отмена"
            onClicked: rejected()
        }
    }
}
