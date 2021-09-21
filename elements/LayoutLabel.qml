import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Label {
    font.pixelSize: 100
    fontSizeMode: Text.VerticalFit

    Layout.fillWidth: true
    Layout.fillHeight: true

    horizontalAlignment: Qt.AlignHCenter
    verticalAlignment: Qt.AlignVCenter

    wrapMode: Text.WordWrap
}
