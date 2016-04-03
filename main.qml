import QtQuick 2.4
import QtQuick.Controls 1.3
import QtGraphicalEffects 1.0
import "material"

ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 400
    height: 602
    title: qsTr("Vege")
    Flickable {
        width: parent.width
        height: parent.height-bar.height
        anchors.top: bar.bottom
        anchors.topMargin: 0
        ListModel {
            id: model
            ListElement {
                nazwa: "Lazania z czymś tam"
                opis: "To jest lazania z czymś, jest bardzo dobra, polecam gg"
            }
            ListElement {
                nazwa: "Lazania z czymś tam"
                opis: "To jest lazania z czymś, jest bardzo dobra, polecam gg"
            }
            ListElement {
                nazwa: "Lazania z czymś tam"
                opis: "To jest lazania z czymś, jest bardzo dobra, polecam gg"
            }
        }

        ListView {
            width: parent.width
            height: parent.height
            model: model
                delegate: Card {
                    id: card1
                    width: parent.width-8
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 190
                    MatText {
                        id: t0
                        matText: "Śniadanie"
                        type: "title"
                        width: parent.width-40
                        height: 20
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        anchors.left: parent.left
                        anchors.leftMargin: 16
                    }
                    MatText {
                        id: t1
                        matText: "Lazania z serem"
                        type: "header"
                        width: parent.width-40
                        height: 24
                        anchors.top: t0.bottom
                        anchors.topMargin: -7
                        anchors.left: parent.left
                        anchors.leftMargin: 16
                    }
                    MatText {
                        id: t2
                        matText: "Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60."
                        type: "body"
                        width: parent.width-40
                        height: 70
                        anchors.top: t1.bottom
                        anchors.topMargin: 11
                        anchors.left: parent.left
                        anchors.leftMargin: 16
                    }
                    Button {
                        anchors.left: parent.left
                        anchors.leftMargin: 13
                        anchors.top: t2.bottom
                        anchors.topMargin: 22
                        buttonText: "Czytaj"
                        width: 49
                        buttonColor: "#4CAF50"
                    }
                }
        }
    }

    SearchBar {id: bar; width: parent.width-8 ;anchors.horizontalCenter: parent.horizontalCenter}
}
