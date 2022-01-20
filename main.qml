import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import './dialogs'
import './elements'

Window {
    id: root

    width: 320
    height: 240

    visible: true

    title: qsTr("QML Raspberry Pi EDA Analyzer")

    property Component symbolsKeyboard: SymbolsKeyboard {
        headerLabelText: "Модель АКБ"

        onRejected: stackView.pop()
        onAccepted: stackView.pop()
    }

    property Component numericKeyboard: NumericKeyboard {
        headerLabelText: "Идент. номер батареи"

        onRejected: stackView.pop()
        onAccepted: stackView.pop()
    }

    property Component settingsDialog: SettingsDialog {
        headerLabelText: "Настройки"

        onRejected: stackView.pop()
        onAccepted: stackView.pop()
    }

    property Component briefResultDialog: BriefResultDialog {
        headerLabelText: "Результаты тестирования"

        onRejected: stackView.pop()
        onAccepted: stackView.pop()
    }


    property Component mainWindow: ColumnLayout {
        LayoutLabel {
            text: "Анализатор \"ЭДА\""
            font.italic: true
            font.bold: true

            Layout.fillHeight: false
            Layout.preferredHeight: parent.height * 0.1
        }

        RowLayout {
            property int fontSize: 20

            LabelsColumnLayout {
                topLabelText: "Бустер"
                bottomLabelText: "Factory"

                fontSize: parent.fontSize

                alignment: Qt.AlignLeft
            }

            Spacer { }

            DatetimeLayout {
                dateText: "13.09.2021"
                timeText: "19:23"

                fontSize: parent.fontSize
            }
        }

        LabelsRowLayout {
            leftLabelText: "Состояние:"

            rightLabelText: "Подготовка"
            rightLabelTextBold: true

        }

        LabelsRowLayout {
            leftLabelText: "Напряжение:"

            rightLabelText: "12.24"
            rightLabelTextBold: true
        }

        LabelsRowLayout {
            leftLabelText: "Температура:"

            rightLabelText: "24.3"
            rightLabelTextBold: true
        }

        LabelsRowLayout {
            leftLabelText: "Тип АКБ:"

            rightLabelText: "6CT190"
            rightLabelTextBold: true
        }

        LabelsRowLayout {
            leftLabelText: "Номер батареи:"

            rightLabelText: "114232"
            rightLabelTextBold: true
        }

        RowLayout {
            Layout.alignment: Qt.AlignBottom

            Layout.fillHeight: false
            Layout.preferredHeight: parent.height * 0.2

            LayoutButton {
                text: "Тест АКБ"

                onClicked: {
                    stackView.push(briefResultDialog)
                }
            }

            LayoutButton {
                text: "Следующий номер АКБ"

                // TODO: Increment AKB number or delegate it to C++ code
                onClicked: { }
            }

            LayoutButton {
                text: "Настройки"

                onClicked: {
                    stackView.push(settingsDialog)
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

        // Enable animation
        /*pushEnter: Transition {
            OpacityAnimator {
                from: 0
                to: 1
                duration: 200
            }
        }
        pushExit: Transition {
            OpacityAnimator {
                from: 1
                to: 0
                duration: 200
            }
        }
        popEnter: Transition {
            OpacityAnimator {
                from: 0
                to: 1
                duration: 200
            }
        }
        popExit: Transition {
            OpacityAnimator {
                from: 1
                to: 0
                duration: 200
            }
        }*/

        initialItem: mainWindow
    }
}
