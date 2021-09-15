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

    property Component keyboard: Keyboard {
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

        ButtonLayout {
            rows: 1
            columns: 3

            itemPreferredWidth: parent.width / 3
            itemPreferredHeight: parent.height * 3 / 11

            CustomButton {
                text: "Тест\nАКБ"
            }

            CustomButton {
                text: "Тест\nавтогенератора"
            }

            CustomButton {
                text: "Настройки"

                onClicked: {
                    stackView.push(keyboard)
                }
            }
        }
    }

    StackView {
        id: stackView

        anchors.fill: parent

        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.topMargin: 8
        anchors.bottomMargin: 8

        // Disable animation
        pushEnter: Transition { }
        pushExit: Transition { }
        popEnter: Transition { }
        popExit: Transition { }

        initialItem: mainWindow
    }
}
