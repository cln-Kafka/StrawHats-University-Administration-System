import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 6.3
import QtQuick.Layouts 1.3

Page{
    id: allClassesPage
    width: 1280
    height: 720

    Item {
        id: itemOfImageBoard
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 984
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0

        Image {
            id: imageBlackBoard
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "Resources/Images/blackBoard.png"
            anchors.rightMargin: 0
            fillMode: Image.Stretch

            Text {
                id: textStrawHats
                color: "#ffffff"
                text: qsTr("StrawHats")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 8
                anchors.leftMargin: 8
                anchors.bottomMargin: 641
                anchors.topMargin: 15
                font.pointSize: 50
                font.family: "Chalkboy Free Trial"
            }

            Rectangle {
                id: rectangleForExport
                color: "transparent"
                radius: 40
                border.color: "#ffffff"
                border.width: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 89
                anchors.topMargin: 578
                anchors.leftMargin: 8
                anchors.rightMargin: 8

                Text {
                    id: textExportClasses
                    text: qsTr("Export classes data")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 24
                    color: "white"
                    font.family: "Chalkboy"
                    property bool underlined: false
                    font.underline: underlined ? true : false

                    MouseArea {
                        id: mouseAreaExport
                        x: 0
                        y: 0
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {textExportClasses.underlined = true}
                        onExited: {textExportClasses.underlined = false}
                    }
                }
            }

            Rectangle {
                id: rectanglePrevious
                color: "#00000000"
                radius: 40
                border.color: "#ffffff"
                border.width: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 30
                anchors.topMargin: 637
                anchors.leftMargin: 8
                anchors.rightMargin: 8

                Text {
                    id: textPrevious
                    text: qsTr("Previous")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 32
                    color: "white"
                    font.family: "Chalkboy"
                    property bool underlined: false
                    font.underline: underlined ? true : false

                    MouseArea {
                        id: mouseAreaPrevious
                        anchors.fill: parent
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                        onClicked: {stackView.pop()}
                        hoverEnabled: true
                        onEntered: {textPrevious.underlined = true}
                        onExited: {textPrevious.underlined = false}
                    }
                }
            }
        }
    }

    Rectangle {
        id: rectangleOfClassesTable
        anchors.left: itemOfImageBoard.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0

        Image {
            id: imageCrumpledPaper
            anchors.fill: parent
            source: "qrc:/Resources/Images/CrumpledPaper.jpg"
            fillMode: Image.Stretch
        }

        Rectangle {
            id: mainRectangle
            color: "transparent"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 40
            anchors.leftMargin: 40
            anchors.bottomMargin: 40
            anchors.topMargin: 84

                Component {
                    id: nameDelegate
                    Rectangle {
                        id: rectangleClasses
                        width: parent.width
                        height: 50
                        color: "transparent"
                        Text {
                            id: textClass
                            text: model.name
                            color: "black"
                            anchors.fill: parent
                            font.family: "Dk Crayon Crumble"
                            font.pointSize: 20
                            property bool underlined: false
                            font.underline: underlined ? true : false
                            horizontalAlignment: Text.AlignHCenter
                            anchors.rightMargin: 5
                            anchors.leftMargin: 5
                            anchors.bottomMargin: 5
                            anchors.topMargin: 5
                            MouseArea {
                                id: mouseAreaOneClass
                                anchors.fill: parent
                                onClicked: {stackView.push(classPage)}
                                hoverEnabled: true
                                onEntered: {textClass.underlined = true}
                                onExited: {textClass.underlined = false}
                            }
                        }
                    }
                }

                ListModel {
                    id: nameModel
                    ListElement {name: "Course 01"}
                    ListElement {name: "Course 02"}
                }

                ListView {
                    id: listAllClasses
                    headerPositioning: ListView.OverlayHeader
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    highlightFollowsCurrentItem: true

                    header: Rectangle {
                                id: headerItem
                                width: listAllClasses.width
                                height: 50
                                z: 2
                                color: "#cecece"
                                radius: 60
                                Text {
                                    text: "All Classes"
                                    color: "black"
                                    anchors.centerIn: parent
                                    font.pointSize: 30
                                    font.bold: true
                                    font.family: "Dk Crayon Crumble"
                                    horizontalAlignment: Text.AlignHCenter
                                }
                            }

                    model: nameModel
                    clip: true
                    delegate: nameDelegate
                    cacheBuffer: 40
                }
            }
        }

        TextField {
            id: textFieldAllClasses
            anchors.left: itemOfImageBoard.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: rectangleOfClassesTable.top
            anchors.rightMargin: 40
            anchors.leftMargin: 40
            anchors.topMargin: 34
            anchors.bottomMargin: -82
            horizontalAlignment: Text.AlignLeft
            font.bold: true
            font.pointSize: 25
            placeholderText: qsTr("Search for a class")
            placeholderTextColor: "#000000"
            color: "#000000"
            font.family: "Dk Crayon Crumble"

            background:Rectangle {
                id: searchBorder
                width: parent.width
                height: 2
                color: "#000000"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
            }
        }
}
