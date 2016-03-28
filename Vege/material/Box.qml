import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Item {
    id: item1x
    property color boxColor
    property string imgUrl
    property string name
    property string typX
    signal clicked
    implicitWidth: parent.width
    implicitHeight: 210
    FontLoader {
        id: robotoMedium
        source: "/fonts/Roboto-Medium.ttf"
    }
    FontLoader {
        id: robotoLight
        source: "/fonts/Roboto-Light.ttf"
    }
    Image {
        id: img
        width: parent.width-30
        height: parent.height-70
        anchors.horizontalCenter: parent.horizontalCenter
        source: imgUrl
        Rectangle {
            width: 60
            height: 20
            Component.onCompleted: {
                if(typ == "sniadanie"){
                    color = "#8e44ad";
                    typText.text = "Śniadanie";
                    width = 85;
                }
                if(typ == "obiad"){
                    color = "#e67e22";
                    typText.text = "Obiad";
                    width = 55;
                }
                if(typ == "kolacja"){
                    color = "#e74c3c";
                    typText.text = "Kolacja";
                    width = 65;
                }
            }
            Text {
                id: typText
                color: "#ffffff"
                width: parent.width
                height: parent.height
                font.pointSize: 14
                font.family: robotoLight.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
    Rectangle {
        id: button
        anchors.top: img.bottom
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        width: img.width
        height: 50
        color: boxColor
        Text {
            text: name
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 23
            width: parent.width
            height: parent.height
            font.family: robotoLight.name
            font.bold: true
            color: "#ffffff"

        }
        PaperRipple {
            id: ripple
            radius: 3
            mouseArea: mouseAreaB
        }
        MouseArea {
            id: mouseAreaB
            width: parent.width
            height: parent.height
            onClicked: item1x.clicked()
        }
    }
}
