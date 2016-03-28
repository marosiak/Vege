import QtQuick 2.0

Rectangle {
    id: main
    implicitWidth: parent.width
    implicitHeight: 70
    color: "#2ecc71"
    Item {
        id: item1xz
        height: parent.height
        anchors.right: parent.right
        anchors.rightMargin: 0
        width: parent.height
        PaperRipple {
            id: ripple
            radius: 3*100
            mouseArea: masr
        }

        Image {
            source: "../icons/search.png"
            width: item1xz.width -36
            height: item1xz.height -36
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            id: masr
            width: parent.width
            height: parent.height
            onClicked: {
                infoPage.visible = false;
                searchPage.visible = true;
                contentPage.visible = false;
            }
        }
    }
    Item {
        id: item1
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: 0
        width: parent.height
        Image {
            source: "../icons/back.png"
            width: item1.width -38
            height: item1.height -38
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            id: sr
            width: parent.width
            height: parent.height
            onClicked: {
                infoPage.visible = true;
                searchPage.visible = false;
                contentPage.visible = false;
            }
        }
        PaperRipple {
            id: ripplex
            radius: 3*100
            mouseArea: sr
        }
    }
}
