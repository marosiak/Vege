import QtQuick 2.5
import QtGraphicalEffects 1.0

Item {
    id: item
    width: parent.width
    height: 62
    Rectangle {
        id: rectangle
        width: parent.width-8
        height: parent.height-6
        radius: 2
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Input {
            id: input
            width: parent.width-item2.width-16
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: item2.right
            anchors.leftMargin: 12
            onTextChanged: {
                if(input.getText() != "" && input.getText() != "Szukaj"){
                    itemd.visible = true
                    rippled.visible = true
                }
                else{
                    itemd.visible = false
                    rippled.visible = false
                }
            }
        }

        Item {
            id: item2
            width: parent.height
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 0
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "./icons/search_gray_48.png"
                width: parent.width - 32
                height: parent.width - 32
            }
        }
        Item {
            id: itemd
            visible: false
            width: parent.height
            height: parent.height
            anchors.right: parent.right
            anchors.rightMargin: 0
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "./icons/cancel.png"
                width: parent.width - 32
                height: parent.width - 32
            }
            MouseArea {
                id: mouseAread
                width: parent.width
                height: parent.height
                onClicked: {
                    input.setFocus(false);
                    input.setText("Szukaj");
                }
            }
            PaperRipple {
                id: rippled
                radius: 100
                mouseArea: mouseAread
                visible: false
            }
        }
    }
    DropShadow {
        //anchors.fill: rec
        width: rectangle.width
        height: rectangle.height
        horizontalOffset: 0
        verticalOffset: 0
        radius: 9
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter
        samples: 20
        color: "#80000000"
        source: rectangle
    }
}
