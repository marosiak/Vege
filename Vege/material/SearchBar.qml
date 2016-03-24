import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id: main
    implicitWidth: parent.width
    implicitHeight: 70
    color: "#2ecc71"
    signal clicked
    FontLoader {
        id: robotoMedium
        source: "/fonts/Roboto-Medium.ttf"
    }
    Item {
        id: item1
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: 0
        width: parent.height
        Image {
            source: "../icons/back.png"
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
    Rectangle {
        id: searchBox
        width: parent.width - item1.width-15
        height: parent.height -25
        color: "#27ae60"
        anchors.left: item1.right
        anchors.leftMargin: 0
        anchors.verticalCenter: parent.verticalCenter
        radius: 5
        ScrollView {
            id: scrollView1
            width: parent.width-14
            height: textInput1.height/1.25
            anchors.left: parent.left
            anchors.leftMargin: 7
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff
            horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
            TextInput {
                id: textInput1
                color: "#fbfbfb"
                text: qsTr("Text Input")
                height: searchBox.height
                width: searchBox.width
                font.pixelSize: 24
                font.family: robotoMedium.name
                //wrapMode: TextInput.Wrap
            }
        }
    }
}

