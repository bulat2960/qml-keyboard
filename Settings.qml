import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

CustomDialog {
    id: settings

    property Component clock: Clock {
        headerLabelText: "Настройка часов"

        onAccepted: stackView.pop()
        onRejected: stackView.pop()
    }

    GridLayout {
        Layout.preferredHeight: 70

        rows: 2
        columns: 3

        columnSpacing: 3
        rowSpacing: 3

        LabeledLayoutButton {
            buttonText: "Настройка\nАКБ"
        }

        LabeledLayoutButton {
            buttonText: "Тест ГТС"
        }

        LabeledLayoutButton {
            buttonText: "Калибровка"
        }

        LabeledLayoutButton {
            labelText: "Емкость, Ач"
            buttonText: "1500"
        }

        LabeledLayoutButton {
            labelText: "№ АКБ"
            buttonText: "VGB001"
        }

        LabeledLayoutButton {
            buttonText: "Настройка\nчасов"
            buttonClickHandler: () => stackView.push(clock)
        }
    }

    RowLayout {
        Layout.preferredHeight: 20

        LayoutButton {
            text: "Применить"
            onClicked: accepted()
        }

        LayoutButton {
            text: "App v1.5.1\nCore v0.10.0.0"

            enabled: false

            background: Rectangle {
                color: "lightgray"
                opacity: 0
            }
        }

        LayoutButton {
            text: "Отмена"
            onClicked: rejected()
        }
    }
}
