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
        PaperRipple {
            id: ripple
            radius: 3*100
            mouseArea: sr
        }

        Image {
            source: "../icons/search.png"
            width: item1.width -36
            height: item1.height -36
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            id: sr
            width: parent.width
            height: parent.height
            onClicked: main.clicked();
        }
    }
}
