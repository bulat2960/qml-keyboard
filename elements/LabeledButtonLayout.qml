import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

/* Кнопка с надписью сверху */
ColumnLayout {
    property string labelText
    property string buttonText

    property var buttonClickHandler

    Layout.preferredWidth: 100
    Layout.preferredHeight: 100

    LayoutLabel {
        text: labelText

        Layout.preferredHeight: 20
    }

    LayoutButton {
        text: buttonText

        Layout.preferredHeight: 80

        onClicked: buttonClickHandler()

    }
}
