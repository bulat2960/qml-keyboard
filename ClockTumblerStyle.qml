import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.2


TumblerStyle {
    id: tumblerStyle

    required property var tumblerHeight

    frame: null

    delegate: Item {
        implicitHeight: (tumblerHeight - padding.top - padding.bottom) / tumblerStyle.visibleItemCount

        Text {
            text: styleData.value
            fontSizeMode: Text.Fit
            font.pixelSize: 15
            color: "black"
            opacity: 0.2 + Math.max(0, 1 - Math.abs(styleData.displacement)) * 0.8
            anchors.centerIn: parent
        }
    }
}
