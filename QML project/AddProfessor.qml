import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 6.3
import QtQuick.Layouts 1.3

Page{
    id: addProfessorPage
    width: 1280
    height: 720

    Item {
        id: itemOfImageBoard
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 774
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
                anchors.bottomMargin: 656
                anchors.topMargin: 0
                font.pointSize: 50
                font.family: "Chalkboy Free Trial"
            }

            Rectangle {
                id: rectangleForCancel
                color: "transparent"
                border.color: "#ffffff"
                border.width: 2
                radius: 40
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 19
                anchors.leftMargin: 18
                anchors.bottomMargin: 24
                anchors.topMargin: 643

                Text {
                    id: textCancel
                    text: qsTr("Cancel")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 32
                    color: "white"
                    font.family: "Chalkboy"
                    property bool underlined: false
                    font.underline: underlined ? true : false
                }

                MouseArea {
                    id: mouseAreaCancel
                    anchors.fill: parent
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    onClicked: {stackView.pop()}
                    hoverEnabled: true
                    onEntered: {textCancel.underlined = true}
                    onExited: {textCancel.underlined = false}
                }
            }

            Rectangle {
                id: rectangleForSave
                color: "transparent"
                border.color: "#ffffff"
                border.width: 2
                radius: 40
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 19
                anchors.leftMargin: 18
                anchors.bottomMargin: 83
                anchors.topMargin: 584

                Text {
                    id: textSave
                    text: qsTr("Save data")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 31
                    color: "white"
                    font.family: "Chalkboy"
                    property bool underlined: false
                    font.underline: underlined ? true : false

                    MouseArea {
                        id: mouseAreaSave
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {textSave.underlined = true}
                        onExited: {textSave.underlined = false}
                        onClicked: {stackView.pop()}
                    }
                }
            }

            Rectangle {
                id: rectangleProfessorData
                color: "transparent"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 19
                anchors.leftMargin: 19
                anchors.bottomMargin: 259
                anchors.topMargin: 195

                Text {
                    id: textFirstName
                    color: "#ffffff"
                    text: qsTr("First Name:")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    anchors.rightMargin: 309
                    anchors.leftMargin: 8
                    anchors.bottomMargin: 229
                    anchors.topMargin: 0
                    font.family: "DK Crayon Crumble"
                }

                Text {
                    id: textSecondName
                    color: "#ffffff"
                    text: qsTr("Second Name:")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    anchors.rightMargin: 309
                    anchors.leftMargin: 8
                    anchors.bottomMargin: 186
                    anchors.topMargin: 43
                    font.family: "DK Crayon Crumble"
                }

                Text {
                    id: textAge
                    color: "#ffffff"
                    text: qsTr("Age:")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    anchors.rightMargin: 309
                    anchors.leftMargin: 8
                    anchors.bottomMargin: 143
                    anchors.topMargin: 86
                    font.family: "DK Crayon Crumble"
                }

                Text {
                    id: textMobile
                    color: "#ffffff"
                    text: qsTr("Mobile:")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    anchors.rightMargin: 309
                    anchors.leftMargin: 8
                    anchors.bottomMargin: 100
                    anchors.topMargin: 129
                    font.family: "DK Crayon Crumble"
                }

                Text {
                    id: textEmail
                    color: "#ffffff"
                    text: qsTr("E-mail:")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    anchors.rightMargin: 309
                    anchors.leftMargin: 8
                    anchors.bottomMargin: 57
                    anchors.topMargin: 172
                    font.family: "DK Crayon Crumble"
                }

                Text {
                    id: textTitle
                    color: "#ffffff"
                    text: qsTr("Title:")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    anchors.rightMargin: 309
                    anchors.leftMargin: 8
                    anchors.bottomMargin: 14
                    anchors.topMargin: 215
                    font.family: "DK Crayon Crumble"
                }

                TextField {
                    id: textFieldFirstName
                    height: parent.height/10
                    anchors.left: textFirstName.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 0
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 229
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 20
                    placeholderText: qsTr("First Name")
                    placeholderTextColor: "white"
                    color: "white"
                    font.family: "Dk Crayon Crumble"

                    background: Rectangle {
                        id: rectangleFirstNameBorder
                        width: parent.width
                        height: 1
                        color: "#cecece"
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                    }
                }

                TextField {
                    id: textFieldSecondName
                    height: parent.height/10
                    anchors.left: textSecondName.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.topMargin: 43
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 20
                    placeholderText: qsTr("Second Name")
                    anchors.bottomMargin: 186
                    placeholderTextColor: "white"
                    color: "white"
                    font.family: "Dk Crayon Crumble"

                    background: Rectangle {
                        id: rectangleSecondNameBorder
                        width: parent.width
                        height: 1
                        color: "#cecece"
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                    }
                }

                TextField {
                    id: textFieldAge
                    height: parent.height/10
                    anchors.left: textAge.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.topMargin: 86
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 20
                    placeholderText: qsTr("Age")
                    anchors.bottomMargin: 143
                    placeholderTextColor: "white"
                    color: "white"
                    font.family: "Dk Crayon Crumble"

                    background: Rectangle {
                        id: rectangleAgeBorder
                        width: parent.width
                        height: 1
                        color: "#cecece"
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                    }
                }

                TextField {
                    id: textFieldMobile
                    height: parent.height/10
                    anchors.left: textMobile.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.topMargin: 129
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 20
                    placeholderText: qsTr("Mobile")
                    anchors.bottomMargin: 100
                    placeholderTextColor: "white"
                    color: "white"
                    font.family: "Dk Crayon Crumble"

                    background: Rectangle {
                        id: rectangleMobileBorder
                        width: parent.width
                        height: 1
                        color: "#cecece"
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                    }
                }

                TextField {
                    id: textFieldEmail
                    height: parent.height/10
                    anchors.left: textEmail.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 57
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.topMargin: 172
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 20
                    placeholderText: qsTr("E-mail")
                    placeholderTextColor: "white"
                    color: "white"
                    font.family: "Dk Crayon Crumble"

                    background: Rectangle {
                        id: rectangleEmialBorder
                        width: parent.width
                        height: 1
                        color: "#cecece"
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                    }
                }

                TextField {
                    id: textFieldTitle
                    height: parent.height/10
                    anchors.left: textTitle.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.topMargin: 215
                    horizontalAlignment: Text.AlignLeft
                    font.pointSize: 20
                    placeholderText: qsTr("Title")
                    anchors.bottomMargin: 14
                    placeholderTextColor: "white"
                    color: "white"
                    font.family: "Dk Crayon Crumble"

                    background: Rectangle {
                        id: rectangleTitleBorder
                        width: parent.width
                        height: 1
                        color: "#cecece"
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                    }
                }
            }
        }
    }

    Rectangle {
        id: rectangleOfProfessorClasses
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
                        id: rectangleProfessorClasses
                        width: parent.width
                        height: 50
                        color: "transparent"
                        TextField {
                            id: textFieldClass
                            height: parent.height/10
                            //text:
                            anchors.fill: parent
                            anchors.rightMargin: 5
                            anchors.leftMargin: 5
                            anchors.bottomMargin: 5
                            anchors.topMargin: 5
                            horizontalAlignment: Text.AlignHCenter
                            font.pointSize: 20
                            placeholderText: qsTr(model.name)
                            placeholderTextColor: "black"
                            color: "black"
                            font.family: "Dk Crayon Crumble"

                            background: Rectangle {
                                id: rectangleTitleBorder
                                width: parent.width
                                height: 1
                                color: "#cecece"
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 0
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
                    id: listAllProfessorClasses
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
                                width: listAllProfessorClasses.width
                                height: 50
                                z: 2
                                color: "#cecece"
                                radius: 60
                                Text {
                                    text: "Professor's Classes"
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

}
