import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import '../elements'

/* Кастомные часы */
/* TODO: Посмотреть, можно ли использовать тут QDateTime, чтобы избавиться от лишних переменных вроде model с месяцами */
/* А лучше вообще логику оставить в плюсовом коде, а тут лишь интерфейс */
CustomDialog {
    RowLayout {
        RowLayout {
            Layout.preferredWidth: 3

            ItemSelectorLayout {
                id: daySelector
                name: "День"
                model: Array.from({length: 31}, (_, i) => (i + 1))

                function updateModel() {
                    var previousIndex = currentIndex
                    var newIndex = monthSelector.days[monthSelector.currentIndex]
                    setIndex(Math.min(previousIndex, newIndex - 1))
                    var newModel = Array.from({length: newIndex}, (_, i) => (i + 1))
                    setModel(newModel)
                }
            }

            ItemSelectorLayout {
                id: monthSelector
                name: "Месяц"
                model: ["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"]

                readonly property var days: [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

                onDataChanged: daySelector.updateModel()
            }

            ItemSelectorLayout {
                id: yearSelector
                name: "Год"
                model: Array.from({length: 101}, (_, i) => (i + 2000))

                onDataChanged: {
                    var isLeap = !((currentIndex % 4) || (!(currentIndex % 100) && (currentIndex % 400)))
                    monthSelector.days[1] = (isLeap) ? 29 : 28
                    daySelector.updateModel()
                }
            }
        }


        Spacer {
            Layout.preferredWidth: 1
        }

        RowLayout {
            Layout.preferredWidth: 2

            ItemSelectorLayout {
                name: "Часы"
                id: hourSelector
                model: Array.from({length: 24}, (_, i) => i)
            }

            ItemSelectorLayout {
                id: minuteSelector
                name: "Минуты"
                model: Array.from({length: 60}, (_, i) => i)
            }
        }
    }

    RowLayout {
        Layout.fillHeight: false
        Layout.preferredHeight: parent.height * 0.2

        LayoutButton {
            text: "Сохранить"

            onClicked: accepted() // TODO: save time
        }

        LayoutButton {
            text: undefined
        }

        LayoutButton {
            text: "Отмена"

            onClicked: rejected()
        }
    }
}
