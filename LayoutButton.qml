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
        border.width: text.length !== 0 ? 2 : 0
        border.color: "black"
        radius: parent.height / 5
    }

    contentItem: Text {
        text: parent.text
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
        fontSizeMode: Text.Fit
        font.pixelSize: 15
    }

    onDoubleClicked: clicked()
}
