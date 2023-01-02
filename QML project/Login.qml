import QtQuick 2.12
import QtQuick.Controls 6.3
import QtQuick.Layouts 1.3
import SH 1.0

Page {
    id: loginPage
    width: 1280
    height: 720

    LoginObject {
        id: checkLogin
    }

    Image {
        id: image
        anchors.fill: parent
        source: "Resources/Images/blackBoardWithStrawHats1.png"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: rectangelInputArea
        color: "transparent"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 395
        anchors.leftMargin: 396
        anchors.bottomMargin: 120
        anchors.topMargin: 299

        TextField {
            id: textFieldUserName
            height: parent.height/10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 8
            anchors.leftMargin: 8
            anchors.bottomMargin: 209
            anchors.topMargin: 35
            font.pointSize: 30
            placeholderText: "User Name"
            placeholderTextColor: "white"
            horizontalAlignment: Text.AlignLeft
            color: "white"
            font.family: "Chalkboy"

            onTextChanged: checkLogin.setusername(text)
            property string txtUsername: checkLogin.username

            background:Rectangle {
                id: userNameBorder
                width: parent.width
                height: 2
                color: "#cecece"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
            }
        }

        TextField {
            id: textFieldUserPassword
            height: parent.height/10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 8
            anchors.leftMargin: 8
            anchors.bottomMargin: 107
            anchors.topMargin: 137
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 30
            placeholderText: "User Password"
            placeholderTextColor: "white"
            color: "white"
            font.family: "Chalkboy"

            onTextChanged: checkLogin.setpassword(text)
            property string txtPassword: checkLogin.password

            property bool showText: false
            echoMode: showText ? TextField.Normal : TextField.Password

            background:Rectangle {
                id: userPasswordBorder
                width: parent.width
                height: 2
                color: "#cecece"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
            }

        }

        Button {
            id: buttonLogIn
            height: parent.height/8
            visible: true
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 81
            anchors.leftMargin: 81
            anchors.bottomMargin: 8
            anchors.topMargin: 243


            onClicked: {
                if(textFieldUserName.txtUsername == "Admin" && textFieldUserPassword.txtPassword == "AdminOpen"){
                    stackView.push(homePage)
                }
                else if(textFieldUserName.txtUsername == "" || textFieldUserPassword.txtPassword == ""){
                    popupMissing.open()
                }
                else {popupError.open()}
            }

            background: Rectangle {
                id: backgroundLogInButton
                width: parent.width
                height: parent.height
                color: buttonLogIn.hovered ? "#cecece" : "#989898"
                border.width: buttonLogIn.down ? 3 : 0
                border.color: "#989898"
                radius: 10
            }

            contentItem: Text {
                id: textLogIn
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 30
                text: qsTr("Log In")
                color: "black"
                font.family: "Chalkboy"
            }
        }

        MouseArea {
            id: mouseAreaShowPassword
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 17
            anchors.leftMargin: 415
            anchors.bottomMargin: 107
            anchors.topMargin: 137

            Image {
                id: seenOrHided
                visible: true
                anchors.fill: parent
                source: "qrc:/Resources/Images/eye.png"
                fillMode: Image.PreserveAspectFit
            }

            onPressed: {
                seenOrHided.source = "qrc:/Resources/Images/blind.png"
                textFieldUserPassword.showText = true
            }
            onReleased: {
                seenOrHided.source = "qrc:/Resources/Images/eye.png"
                textFieldUserPassword.showText = false
            }
        }
    }

    Popup {
        id: popupError
        anchors.centerIn: parent
        width: 400
        height: 200
        modal: true
        focus: true

        Image {
            id: popupErrorBlackboard
            width: 400
            height: 200
            anchors.fill: parent
            source: "qrc:/Resources/Images/blackBoard.png"

            Text {
                width: parent.width
                height: 50
                font.pointSize: 18
                color: "white"
                font.bold: true
                font.family: "Dk Crayon Crumble"
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenterOffset: -19
                anchors.horizontalCenterOffset: 0
                anchors.centerIn: parent
                text: "Username or password is incorrect!!"
            }
        }

        Button {
            id: closePopupErrorButton
            x: 146
            y: 150
            width: 110
            height: 30
            text: "OK"
            font.bold: true
            font.pointSize: 15
            font.family: "Dk Crayon Crumble"
            onClicked: popupError.close()
        }
    }

    Popup {
        id: popupMissing
        anchors.centerIn: parent
        width: 400
        height: 200
        modal: true
        focus: true

        Image {
            id: popupMissingBlackboard
            width: 400
            height: 200
            anchors.fill: parent
            source: "qrc:/Resources/Images/blackBoard.png"

            Text {
                width: parent.width
                height: 50
                font.pointSize: 18
                color: "white"
                font.bold: true
                font.family: "Dk Crayon Crumble"
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenterOffset: -19
                anchors.horizontalCenterOffset: 0
                anchors.centerIn: parent
                text: "Please, enter the username and password"
            }
        }

        Button {
            id: closePopupMissingButton
            x: 146
            y: 150
            width: 110
            height: 30
            text: "OK"
            font.bold: true
            font.pointSize: 15
            font.family: "Dk Crayon Crumble"
            onClicked: popupMissing.close()
        }
    }
}
