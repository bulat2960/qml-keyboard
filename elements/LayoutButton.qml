import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Button {
    Layout.fillHeight: true
    Layout.fillWidth: true

    Layout.preferredHeight: 100
    Layout.preferredWidth: 100

    background: Rectangle {
        color: text.length !== 0 ? "lightgray" : "transparent"
        opacity: enabled ? 1 : 0.3
        border.width: text.length !== 0 ? 2 : 0
        border.color: "black"
        radius: parent.height / 5
    }

    contentItem: Text {
        text: parent.text
        opacity: enabled ? 1 : 0.3
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
        fontSizeMode: Text.Fit
        font.pixelSize: 20
        wrapMode: Text.WordWrap
    }

    onDoubleClicked: clicked()
}
