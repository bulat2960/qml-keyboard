import QtQuick 2.9

ButtonLayout {
    id: symbolChooseLayout

    signal buttonClicked(string buttonText)

    Repeater {
        id: repeater

        model: dataList.split('').filter(el => el !== '\n')

        CustomButton {
            id: button
            text: modelData

            onClicked: {
                buttonClicked(text)
            }
        }
    }
}
