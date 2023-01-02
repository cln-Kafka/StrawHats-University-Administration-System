import QtQuick 2.12
import QtQuick.Controls 6.3
import QtQuick.Layouts 1.3

Page {
    id: welcomePage
    width: 1280
    height: 720

    Image {
        id: image
        anchors.fill: parent
        source: "Resources/Images/TrialWelcomeScreen1.png"
        fillMode: Image.PreserveAspectFit
    }

}
