import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import '../elements'

CustomDialog {
    id: settings

    property Component clockDialog: ClockDialog {
        headerLabelText: "Настройка часов"

        onAccepted: stackView.pop()
        onRejected: stackView.pop()
    }

    property Component akbNumberChangerDialog: SymbolsKeyboard {
        id: akbNumberChanger

        headerLabelText: "Идент. номер батареи"

        onAccepted: stackView.pop()
        onRejected: stackView.pop()
    }

    property Component capacityChangerDialog: NumericKeyboard {
        headerLabelText: "Ёмкость батареи"

        onAccepted: stackView.pop()
        onRejected: stackView.pop()
    }

    property Component calibrationDialog: CalibrationDialog {
        headerLabelText: "Калибровка"

        onAccepted: stackView.pop()
        onRejected: stackView.pop()
    }

    property Component testSignalGeneratorDialog: TestSignalGeneratorDialog {
        headerLabelText: "Тест ГТС"

        onAccepted: stackView.pop()
        onRejected: stackView.pop()
    }

    property Component akbSettingsDialog: AkbSettingsDialog {
        headerLabelText: "Настройка АКБ"

        onAccepted: stackView.pop()
        onRejected: stackView.pop()
    }

    CustomGridLayout {
        rows: 2

        LabeledButtonLayout {
            buttonText: "Настройка\nАКБ"

            buttonClickHandler: () => stackView.push(akbSettingsDialog)
        }

        LabeledButtonLayout {
            buttonText: "Тест ГТС"

            buttonClickHandler: () => stackView.push(testSignalGeneratorDialog)
        }

        LabeledButtonLayout {
            buttonText: "Калибровка"

            buttonClickHandler: () => stackView.push(calibrationDialog)
        }

        LabeledButtonLayout {
            labelText: "Емкость, Ач"
            buttonText: "1500"

            buttonClickHandler: () => stackView.push(capacityChangerDialog)
        }

        LabeledButtonLayout {
            labelText: "№ АКБ"
            buttonText: "VGB001"

            buttonClickHandler: () => stackView.push(akbNumberChangerDialog)
        }

        LabeledButtonLayout {
            buttonText: "Настройка\nчасов"

            buttonClickHandler: () => stackView.push(clockDialog)
        }
    }

    RowLayout {
        Layout.fillHeight: false
        Layout.preferredHeight: parent.height * 0.2

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
