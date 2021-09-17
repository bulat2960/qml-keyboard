import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id: root

    width: 320
    height: 240
    visible: true

    title: qsTr("QML Raspberry Pi EDA Analyzer")

    property Component symbolsKeyboard: SymbolsKeyboard {
        headerLabelText: "Модель АКБ"

        onCancelled: {
            stackView.pop()
        }
    }

    property Component numericKeyboard: NumericKeyboard {
        headerLabelText: "Идент. номер батареи"

        onCancelled: {
            stackView.pop()
        }
    }

    property Component settings: Settings {
        headerLabelText: "Настройки"

        onCancelled: {
            stackView.pop()
        }

        onAccepted: {
            stackView.pop()
        }
    }


    property Component mainWindow: ColumnLayout {
        CustomLayoutLabel {
            text: "Анализатор \"ЭДА\""
            font.italic: true
            font.bold: true

            Layout.preferredHeight: parent.height / 10
        }

        LabelsRowLayout {
            Layout.preferredHeight: parent.height / 10

            leftLabelText: "Бустер"

            rightLabelText: "Factory"
        }

        LabelsRowLayout {
            Layout.preferredHeight: parent.height / 10

            leftLabelText: "13.09.2021"

            rightLabelText: "19:23"
        }

        LabelsRowLayout {
            Layout.preferredHeight: parent.height / 10

            leftLabelText: "Состояние:"

            rightLabelText: "Подготовка"
            rightLabelTextBold: true

        }

        LabelsRowLayout {
            Layout.preferredHeight: parent.height / 10

            leftLabelText: "Напряжение:"

            rightLabelText: "12.24"
            rightLabelTextBold: true
        }

        LabelsRowLayout {
            Layout.preferredHeight: parent.height / 10

            leftLabelText: "Температура:"

            rightLabelText: "24.3"
            rightLabelTextBold: true
        }

        LabelsRowLayout {
            Layout.preferredHeight: parent.height / 10

            leftLabelText: "Тип АКБ:"

            rightLabelText: "6CT190"
            rightLabelTextBold: true
        }

        LabelsRowLayout {
            Layout.preferredHeight: parent.height / 10

            leftLabelText: "Номер батареи:"

            rightLabelText: "114232"
            rightLabelTextBold: true
        }

        RowLayout {
            Layout.preferredHeight: parent.height * 2 / 10

            CustomLayoutButton {
                text: "Тест\nАКБ"

                onClicked: {
                    stackView.push(numericKeyboard)
                }
            }

            CustomLayoutButton {
                text: "Тест\nавтогенератора"

                onClicked: {
                    stackView.push(symbolsKeyboard)
                }
            }

            CustomLayoutButton {
                text: "Настройки"

                onClicked: {
                    stackView.push(settings)
                }
            }
        }
    }

    StackView {
        id: stackView

        anchors.fill: parent

        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 5
        anchors.bottomMargin: 5

        // Disable animation
        pushEnter: Transition { }
        pushExit: Transition { }
        popEnter: Transition { }
        popExit: Transition { }

        initialItem: mainWindow
    }
}
