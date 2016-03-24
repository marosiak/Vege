import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import "material"
import "./scripts/FrontEnd.js" as FrontEnd

Window {
    id: window
    visible: true
    width: 400
    height: 600
    Page {
        id: searchPage
        visible: false;
        SearchBar{
            onClicked: {
                infoPage.visible = true;
                searchPage.visible = false;
            }
        }
    }

    Page {
        id: infoPage
        visible: true;
        TopBar {
            onClicked: {
                infoPage.visible = false;
                searchPage.visible = true;
            }

        }
    }
}
