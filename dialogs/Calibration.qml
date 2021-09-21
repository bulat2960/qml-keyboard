import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Extras 1.4

import '../elements'

CustomDialog {
    id: calibrationDialog

    property string type

    property Component calibrationTypeChooser: ColumnLayout {
        LayoutLabel {
            Layout.preferredHeight: 20

            text: "Выберите тип калибровки"
        }

        LayoutButton {
            Layout.preferredHeight: 40

            text: "Калибровка вольтметра"

            onClicked: {
                calibrationDialog.type = "Volt"
                headerLabelText = text
                calibrationStackView.push(calibrationExecutor)
            }
        }

        LayoutButton {
            Layout.preferredHeight: 40

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

            Layout.preferredHeight: 35

            text: "Внимание! Коэффициенты калибровки будут установлены в (1; 0)."

            horizontalAlignment: Qt.AlignLeft
        }

        LayoutLabel {
            id: parametersLabel

            Layout.preferredHeight: 35

            text: "Текущие коэффициенты:\na=1; b=0."

            horizontalAlignment: Qt.AlignLeft

        }

        LayoutButton {
            Layout.preferredHeight: 30

            Layout.fillWidth: false
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: parent.width * 0.8

            text: "Продолжить"

            onClicked: {
                text = ""

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

        Layout.preferredHeight: 70

        // Disable animation
        pushEnter: Transition { }
        pushExit: Transition { }
        popEnter: Transition { }
        popExit: Transition { }

        initialItem: calibrationTypeChooser
    }


    RowLayout {
        Layout.preferredHeight: 20

        LayoutButton {
            id: continueButton

            text: ""
            onClicked: accepted()
        }

        LayoutButton {
            text: undefined
        }

        LayoutButton {
            id: closeButton

            text: "Назад"
            onClicked: rejected()
        }
    }
}
