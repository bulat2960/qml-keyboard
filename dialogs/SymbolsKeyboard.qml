import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import '../elements'

CustomDialog {
    property string labelData

    property Component childButtonGroup: CustomGridLayout {
        id: symbolChooseLayout

        property var dataList: []

        Repeater {
            model: parent.rows * parent.columns

            delegate: LayoutButton {
                text: dataList[modelData]

                enabled: text.length > 0

                onClicked: {
                    var symbol = (text === "Пробел") ? " " : text
                    textLine.addSymbol(symbol)
                    keyboardStackView.pop()
                }
            }
        }
    }

    property Component mainButtonGroup : CustomGridLayout {
        id: symbolGroupChooseLayout

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

            onClicked: accepted()
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

    TextLine {
        id: textLine

        labelData: parent.labelData

        Layout.fillHeight: false // Prevent to be resized by layout
        Layout.preferredHeight: parent.height * 0.14 // Set fixed height - 14% of parent height
    }

    StackView {
        id: keyboardStackView

        Layout.fillHeight: true
        Layout.fillWidth: true

        // Disable animation
        pushEnter: Transition { }
        pushExit: Transition { }
        popEnter: Transition { }
        popExit: Transition { }

        initialItem: mainButtonGroup
    }
}
