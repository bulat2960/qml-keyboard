import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

/* Два объекта LayoutLabel, расположенные горизонтально (с итемом-разделителем) */
RowLayout {
    property string leftLabelText
    property string rightLabelText

    property bool rightLabelTextBold: false

    Layout.preferredHeight: 100
    Layout.preferredWidth: 100

    LayoutLabel {
        text: leftLabelText
        horizontalAlignment: Qt.AlignLeft
    }

    Spacer { }

    LayoutLabel {
        text: rightLabelText
        horizontalAlignment: Qt.AlignRight

        font.bold: rightLabelTextBold
    }
}
