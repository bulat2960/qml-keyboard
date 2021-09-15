import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property string firstLabelText
    property string secondLabelText

    Label {
        text: firstLabelText
    }

    Label {
        text: secondLabelText
    }
}
