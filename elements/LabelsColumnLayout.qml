import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

/* Два объекта Label, расположенные в колонку (без итема-разделителя) */
ColumnLayout {
    property string topLabelText
    property string bottomLabelText

    required property int alignment

    property string fontSize

    LayoutLabel {
        text: topLabelText
        font.pixelSize: fontSize
        horizontalAlignment: alignment
    }

    LayoutLabel {
        text: bottomLabelText
        font.pixelSize: fontSize
        horizontalAlignment: alignment
    }
}
