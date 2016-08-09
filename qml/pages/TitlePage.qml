/*
  (c) 2016 by Sebastian J. Wolf
  www.wunderfitz.org
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.wunderfitz 1.0

Page {
    id: titlePage

    SilicaFlickable {

        anchors.fill: parent
        contentHeight: searchColumn.height

        PullDownMenu {
            MenuItem {
                text: qsTr("About Wunderfitz")
                onClicked: pageStack.push(aboutPage)
            }
        }

        Column {
            id: searchColumn

            width: titlePage.width
            spacing: Theme.paddingLarge

            PageHeader {
                id: header
                title: qsTr("Wunderfitz")
            }

            SearchField {
                id: searchField
                x: Theme.paddingMedium
                width: parent.width
                placeholderText: qsTr("Search in dictionary...")
                focus: true

                EnterKey.iconSource: "image://theme/icon-m-enter-close"
                EnterKey.onClicked: focus = false

                onTextChanged: {
                    heinzelnissemodel.search(searchField.text)
                }
            }

            SilicaListView {

                id: listView

                height: titlePage.height - header.height - searchField.height - ( 2 * Theme.paddingLarge )
                anchors.left: parent.left
                anchors.right: parent.right

                clip: true

                model: HeinzelnisseModel {
                    id: heinzelnissemodel
                }

                delegate: ListItem {
                    height: wordRow.height
                    Row {
                        id: wordRow
                        spacing: Theme.paddingLarge
                        width: parent.width
                        Column {
                            width: parent.width / 2 -  2 * Theme.paddingLarge
                            Label {
                                width: parent.width
                                font.pixelSize: Theme.fontSizeSmall
                                x: Theme.horizontalPageMargin
                                wrapMode: Text.Wrap
                                text: display.wordNorwegian + display.genderNorwegian
                            }
                            Label {
                                width: parent.width
                                font.pixelSize: Theme.fontSizeExtraSmall
                                x: Theme.horizontalPageMargin
                                wrapMode: Text.Wrap
                                text: display.otherNorwegian
                            }
                        }
                        Column {
                            width: parent.width / 2 - 2 * Theme.paddingLarge
                            Label {
                                width: parent.width
                                font.pixelSize: Theme.fontSizeSmall
                                x: Theme.horizontalPageMargin
                                wrapMode: Text.Wrap
                                text: display.wordGerman + display.genderGerman
                            }
                            Label {
                                width: parent.width
                                font.pixelSize: Theme.fontSizeExtraSmall
                                x: Theme.horizontalPageMargin
                                wrapMode: Text.Wrap
                                text: display.otherGerman
                            }
                        }
                    }


                }

                VerticalScrollDecorator {}

            }

        }



    }
}


