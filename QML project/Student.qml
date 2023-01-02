import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 6.3
import QtQuick.Layouts 1.3

Page{
    id: studentPage
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
                id: rectangleForPrevious
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
                    id: textExportStudent
                    text: qsTr("Export student data")
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
                        onEntered: {textExportStudent.underlined = true}
                        onExited: {textExportStudent.underlined = false}
                    }
                }
            }

            Rectangle {
                id: rectangleStudentData
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
                    id: textAverageGrade
                    color: "#ffffff"
                    text: qsTr("Average Grade:")
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

                Text {
                    id: textSetStudentFirstName
                    x: 165
                    y: 0
                    color: "#ffffff"
                    text: qsTr("Text")
                    anchors.left: textFirstName.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignHCenter
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 229
                    anchors.topMargin: 0
                    font.family: "DK Crayon Crumble"
                }

                Text {
                    id: textSetStudentSecondName
                    x: 160
                    y: 9
                    width: 309
                    color: "#ffffff"
                    text: qsTr("Text")
                    anchors.left: textSecondName.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: 43
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 186
                    font.family: "DK Crayon Crumble"
                }

                Text {
                    id: textSetStudentAge
                    x: 160
                    y: 0
                    width: 309
                    color: "#ffffff"
                    text: qsTr("Text")
                    anchors.left: textAge.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: 86
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 143
                    font.family: "DK Crayon Crumble"
                }

                Text {
                    id: textSetStudentMobile
                    x: 160
                    y: -2
                    width: 309
                    color: "#ffffff"
                    text: qsTr("Text")
                    anchors.left: textMobile.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: 129
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 100
                    font.family: "DK Crayon Crumble"
                }

                Text {
                    id: textSetStudentEmail
                    x: 160
                    y: 7
                    width: 309
                    color: "#ffffff"
                    text: qsTr("Text")
                    anchors.left: textEmail.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: 172
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 57
                    font.family: "DK Crayon Crumble"
                }

                Text {
                    id: textSetStudentAverageGrade
                    x: 160
                    y: 0
                    width: 309
                    color: "#ffffff"
                    text: qsTr("Text")
                    anchors.left: textAverageGrade.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 28
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: 215
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 14
                    font.family: "DK Crayon Crumble"
                }
            }
        }
    }

    Rectangle {
        id: rectangleOfStudentClassesAndGrades
        anchors.left: itemOfImageBoard.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.leftMargin: 0

        Image {
            id: imageCrumpledPaper
            anchors.fill: parent
            source: "qrc:/Resources/Images/CrumpledPaper.jpg"
            fillMode: Image.Stretch
        }

        Rectangle {
            id: mainRectangle
            color: "#00000000"
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

                Row {
                    id: rowContaining
                    spacing: 4

                    Text {
                        id: textStudentClass
                        width: 344
                        height: 35
                        text: model.name
                        color: "black"
                        font.family: "Dk Crayon Crumble"
                        font.pointSize: 20
                        horizontalAlignment: Text.AlignHCenter

                    }

                    Text {
                        id: textStudentGrade
                        width: 344
                        height: 35
                        text: model.grade
                        color: "black"
                        font.family: "Dk Crayon Crumble"
                        font.pointSize: 20
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }

        ListModel {
            id: classModel
            ListElement {
                name: "Course 01"
                grade: "Grade 01"}
            ListElement {
                name: "Course 02"
                grade: "Grade 02"}
        }

        ListView {
            id: listAllStudentClassesAndGrades
            width: parent.width
            headerPositioning: ListView.OverlayHeader
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 40
            anchors.leftMargin: 40
            anchors.bottomMargin: 40
            anchors.topMargin: 40
            highlightFollowsCurrentItem: true

            header: Rectangle {
                        id: headerItem
                        width: listAllStudentClassesAndGrades.width
                        height: 50
                        z: 2
                        color: "#cecece"
                        radius: 60
                        Text {
                            text: "Enrolled classes and their grades"
                            color: "black"
                            anchors.centerIn: parent
                            font.pointSize: 30
                            font.bold: true
                            font.family: "Dk Crayon Crumble"
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

            model: classModel
            clip: true
            delegate: nameDelegate
            cacheBuffer: 40
        }
    }
}

/*##^##
Designer {
    D{i:0}D{i:17;locked:true}
}
##^##*/
