import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import '../elements'

ColumnLayout {
    required property string headerLabelText

    signal accepted()
    signal rejected()

    LayoutLabel {
        text: headerLabelText
        font.bold: true

        Layout.fillHeight: false
        Layout.preferredHeight: parent.height * 0.1
    }
}
