import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.2

CustomDialog {
    id: clock

    readonly property int tumblerColumnWidth: clock.width / 5 - 15

    RowLayout {
        Layout.fillHeight: true
        Layout.preferredHeight: 70

        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

        Tumbler {
            id: dateTumbler

            Layout.fillHeight: true
            Layout.preferredHeight: 50

            readonly property var days: [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

            TumblerColumn {
                id: dayColumn

                width: tumblerColumnWidth

                function updateModel() {
                    var previousIndex = dayColumn.currentIndex
                    var newDays = dateTumbler.days[monthColumn.currentIndex]
                    model = Array.from({length: newDays}, (_, i) => (i + 1))
                    dateTumbler.setCurrentIndexAt(0, Math.min(newDays - 1, previousIndex));
                }
            }

            TumblerColumn {
                id: monthColumn

                width: tumblerColumnWidth

                model: ["Jan", "Feb", "Mar",
                        "Apr", "May", "Jun",
                        "Jul", "Aug", "Sep",
                        "Oct", "Nov", "Dec"]

                onCurrentIndexChanged: dayColumn.updateModel()
            }

            TumblerColumn {
                id: yearColumn

                width: tumblerColumnWidth

                model: Array.from({length: 101}, (_, i) => (i + 2000))

                onCurrentIndexChanged: {
                    var isLeap = !((currentIndex % 4) || (!(currentIndex % 100) && (currentIndex % 400)))

                    dateTumbler.days[1] = (isLeap) ? 29 : 28
                    dayColumn.updateModel()
                }
            }

            Component.onCompleted: {
                // TODO [Logic]: Specify correct initial values for each column
                setCurrentIndexAt(0, 5)
                setCurrentIndexAt(1, 10)
                setCurrentIndexAt(2, 15)
            }

            style: ClockTumblerStyle {
                tumblerHeight: parent.height
            }
        }

        Tumbler {
            id: timeTumbler

            Layout.fillHeight: true
            Layout.preferredHeight: 50

            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            TumblerColumn {
                id: hourColumn
                width: tumblerColumnWidth
                model: Array.from({length: 24}, (_, i) => (i + 1))
            }

            TumblerColumn {
                id: minuteColumn
                width: tumblerColumnWidth
                model: Array.from({length: 60}, (_, i) => (i + 1))
            }

            style: ClockTumblerStyle {
                tumblerHeight: parent.height
            }
        }
    }

    RowLayout {
        Layout.fillHeight: true
        Layout.preferredHeight: 20

        LayoutButton {
            text: "Применить"
            onClicked: accepted()
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
