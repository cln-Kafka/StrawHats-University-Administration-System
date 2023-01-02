import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 6.3
import QtQuick.Layouts 1.3

Page{
    id: classPage
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
                text: qsTr("Course Name")
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
                id: rectangleForPrevious
                color: "#00000000"
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
                    id: textPrevious
                    text: qsTr("Previous")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 32
                    color: "white"
                    font.family: "Chalkboy"
                    property bool underlined: false
                    font.underline: underlined ? true : false
                }

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

            Rectangle {
                id: rectangleForExport
                color: "#00000000"
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
                    id: textExportClass
                    text: qsTr("Export class data")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 31
                    color: "white"
                    font.family: "Chalkboy"
                    property bool underlined: false
                    font.underline: underlined ? true : false

                    MouseArea {
                        id: mouseAreaExport
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {textExportClass.underlined = true}
                        onExited: {textExportClass.underlined = false}
                    }
                }
            }

            Rectangle {
                id: rectangleForAddingProfessor
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
                anchors.bottomMargin: 201
                anchors.topMargin: 466

                Text {
                    id: textAddProfessor
                    text: qsTr("Add a professor to class")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 31
                    color: "white"
                    font.family: "Chalkboy"
                    property bool underlined: false
                    font.underline: underlined ? true : false

                    MouseArea {
                        id: mouseAreaAddProfessor
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {textAddProfessor.underlined = true}
                        onExited: {textAddProfessor.underlined = false}
                        onClicked: {stackView.push(addProfessorPage)}
                    }
                }
            }

            Rectangle {
                id: rectangleForAddingStudent
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
                anchors.bottomMargin: 142
                anchors.topMargin: 525

                Text {
                    id: textAddStudent
                    text: qsTr("Add a student to class")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 31
                    color: "white"
                    font.family: "Chalkboy"
                    property bool underlined: false
                    font.underline: underlined ? true : false

                    MouseArea {
                        id: mouseAreaAddStudent
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {textAddStudent.underlined = true}
                        onExited: {textAddStudent.underlined = false}
                        onClicked: {stackView.push(addStudentPage)}
                    }
                }
            }

            Rectangle {
                id: rectangleClassData
                color: "transparent"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 19
                anchors.bottomMargin: 276
                anchors.rightMargin: 19
                anchors.topMargin: 178

                Text {
                    id: textCode
                    color: "#ffffff"
                    text: qsTr("Code:")
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
                    id: textHall
                    color: "#ffffff"
                    text: qsTr("Hall:")
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
                    id: textTime
                    color: "#ffffff"
                    text: qsTr("Time:")
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
                    id: textProfessor
                    color: "#ffffff"
                    text: qsTr("Professor/s:")
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
                    id: textSetCode
                    text: qsTr("CMP2241")
                    anchors.left: textCode.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 229
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    font.pointSize: 20
                    color: "white"
                    font.family: "Dk Crayon Crumble"
                    horizontalAlignment: Text.AlignHCenter
                }

                Text {
                    id: textSetHall
                    x: 159
                    width: 309
                    text: qsTr("3201")
                    anchors.left: textProfessor.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.topMargin: 129
                    anchors.bottomMargin: 100
                    anchors.leftMargin: 0
                    font.pointSize: 20
                    color: "white"
                    font.family: "Dk Crayon Crumble"
                    horizontalAlignment: Text.AlignHCenter
                }

                Text {
                    id: textSetTime
                    x: 159
                    width: 309
                    text: qsTr("12:15 - 01:45")
                    anchors.left: textTime.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.topMargin: 86
                    anchors.bottomMargin: 143
                    anchors.leftMargin: 0
                    font.pointSize: 20
                    color: "white"
                    font.family: "Dk Crayon Crumble"
                    horizontalAlignment: Text.AlignHCenter
                }

                Text {
                    id: textSetProfessor
                    text: qsTr("Prof(01), Prof(02)")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.topMargin: 43
                    anchors.bottomMargin: 186
                    anchors.leftMargin: 159
                    font.pointSize: 20
                    color: "white"
                    font.family: "Dk Crayon Crumble"
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }

    Rectangle {
        id: rectangleOfClassStudents
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
            anchors.topMargin: 40

            Component {
                id: nameDelegate
                Rectangle {
                    id: rectangleClassStudents
                    width: parent.width
                    height: 50
                    color: "transparent"
                    Text {
                        id: textClassStudent
                        text: model.name
                        color: "black"
                        anchors.fill: parent
                        font.family: "Dk Crayon Crumble"
                        font.pointSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        anchors.rightMargin: 5
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 5
                        anchors.topMargin: 5
                    }
                }
            }

            ListModel {
                id: nameModel
                ListElement {name: "Student 01 of the class"}
                ListElement {name: "Student 02 of the class"}
            }

            ListView {
                id: listAllClassStudents
                width: parent.width
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
                            width: listAllClassStudents.width
                            height: 50
                            z: 2
                            color: "#cecece"
                            radius: 60
                            Text {
                                text: "Registered Students"
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
