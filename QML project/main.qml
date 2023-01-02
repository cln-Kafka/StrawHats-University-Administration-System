import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 6.3
import QtQuick.Layouts 1.3

Window {
    id: mainPage
    width: 1280
    height: 720
    visible: true

    Login {id: loginPage}

    Student {id: studentPage}

    Welcome {id: welcomePage}

    HomePage {id: homePage}

    ClassPage {id: classPage}

    Professor {id: professorPage}

    AddStudent {id: addStudentPage}

    AllClasses {id: allClassesPage}

    AllStudents {id: allStudentsPage}

    AddProfessor {id: addProfessorPage}

    AllProfessors {id: allProfessorsPage}

    Timer{
        id: timerWelcome
        interval: 1800
        repeat: false
        running: false
        onTriggered: {
            stackView.push(loginPage)
        }
    }

    StackView {
        id: stackView
        width: mainPage.width
        height: mainPage.height
        initialItem: welcomePage
    }

    Component.onCompleted: {
        timerWelcome.start();
    }
}


