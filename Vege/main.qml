import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import "material"
import "./scripts/FrontEnd.js" as FrontEnd
import "./scripts/DataBase.js" as DataBase
import QtQml.Models 2.2
import QtQuick.LocalStorage 2.0



Window {
    id: window
    visible: true
    width: 400
    height: 600
    color: "#27ae60"
    //color: "red"
    FontLoader {
        id: robotoMedium
        source: "/fonts/Roboto-Medium.ttf"
    }
    FontLoader {
        id: robotoLight
        source: "/fonts/Roboto-Light.ttf"
    }
    Page {
        id: searchPage
        visible: false;
        SearchBar{ id: searchBar
            onClicked: {
                infoPage.visible = true;
                searchPage.visible = false;
                contentPage.visible = false;
            }
        }
        SearchResult {
            id: searchR
            anchors.top: searchBar.bottom
            anchors.topMargin: 5
            imageUrl: "../images/lazania.jpg"
        }
    }

    Page {
        id: infoPage
        visible: true;
        Component.onCompleted: {
            DataBase.returnFromDB()
        }
        ListView {
            width: window.width; height: parent.height-topBar.height-18
            model: ListModel {id: myModel}
            anchors.top: topBar.bottom
            anchors.topMargin: 15
            delegate: Box {
                imgUrl: "../images/"+obrazek
                boxColor: "#2ecc71"
                name: nazwa
                typX: typ
                onClicked: {
                    infoPage.visible = false;
                    searchPage.visible = false;
                    contentPage.visible = true;
                    nazwaPotrawy.text = nazwa;
                    contentImage.source = "./images/"+obrazek;
                    opisText.text = opis;
                    przepisText.text = przepis;
                }
            }
        }
        TopBar {
            id: topBar
            onClicked: {
                infoPage.visible = false;
                searchPage.visible = true;
                contentPage.visible = false;
            }
        }

    }

    Page {
        id: contentPage
        visible: false
        width: parent.width
        height: parent.height
        Flickable {
            anchors.top: parent.top
            anchors.topMargin: 15+70
            width: parent.width
            height: parent.height*2
            contentHeight: 64+nazwaPotrawy.height+contentImage.height+opis_Rectangle.height+przepis_Rectangle.height+window.height+72
            Text {
                id: nazwaPotrawy
                width: parent.width
                color: "#ffffff"
                text: "Lazania(test)"
                font.pointSize: 24
                anchors.top: parent.top
                anchors.topMargin: 0
                horizontalAlignment: Text.AlignHCenter
                font.family: robotoLight.name
                font.bold: true
            }
            Image {
                id: contentImage
                width: parent.width-20
                height: 200
                fillMode: Image.PreserveAspectFit
                anchors.top: nazwaPotrawy.bottom
                anchors.topMargin: 15
                //source: "./images/lazania.jpg"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Rectangle {
                id: opis_Rectangle
                anchors.horizontalCenter: parent.horizontalCenter
                width: contentImage.width
                height: opisText.lineCount*26+64
                anchors.top: contentImage.bottom
                anchors.topMargin: 15
                //color: "#2ecc71"
                color: "#3FC380"
                Text {
                    id: opis_Header
                    width: parent.width
                    height: 60
                    color: "#ffffff"
                    text: "Opis"
                    font.pointSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    font.family: robotoLight.name
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: opisText
                    text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                    font.pointSize: 14
                    width: parent.width-15
                    color: "#ffffff"
                    wrapMode: Text.WordWrap
                    anchors.top: opis_Header.bottom
                    anchors.topMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    font.family: robotoLight.name
                }
            }
            Rectangle {
                id: przepis_Rectangle
                anchors.horizontalCenter: parent.horizontalCenter
                width: contentImage.width
                height: przepisText.lineCount*26+64
                anchors.top: opis_Rectangle.bottom
                anchors.topMargin: 15
                //color: "#2ecc71"
                color: "#3FC380"
                Text {
                    id: przepis_Header
                    width: parent.width
                    height: 60
                    color: "#ffffff"
                    text: "Przepis"
                    font.pointSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    font.family: robotoLight.name
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                }

                Text {
                    id: przepisText
                    text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                    font.pointSize: 14
                    width: parent.width-15
                    color: "#ffffff"
                    wrapMode: Text.WordWrap
                    anchors.top: przepis_Header.bottom
                    anchors.topMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    font.family: robotoLight.name
                }
            }
        }
        ContentBar{id: contentBar}
    }
}
