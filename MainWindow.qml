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

    property Component childButtonGroup: ButtonLayout {
        id: symbolChooseLayout

        Repeater {
            model: parent.rows * parent.columns

            delegate: CustomButton {
                text: dataList[modelData]

                enabled: text.length !== 0

                onClicked: {
                    if (text === "Пробел") {
                        label.text += " "
                    } else {
                        label.text += text
                    }
                    stackView.pop()
                }
            }
        }
    }

    property Component mainButtonGroup : ButtonLayout {
        id: symbolGroupChooseLayout

        Repeater {
            model: ["1\n-.",   "2\nABC",  "3\nDEF",
                    "4\nGHI",  "5\nJKL",  "6\nMNO",
                    "7\nPQRS", "8\nTUV",  "9\nWXYZ"]

            delegate: CustomButton {
                text: modelData

                onClicked: {
                    var symbolsList = text.split('').filter(el => el !== '\n')
                    stackView.push(childButtonGroup, {dataList: symbolsList})
                }
            }
        }

        CustomButton {
            text: "Применить"
            onClicked: close()
        }

        CustomButton {
            text: "0\nПробел"
            onClicked: stackView.push(childButtonGroup, {dataList: ["0", "Пробел"]})
        }

        CustomButton {
            text: "Отмена"
            onClicked: close()
        }
    }

    ColumnLayout {
        id: mainColumn

        anchors.fill: parent

        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 5
        anchors.bottomMargin: 5

        Label {
            text: "Модель АКБ"
            font.pixelSize: 15
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            id: textData

            Label {
                id: label

                text: ""
                Layout.fillWidth: true
                rightPadding: 5
                horizontalAlignment: Text.AlignRight

                font.pixelSize: 25

                background: Rectangle {
                    color: "lightgrey"
                    border.color: "black"
                }
            }

            Button {
                id: deleteButton

                text: "<---"
                font.pixelSize: 15
                implicitWidth: 50

                background: Rectangle {
                    color: "lightgray"
                    border.width: 2
                    border.color: "black"
                    radius: parent.height / 3
                }

                onClicked: {
                    label.text = label.text.slice(0, label.text.length - 1)
                }

                onDoubleClicked: clicked()
            }
        }

        StackView {
            id: stackView

            Layout.fillHeight: parent
            Layout.fillWidth: parent

            pushEnter: Transition { }
            pushExit: Transition { }
            popEnter: Transition { }
            popExit: Transition { }

            initialItem: mainButtonGroup
        }
    }
}
