import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id: root

    width: 320
    height: 240
    visible: true

    title: qsTr("QML Raspberry Pi Keyboard")

    property Component symbolsKeyboard: SymbolsKeyboard {
        headerLabelText: "Модель АКБ"

        onCancelled: {
            stackView.pop()
        }
    }

    property Component numericKeyboard: NumericKeyboard {
        headerLabelText: "Идент. Номер батареи"

        onCancelled: {
            stackView.pop()
        }
    }


    property Component mainWindow: ColumnLayout {
        id: mainWindowLayout

        RowLayout {
            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true

                color: "transparent"
            }

            Label {
                text: "Анализатор \"ЭДА\""
                font.bold: true
                font.italic: true
                font.pixelSize: 20

                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter

                Layout.fillHeight: true
                Layout.fillWidth: false

                Layout.preferredHeight: mainWindowLayout.height * 2 / 11
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true

                color: "transparent"
            }
        }

        LabelsRowLayout {
            firstLabelText: "Бустер"
            secondLabelText: "Factory"
            labelPreferredHeight: parent.height / 11
        }

        LabelsRowLayout {
            firstLabelText: "13.09.2021"
            secondLabelText: "19:23"
            labelPreferredHeight: parent.height / 11
        }

        LabelsRowLayout {
            firstLabelText: "Состояние:"
            secondLabelText: "Подготовка"
            labelPreferredHeight: parent.height / 11
        }

        LabelsRowLayout {
            firstLabelText: "Напряжение:"
            secondLabelText: "12.24"
            labelPreferredHeight: parent.height / 11
        }

        LabelsRowLayout {
            firstLabelText: "Температура:"
            secondLabelText: "24.3"
            labelPreferredHeight: parent.height / 11
        }

        LabelsRowLayout {
            firstLabelText: "Тип АКБ:"
            secondLabelText: "6CT190"
            labelPreferredHeight: parent.height / 11
        }

        LabelsRowLayout {
            firstLabelText: "Номер батареи:"
            secondLabelText: "114232"
            labelPreferredHeight: parent.height / 11
        }

        RowLayout {
            CustomLayoutButton {
                Layout.preferredHeight: mainWindowLayout.height * 3 / 11

                text: "Тест\nАКБ"

                onClicked: {
                    stackView.push(numericKeyboard) // TODO: remove this connection
                }
            }

            CustomLayoutButton {
                Layout.preferredHeight: mainWindowLayout.height * 3 / 11

                text: "Тест\nавтогенератора"
            }

            CustomLayoutButton {
                Layout.preferredHeight: mainWindowLayout.height * 3 / 11

                text: "Настройки"

                onClicked: {
                    stackView.push(symbolsKeyboard) // TODO: remove this connection
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
