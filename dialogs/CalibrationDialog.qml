import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import '../elements'

CustomDialog {
    id: calibrationDialog

    property string type

    property Component calibrationTypeChooser: ColumnLayout {
        LayoutLabel {
            text: "Выберите тип калибровки"

            Layout.fillHeight: false
            Layout.preferredHeight: parent.height * 0.2
        }

        LayoutButton {
            text: "Калибровка вольтметра"

            onClicked: {
                calibrationDialog.type = "Volt"
                headerLabelText = text
                calibrationStackView.push(calibrationExecutor)
            }
        }

        LayoutButton {
            text: "Калибровка термодатчика"

            onClicked: {
                calibrationDialog.type = "Thermo"
                headerLabelText = text
                calibrationStackView.push(calibrationExecutor)
            }
        }
    }

    property Component calibrationExecutor: ColumnLayout {
        LayoutLabel {
            id: informationLabel

            // TODO: load correct coefficients from C++
            text: "Внимание! Коэффициенты калибровки будут установлены в (1; 0)."

            horizontalAlignment: Qt.AlignLeft
        }

        LayoutLabel {
            id: parametersLabel

            // TODO: set correct coefficients from C++
            text: "Текущие коэффициенты:\na=1; b=0."

            horizontalAlignment: Qt.AlignLeft

        }

        LayoutButton {
            text: "Продолжить"

            Layout.fillHeight: false
            Layout.preferredHeight: parent.height * 0.3

            Layout.fillWidth: false
            Layout.preferredWidth: parent.width * 0.8

            Layout.alignment: Qt.AlignHCenter

            onClicked: {
                text = ""

                // TODO: set next step from C++
                if (calibrationDialog.type == "Thermo") {
                    informationLabel.text = "Установите температуру 30 С"
                } else {
                    informationLabel.text = "Установите напряжение 2 В"
                }

                continueButton.enabled = false
                continueButton.text = "Далее"

                parametersLabel.text = ""
            }
        }
    }

    StackView {
        id: calibrationStackView

        Layout.fillHeight: true
        Layout.fillWidth: true

        // Disable animation
        pushEnter: Transition { }
        pushExit: Transition { }
        popEnter: Transition { }
        popExit: Transition { }

        initialItem: calibrationTypeChooser
    }


    RowLayout {
        Layout.fillHeight: false
        Layout.preferredHeight: parent.height * 0.2

        LayoutButton {
            id: continueButton

            text: undefined
        }

        LayoutButton {
            text: undefined
        }

        LayoutButton {
            text: "Назад"
            onClicked: rejected()
        }
    }
}
