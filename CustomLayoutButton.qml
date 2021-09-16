import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3

Button {
    Layout.fillHeight: true
    Layout.fillWidth: true

    Layout.preferredHeight: 100
    Layout.preferredWidth: 100

    font.pixelSize: 10
    font.bold: true

    background: Rectangle {
        color: text.length !== 0 ? "lightgray" : "transparent"
        border.width: text.length !== 0 ? 2 : 0
        border.color: "black"
        radius: parent.height / 5
    }

    onDoubleClicked: clicked()
}
