import QtQuick 2.9
import QtQuick.Layouts 1.3

ButtonLayout {
    id: symbolGroupChooseLayout

    signal buttonClicked(string buttonText)

    // Text buttons
    Repeater {
        model: dataList.slice(0, -1)

        CustomButton {
            text: modelData
            onClicked: buttonClicked(text)
        }
    }

    // Accept button
    CustomButton {
        text:  "Применить"
        onClicked: buttonClicked("Accept") // Just an example
    }

    // Space button
    CustomButton {
        text: dataList.slice(-1).toString()
        onClicked: buttonClicked(' ')
    }

    // Reject button
    CustomButton {
        text:  "Отмена"
        onClicked: buttonClicked("Reject") // Just an example
    }
}
