import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

/* Объект даты-времени на главном экране */
ColumnLayout {
    required property string dateText
    required property string timeText

    required property int fontSize

    LayoutLabel {
        text: dateText
        horizontalAlignment: Qt.AlignRight
        font.pixelSize: fontSize
    }

    LayoutLabel {
        text: timeText
        horizontalAlignment: Qt.AlignRight
        font.pixelSize: fontSize
    }

    function setDate() {
        // Update date
    }

    function setTime() {
        // Update time
    }
}
