import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    id: settings

    property string headerLabelText

    signal cancelled()
    signal accepted()

    CustomLayoutLabel {
        text: headerLabelText

        font.bold: true

        Layout.preferredHeight: 10
    }

    GridLayout {
        Layout.preferredHeight: 70

        rows: 2
        columns: 3

        columnSpacing: 3
        rowSpacing: 3

        CustomLabeledLayoutButton {
            buttonText: "Настройка\nАКБ"
        }

        CustomLabeledLayoutButton {
            buttonText: "Тест ГТС"
        }

        CustomLabeledLayoutButton {
            buttonText: "Калибровка"
        }

        CustomLabeledLayoutButton {
            labelText: "Емкость, Ач"
            buttonText: "1500"
        }

        CustomLabeledLayoutButton {
            labelText: "№ АКБ"
            buttonText: "VGB001"
        }

        CustomLabeledLayoutButton {
            buttonText: "Настройка\nчасов"
        }
    }

    RowLayout {
        Layout.preferredHeight: 20

        CustomLayoutButton {
            text: "Применить"
            onClicked: accepted()
        }

        CustomLayoutButton {
            text: "App v1.5.1\nCore v0.10.0.0"

            enabled: false

            background: Rectangle {
                color: "lightgray"
                opacity: 0
            }
        }

        CustomLayoutButton {
            text: "Отмена"
            onClicked: cancelled()
        }
    }
}
