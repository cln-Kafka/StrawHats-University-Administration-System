import QtQuick 2.12
import QtQuick.Controls 6.3
import QtQuick.Layouts 1.3

Page {
    id: homePage
    width: 1280
    height: 720
    visible: true
    title: qsTr("StrawHats")

    Image {
        id: imageBlackBoard
        anchors.fill: parent
        source: "Resources/Images/blackBoardWithStrawHats1.png"

        Text {
            id: textClasses
            color: "#ffffff"
            text: qsTr("Classes")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 60
            horizontalAlignment: Text.AlignHCenter
            anchors.rightMargin: 853
            anchors.leftMargin: 133
            anchors.bottomMargin: 195
            anchors.topMargin: 446
            font.bold: true
            font.family: "DK Crayon Crumble"

            property bool underlined: false
            font.underline: underlined ? true : false
        }

        Text {
            id: textStudents
            color: "#ffffff"
            text: qsTr("Students")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 60
            horizontalAlignment: Text.AlignHCenter
            anchors.rightMargin: 493
            anchors.leftMargin: 493
            anchors.bottomMargin: 195
            anchors.topMargin: 446
            font.bold: true
            font.family: "DK Crayon Crumble"

            property bool underlined: false
            font.underline: underlined ? true : false
        }

        Text {
            id: textProfessors
            color: "#ffffff"
            text: qsTr("Professors")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 60
            horizontalAlignment: Text.AlignHCenter
            anchors.rightMargin: 128
            anchors.leftMargin: 858
            anchors.bottomMargin: 195
            anchors.topMargin: 446
            font.bold: true
            font.family: "DK Crayon Crumble"

            property bool underlined: false
            font.underline: underlined ? true : false
        }

        MouseArea {
            id: mouseAreaAllClasses
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 853
            anchors.leftMargin: 133
            anchors.bottomMargin: 195
            anchors.topMargin: 446

            hoverEnabled: true
            onEntered: {textClasses.underlined = true}
            onExited: {textClasses.underlined = false}

            onClicked: {
                stackView.push(allClassesPage)
            }
        }

        MouseArea {
            id: mouseAreaAllStudents
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 493
            anchors.leftMargin: 493
            anchors.bottomMargin: 195
            anchors.topMargin: 446

            hoverEnabled: true
            onEntered: {textStudents.underlined = true}
            onExited: {textStudents.underlined = false}

            onClicked: {stackView.push(allStudentsPage)}
        }

        MouseArea {
            id: mouseAreaAllProfessors
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 128
            anchors.leftMargin: 858
            anchors.bottomMargin: 195
            anchors.topMargin: 446

            hoverEnabled: true
            onEntered: {textProfessors.underlined = true}
            onExited: {textProfessors.underlined = false}

            onClicked: {stackView.push(allProfessorsPage)}
        }
    }
}


