import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    required property string listName
    required property var dataList
    required property int alignment

    Layout.preferredWidth: 100

    LayoutLabel {
        text: listName

        font.pixelSize: 18

        Layout.preferredHeight: 20
    }

    Repeater {
        model: [...dataList, ...(new Array(9 - dataList.length).fill(''))]

        LayoutLabel {
            text: modelData
            horizontalAlignment: alignment

            Layout.preferredHeight: 10
        }
    }
}

