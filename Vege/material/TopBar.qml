import QtQuick 2.0

Rectangle {
    id: main
    implicitWidth: parent.width
    implicitHeight: 70
    color: "#2ecc71"
    signal clicked
    Item {
        id: item1
        height: parent.height
        anchors.right: parent.right
        anchors.rightMargin: 0
        width: parent.height
        Image {
            source: "../icons/search.png"
            width: item1.width -30
            height: item1.height -30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            id: sr
            width: parent.width
            height: parent.height
            onClicked: main.clicked();
        }
        PaperRipple {
            id: ripple
            radius: 3 * dp
            mouseArea: sr
        }

    }
}
