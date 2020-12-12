import QtQuick 2.12
import QtQuick.Controls 2.5

Button {
    id: ctrl

    property color bg_color: "white"
    property color txt_color: "black"

    background: Rectangle {
        color: ctrl.pressed ? Qt.darker(bg_color, 1.25) : bg_color
        radius: 30
    }

    contentItem: Text {
        text: ctrl.text
        padding: ctrl.padding
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Segoe MDL2 Assets"
        font.pixelSize: 24
        color: txt_color
    }

}
