import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

KeyboardHeader {
    property Component childButtonGroup: GridLayout {
        id: symbolChooseLayout

        property var dataList: []

        rows: 4
        columns: 3

        columnSpacing: 3
        rowSpacing: 3

        Repeater {
            model: parent.rows * parent.columns

            delegate: LayoutButton {
                text: dataList[modelData]

                onClicked: {
                    var symbol = (text === "Пробел") ? " " : text
                    controlLabel.text += symbol
                    keyboardStackView.pop()
                }
            }
        }
    }

    property Component mainButtonGroup : GridLayout {
        id: symbolGroupChooseLayout

        rows: 4
        columns: 3

        columnSpacing: 3
        rowSpacing: 3

        Repeater {
            model: ["1\n-.",   "2\nABC",  "3\nDEF",
                    "4\nGHI",  "5\nJKL",  "6\nMNO",
                    "7\nPQRS", "8\nTUV",  "9\nWXYZ"]

            delegate: LayoutButton {
                text: modelData
                onClicked: {
                    var symbolsList = text.split('').filter(el => el !== '\n')
                    keyboardStackView.push(childButtonGroup, {dataList: symbolsList})
                }
            }
        }

        LayoutButton {
            text: "Применить"
            onClicked: close()
        }

        LayoutButton {
            text: "0\nПробел"
            onClicked: {
                var symbolsList = text.split('\n')
                keyboardStackView.push(childButtonGroup, {dataList: symbolsList})
            }
        }

        LayoutButton {
            text: "Отмена"
            onClicked: rejected()
        }
    }

    StackView {
        id: keyboardStackView

        Layout.fillHeight: true
        Layout.fillWidth: true

        Layout.preferredHeight: 75

        // Disable animation
        pushEnter: Transition { }
        pushExit: Transition { }
        popEnter: Transition { }
        popExit: Transition { }

        initialItem: mainButtonGroup
    }
}
