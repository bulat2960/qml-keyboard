import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Button {
    id: button

    Layout.fillHeight: true
    Layout.fillWidth: true

    font.pixelSize: 10
    font.bold: true

    background: Rectangle {
        color: "lightgray"
        border.width: 2
        border.color: "black"
        radius: button.height / 5
    }
}
