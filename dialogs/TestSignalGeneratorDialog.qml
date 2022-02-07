import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import '../elements'

CustomDialog {
    RowLayout {
        CustomListView {
            listName: "Канал"
            dataList: [1, 2, 4, 8, 16, 32, 64, 128, "max"] // TODO: data from C++
            alignment: Qt.AlignRight
        }

        VerticalSeparator { }

        CustomListView {
            listName: "I генер, А"
            dataList: [0.016, 0.032, 0.064, 0.128, 0.256, 0.512, 1.024, 2.048, 4.08] // TODO: data from C++
            alignment: Qt.AlignCenter
        }

        VerticalSeparator { }

        CustomListView {
            listName: "I изм, А"
            dataList: [1, 2, 3, 4, 5, 6, 7, 8, 9] // TODO: data from C++
            alignment: Qt.AlignCenter
        }

        VerticalSeparator { }

        CustomListView {
            listName: "σ, %"
            dataList: [] // TODO: data from C++
            alignment: Qt.AlignCenter
        }
    }

    RowLayout {
        Layout.fillHeight: false
        Layout.preferredHeight: parent.height * 0.2

        LayoutButton {
            text: "Начать тест"

            onClicked: accepted() // TODO: launch test
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
