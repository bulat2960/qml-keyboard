import QtQuick 2.0
import QtQuick.Layouts 1.12

/* Невидимый итем-разделитель */
Item {
    Layout.fillHeight: true
    Layout.fillWidth: true

    Rectangle {
        anchors.fill: parent;
        color: "transparent"
    }
}
