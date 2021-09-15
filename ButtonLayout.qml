import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

GridLayout {
    columnSpacing: 3
    rowSpacing: 3

    property int itemPreferredHeight: rows
    property int itemPreferredWidth: columns

    property var dataList: []
}

