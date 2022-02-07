import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import '../elements'

CustomDialog {
    LabelsRowLayout {
        leftLabelText: "Состояние АКБ"
        rightLabelText: "Батарея заряжена"
    }

    RowLayout {
        Spacer { }

        LayoutLabel {
            text: "Зарядите батарею"
        }

        Spacer { }
    }

    LabelsRowLayout {
        leftLabelText: "Напряжение АКБ (НРЦ):"
        rightLabelText: "123123"
    }

    LabelsRowLayout {
        leftLabelText: "Степень заряженности (SOC):"
        rightLabelText: "234234"
    }

    LabelsRowLayout {
        // TODO: rich text
        leftLabelText: "Доступная емкость (Qдост):"
        rightLabelText: "345345"
    }

    RowLayout {
        Layout.fillHeight: false
        Layout.preferredHeight: parent.height * 0.2

        LayoutButton {
            text: "Подробно"
        }

        LayoutButton {
            text: "Сохранить протокол"
        }

        LayoutButton {
            text: "Назад"
            onClicked: rejected()
        }
    }
}
