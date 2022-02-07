import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

/* Layout для выбора числового значения */
ColumnLayout {
    id: selector

    required property string name
    property var model
    property int currentIndex: 0

    Layout.preferredHeight: 100
    Layout.preferredWidth: 100

    signal dataChanged()

    LayoutLabel {
        text: name

        Layout.preferredHeight: 10
    }

    Image {
        source: "qrc:/icons/bullet_arrow_up.png"

        Layout.fillHeight: true
        Layout.preferredHeight: 35

        Layout.fillWidth: true

        MouseArea {
            anchors.fill: parent

            onClicked: {
                selector.currentIndex = (selector.currentIndex + 1) % selector.model.length
                dataChanged()
            }
        }
    }

    LayoutLabel {
        id: label
        text: parent.model[currentIndex]

        Layout.fillHeight: true
        Layout.preferredHeight: 20

        font.pixelSize: 15
    }

    Image {
        source: "qrc:/icons/bullet_arrow_down.png"

        Layout.fillHeight: true
        Layout.preferredHeight: 35

        Layout.fillWidth: true

        MouseArea {
            anchors.fill: parent

            onClicked: {
                selector.currentIndex = (selector.currentIndex == 0) ? selector.model.length - 1 : selector.currentIndex - 1
                dataChanged()
            }
        }
    }

    function setIndex(index) {
        currentIndex = index
    }

    function setModel(model) {
        this.model = model
    }
}
