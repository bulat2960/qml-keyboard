import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Custom.KeyboardController 1.0

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 300
    height: 240

    ColumnLayout {
        id: mainLayout

        anchors.fill: parent

        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 5
        anchors.bottomMargin: 5

        // Label with model name
        Label {
            text: "Модель АКБ"
            font.pixelSize: 15
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            id: textData

            // Label with user input
            Label {
                id: label

                text: ""
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignRight

                font.pixelSize: 25

                background: Rectangle {
                    color: "lightgrey"
                }
            }

            // Symbol delete button
            Button {
                text: "<---"
                highlighted: true
                implicitWidth: 50

                onClicked: {
                    label.text = label.text.slice(0, label.text.length - 1)
                }
            }
        }

        StackView {
            id: stackView
            Layout.fillWidth: true
            Layout.fillHeight: true

            pushEnter: Transition {

            }

            pushExit: Transition {

            }

            popEnter: Transition {

            }

            popExit: Transition {

            }
        }

        KeyboardController {
            id: controller

            onLayoutChangeRequested: {
                // Change layout to symbol choose layout
                var symbolChooseLayout = createLayout("SymbolChooseLayout.qml", mainLayout, buttonText);
                dropLastLayoutFromStack();
                stackView.push(symbolChooseLayout);
            }

            onNewSymbolReceived: {
                // User clicked on symbol, return to previous layout
                var symbolGroupChooseLayout = createLayout("SymbolGroupChooseLayout.qml", mainLayout, controller.mainLayoutData);
                dropLastLayoutFromStack();
                stackView.push(symbolGroupChooseLayout);

                // Add received symbol
                appendSymbol(symbol);
            }

            onSpaceButtonPressed: appendSymbol(' ')

            onAccepted: Qt.quit()
            onRejected: Qt.quit()
        }
    }

    function appendSymbol(symbol) {
        // Just add a symbol
        label.text += symbol;
    }

    function dropLastLayoutFromStack() {
        // Pop layout (if there is only 1 layout, do nothing)
        var object = stackView.pop();

        // Delete layout if it has been popped
        if (object !== null) {
            object.destroy();
        }
    }

    function createLayout(filename, parent, data) {
        // Create component
        var component = Qt.createComponent(filename);
        var object = component.createObject(mainLayout, {dataList: data})

        // Connect it with parsing function (implemented in KeyboardController.cpp)
        object.buttonClicked.connect(controller.parseButtonText)
        return object
    }

    Component.onCompleted: {
        // Create initial layout
        var symbolGroupChooseLayout = createLayout("SymbolGroupChooseLayout.qml", mainLayout, controller.mainLayoutData)
        stackView.push(symbolGroupChooseLayout)
    }

}
