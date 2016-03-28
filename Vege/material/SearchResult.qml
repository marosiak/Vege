import QtQuick 2.0

Rectangle {
    id: mainRec
    property string imageUrl
    color: "#2ecc71"
    width: parent.width
    height: 70
    implicitWidth: 250
    implicitHeight: 70
    FontLoader {
        id: robotoMedium
        source: "/fonts/Roboto-Medium.ttf"
    }
    Image {
        id: imageXzX
        width: mainRec.width/2.5
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: imageUrl
    }
    Text {
        id: myText
        width: mainRec.width-imageXzX.width
        height: parent.height
        color: "#ffffff"
        anchors.left: imageXzX.right
        anchors.leftMargin: 5
        text: "Lazania (Test)"
        font.family: robotoMedium.name
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 22
    }
}
