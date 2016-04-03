import QtQuick 2.0

Item {
    id: item
    width: 214
    height: 48
    property string iconSource:"./icons/class.png"
    property string itemText: "Class"
    signal clicked
    Rectangle {
        id: rectangle1
        width: parent.width
        height:parent.height
        Item {
            id: item1
            width: parent.height-32
            height: parent.height-32
            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.verticalCenter: parent.verticalCenter
            Image {
                width: parent.width
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: iconSource
            }
        }
        MatText {
            width: parent.width-item1.width-32
            height: 18
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: item1.right
            anchors.leftMargin: 24
            type: "title"
            matText: itemText
        }
        PaperRipple {
            id: ripple
            radius: 1
            mouseArea: mouseArea
        }
        MouseArea {
            id: mouseArea
            width: parent.width
            height: parent.height
            onClicked: item.clicked()
        }
    }
}
