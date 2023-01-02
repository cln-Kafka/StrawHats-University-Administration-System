#ifndef DASHBOARD_H
#define DASHBOARD_H

#include <QDialog>
#include <QApplication>
#include <QFile>
#include <QTextStream>
#include <QStyle>
#include <QLabel>
#include <QPushButton>
#include <vector>
#include <algorithm>
#include <QAbstractItemModel>
#include <QModelIndexList>
#include <QTimer>
#include "class.h"
#include <QFileDialog>
#include "student.h"
#include "hall.h"
#include "professor.h"

namespace Ui {
class Dashboard;
}

class Dashboard : public QDialog
{
    Q_OBJECT

public:
    explicit Dashboard(QWidget *parent = nullptr);
    ~Dashboard();
    std::vector<Class> courses;
    std::vector<Hall> halls;
    std::vector<Student> students;
    std::vector<Professor> professors;

private slots:

    void on_tableWidget_classes_cellClicked(int row, int column);

    void on_pushButton_clicked();

    void on_pushButton_Delete_course_clicked();

    void on_pushButton_Save_student_clicked();

    void on_pushButton_Cancel_student_clicked();

    void on_pushButton_Save_professor_clicked();

    void on_tableWidget_students_cellClicked(int row, int column);

    void on_pushButton_Delete_student_clicked();

    void on_pushButton_Add_student_clicked();

    void on_pushButton_cancel_adding_student_clicked();

    void on_pushButton_Save_new_professor_clicked();

    void on_pushButton_Delete_professor_clicked();

    void on_pushButton_Cancel_new_professor_clicked();

    void on_lineEdit_search_class_textChanged(const QString &arg1);

    void on_lineEdit_search_professor_textChanged(const QString &arg1);

    void on_lineEdit_search_student_textChanged(const QString &arg1);

    void on_pushButton_save_course_to_student_clicked();

    void on_pushButto_exportClasses_clicked();

    void on_pushButton_save_course_to_prof_clicked();

    void on_pushButton_cancel_add_course_to_prof_clicked();

    void on_pushButton_cancel_add_course_to_student_clicked();

    void on_tableWidget_professors_cellClicked(int row, int column);

    void on_pushButton_exportStudents_clicked();

    void on_pushButton_exportProfessors_clicked();

    void on_tableWidget_class_students_cellClicked(int row, int column);

private:
    Ui::Dashboard *ui;
    void init();
signals:
};
#endif // DASHBOARD_H
