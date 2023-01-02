#include "dashboard.h"
#include "ui_dashboard.h"
#include "class.h"
#include "hall.h"
#include <algorithm>
#include <vector>
#include <QMessageBox>
#include <QCheckBox>
#include <QRegularExpression>
Dashboard::Dashboard(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dashboard)
{
    ui->setupUi(this);
    this->setWindowIcon(QIcon("C:/Qt/Projects/LoginNew/hatlcon.png"));
    this->setWindowTitle("StrawHats");
    ui->tableWidget_class_students->setColumnWidth(0, 195);
    ui->tableWidget_class_students->setColumnWidth(1, 195);
    ui->tableWidget_classes->setColumnWidth(0, 195);
    ui->tableWidget_classes->setColumnWidth(1, 195);
    ui->tableWidget_students->setColumnWidth(0, 390);
    ui->tableWidget_professors->setColumnWidth(0, 390);
    ui->tableWidget_Course_grade->setColumnWidth(0, 195);
    ui->tableWidget_Course_grade->setColumnWidth(1, 195);
    ui->tableWidget_professors_courses->setColumnWidth(0, 390);
    Hall hall1, hall2, hall3;
    hall1.set_name("3201");
    hall2.set_name("3101");
    hall3.set_name("20102");
    halls.push_back(hall1);
    halls.push_back(hall2);
    halls.push_back(hall3);
    init();
}

Dashboard::~Dashboard()
{
    delete ui;
};

void Dashboard::init()
{
    QTabWidget tab = QTabWidget();
    //displaying courses in the table
    if(courses.size() != 0)
    {
        int rowcount = ui->tableWidget_classes->rowCount();
        if(courses.size() > rowcount)
            for(int i{rowcount}; i < courses.size(); ++i)
            {
                ui->tableWidget_classes->insertRow(i);
            }
        else if(courses.size() < rowcount)
            for(int i{rowcount}; i >= courses.size(); --i)
            {
                ui->tableWidget_classes->removeRow(i);
            }
        for(int index{0}; index < courses.size(); ++index)
        {
            ui->tableWidget_classes->setItem(index, 0, new QTableWidgetItem(courses[index].get_name()));
            ui->tableWidget_classes->setItem(index, 1, new QTableWidgetItem(courses[index].get_code()));
        }
    }
    else
    {
        ui->tableWidget_classes->setItem(0, 0, new QTableWidgetItem("-"));
        ui->tableWidget_classes->setItem(0, 1, new QTableWidgetItem("-"));
    }

    //displaying students in the table
    if(students.size() != 0)
    {
        int rowcount = ui->tableWidget_students->rowCount();
        if(students.size() > rowcount)
            for(int i{rowcount}; i < students.size(); ++i)
            {
                ui->tableWidget_students->insertRow(i);
            }
        else if(students.size() < rowcount)
            for(int i{rowcount}; i >= students.size(); --i)
            {
                ui->tableWidget_students->removeRow(i);
            }
        for(int index{0}; index < students.size(); ++index)
        {
            ui->tableWidget_students->setItem(index, 0, new QTableWidgetItem(students[index].get_concatinated_name()));
            for(int i{0}; i < students[index].print_classes_names().size(); ++i)
            {
                ui->tableWidget_Course_grade->setItem(index, 0, new QTableWidgetItem(students[index].print_classes_names()[i]));
                ui->tableWidget_Course_grade->setItem(index, 1, new QTableWidgetItem(students[index].print_student_grades()[i]));
            }

        }
    }
    else
    {
        ui->tableWidget_students->setItem(0, 0, new QTableWidgetItem("-"));
    }

    //displaying professors in the table
    if(professors.size() != 0)
    {
        int rowcount = ui->tableWidget_professors->rowCount();
        if(professors.size() > rowcount)
            for(int i{rowcount}; i < professors.size(); ++i)
            {
                ui->tableWidget_professors->insertRow(i);
            }
        else if(students.size() < rowcount)
            for(int i{rowcount}; i >= professors.size(); --i)
            {
                ui->tableWidget_professors->removeRow(i);
            }
        for(int index{0}; index < professors.size(); ++index)
        {
            ui->tableWidget_professors->setItem(index, 0, new QTableWidgetItem(professors[index].get_concatinated_name()));
            for(int i{0}; i < professors[index].print_classes_prof_teaches().size(); ++i)
            {
                ui->tableWidget_Course_grade->setItem(index, 0, new QTableWidgetItem(professors[index].print_classes_prof_teaches()[i]));
            }

        }
    }
    else
    {
        ui->tableWidget_professors->setItem(0, 0, new QTableWidgetItem("-"));
    }

    ui->comboBox_add_prof_to_course->clear();
    ui->comboBox_add_student_to_course->clear();
    for(int i{0}; i < courses.size(); ++i)
    {
        ui->comboBox_add_student_to_course->addItem(courses[i].get_name());
        ui->comboBox_add_prof_to_course->addItem(courses[i].get_name());
    }
}

void Dashboard::on_tableWidget_classes_cellClicked(int row, int column)
{
    ui->textEdit_Professors_for_class->clear();
    ui->Classes_sidetab->setCurrentIndex(0);
    ui->plainTextEdit->setPlainText(courses[row].get_name());
    ui->textEdit_4->setPlainText(courses[row].get_code());
    ui->textEdit_5->setPlainText(courses[row].get_lecture_hall());
    ui->textEdit_6->setPlainText(courses[row].get_start_time());
    int rowcount = ui->tableWidget_class_students->rowCount();
    if(students.size() > rowcount)
        for(int i{rowcount}; i < students.size(); ++i)
        {
            ui->tableWidget_class_students->insertRow(i);
        }
    for(int index{0}; index < courses[row].print_professors().size(); ++index)
    {
        ui->textEdit_Professors_for_class->insertPlainText(courses[row].print_professors()[index]);
        ui->textEdit_Professors_for_class->insertPlainText("\n");
    }
    for(int index{0}; index < courses[row].Print_students_names().size(); ++index)
    {
        for(int i{0}; i < courses[row].Print_students_names().size(); ++i)
        {
            ui->tableWidget_class_students->setItem(i, 0, new QTableWidgetItem(courses[row].Print_students_names()[i].get_concatinated_name()));
            QString grade = QString::number(courses[row].Print_students_grades()[i]);
            ui->tableWidget_class_students->setItem(i, 1, new QTableWidgetItem(grade));
        }
    }

}

void Dashboard::on_pushButton_clicked()
{
    Class Course;
    Course.set_name(ui->lineEdit_add_class_name->text());
    Course.set_code(ui->lineEdit_add_class_code->text());
    for(Hall hall : halls)
    {
        if(hall.get_name() == ui->lineEdit_add_hall->text())
            Course.set_lecture_hall(hall);
    }
    Course.set_start_time(ui->lineEdit_add_time->text());
    courses.push_back(Course);
    ui->lineEdit_add_class_name->clear();
    ui->lineEdit_add_class_code->clear();
    ui->lineEdit_add_hall->clear();
    ui->lineEdit_add_time->clear();
    init();
}


void Dashboard::on_pushButton_Delete_course_clicked()
{
    bool found = false;
    QString target_course = ui->lineEdit_Delete_course->text();
    for(auto it{courses.begin()}; it < courses.end(); ++it)
    {
        if(it->get_name() == target_course)
        {
            courses.erase(it);
            found = true;
            break;
        }
    }
    if(!found)
        QMessageBox::critical(this, "Error", "Course isn't found");
    ui->lineEdit_Delete_course->clear();
    init();
}


void Dashboard::on_pushButton_Save_student_clicked()
{
    Student student;
    QString target_class = ui->lineEdit_Add_student_to_course->text();
    student.set_first_name(ui->lineEdit_Add_student_first_name_to_course->text());
    student.set_last_name(ui->lineEdit_Add_student_last_name_to_course->text());
    double stu_grade = ui->lineEdit_Add_grade_to_course_2->text().toDouble();
    student.set_age("");
    student.set_grade(0);
    student.set_email("");
    student.set_mobile("");

    bool found {false};
    for(int index{0}; index < courses.size(); ++index)
    {
        if(courses[index].get_name() == target_class)
        {
            courses[index].add_enrolled_student(student, stu_grade);
            student.add_an_enrolledin_class(courses[index], stu_grade);
            found = true;
            break;
        }
    }
    auto iterator = std::find(students.begin(), students.end(), student);
    if(iterator == students.end())
        students.push_back(student);
    if(!found)
        QMessageBox::critical(this, "Error", "Course isn't found");
    ui->lineEdit_Add_student_to_course->clear();
    ui->lineEdit_Add_student_first_name_to_course->clear();
    ui->lineEdit_Add_student_last_name_to_course->clear();
    ui->lineEdit_Add_grade_to_course_2->clear();
    init();
}


void Dashboard::on_pushButton_Cancel_student_clicked()
{
    ui->Classes_sidetab->setCurrentIndex(0);
    ui->lineEdit_Add_student_to_course->clear();
    ui->lineEdit_Add_student_first_name_to_course->clear();
    ui->lineEdit_Add_student_last_name_to_course->clear();
    ui->lineEdit_Add_grade_to_course_2->clear();
}


void Dashboard::on_pushButton_Save_professor_clicked()
{
    QString target_class = ui->lineEdit_Professor__to_course->text();
    Professor professor;
    professor.set_first_name(ui->lineEdit_Professor_first_name_to_course->text());
    professor.set_last_name(ui->lineEdit_Professor_last_name_to_course->text());

    bool found{false};
    for(int index{0}; index < courses.size(); ++index)
    {
        if(courses[index].get_name() == target_class)
        {
            courses[index].add_professor(professor);
            professor.add_Aclass_prof_teaches(courses[index]);
            found = true;
            break;
        }
    }
    auto iterator = std::find(professors.begin(), professors.end(), professor);
    if(iterator == professors.end())
        professors.push_back(professor);
    if(!found)
        QMessageBox::critical(this, "Error", "Course isn't found");
    ui->lineEdit_Professor__to_course->clear();
    ui->lineEdit_Professor_first_name_to_course->clear();
    ui->lineEdit_Professor_last_name_to_course->clear();
    init();
}

void Dashboard::on_tableWidget_students_cellClicked(int row, int column)
{
    ui->Students_sidetab->setCurrentIndex(0);
    ui->plainTextEdit_3->setPlainText(students[row].get_first_name());
    ui->textEdit_12->setPlainText(students[row].get_last_name());
    ui->textEdit_13->setPlainText(students[row].get_age());
    ui->textEdit_14->setPlainText(students[row].get_mobile());
    ui->textEdit_15->setPlainText(students[row].get_email());
    int rowcount = ui->tableWidget_Course_grade->rowCount();
    if(students[row].print_classes_names().size() > rowcount)
        for(int i{rowcount}; i < students[row].print_classes_names().size(); ++i)
        {
            ui->tableWidget_Course_grade->insertRow(i);
        }
    for(int index{0}; index < students[row].print_classes_names().size(); ++index)
    {
        ui->tableWidget_Course_grade->setItem(index, 0, new QTableWidgetItem(students[row].print_classes_names()[index]));
        QString grade = QString::number(students[row].print_student_grades()[index]);
        ui->tableWidget_Course_grade->setItem(index, 1, new QTableWidgetItem(grade));
    }
}


void Dashboard::on_pushButton_Delete_student_clicked()
{
    bool found{false};
    QString target_student_first_name = ui->lineEdit_delete_student_first_name->text();
    QString target_student_last_name = ui->lineEdit_delete_student_last_name->text();
    for(auto it{students.begin()}; it < students.end(); ++it)
    {
        if(it->get_first_name() == target_student_first_name && it->get_last_name() == target_student_last_name)
        {
            students.erase(it);
            found = true;
            break;
        }
    }
    if(!found)
        QMessageBox::critical(this, "Error", "this student isn't found");
    ui->lineEdit_delete_student_first_name->clear();
    ui->lineEdit_delete_student_last_name->clear();
    init();
}


void Dashboard::on_pushButton_Add_student_clicked()
{
    Student student;
    student.set_first_name(ui->lineEdit_student_first_name->text());
    student.set_last_name(ui->lineEdit_student_last_name->text());
    student.set_age(ui->lineEdit_student_age->text());
    student.set_email(ui->lineEdit_student_email->text());
    student.set_mobile(ui->lineEdit_student_mobile->text());
    QString grade = ui->lineEdit_student_grade->text();
    student.set_grade(grade.toDouble());
    students.push_back(student);
    ui->lineEdit_Add_student_first_name_to_course->clear();
    ui->lineEdit_Add_student_last_name_to_course->clear();
    ui->lineEdit_student_age->clear();
    ui->lineEdit_student_email->clear();
    ui->lineEdit_student_mobile->clear();
    ui->lineEdit_student_grade->clear();
    init();
}


void Dashboard::on_pushButton_cancel_adding_student_clicked()
{
    ui->Students_sidetab->setCurrentIndex(0);
    ui->lineEdit_Add_student_first_name_to_course->clear();
    ui->lineEdit_Add_student_last_name_to_course->clear();
    ui->lineEdit_student_age->clear();
    ui->lineEdit_student_email->clear();
    ui->lineEdit_student_mobile->clear();
    ui->lineEdit_student_grade->clear();
}

void Dashboard::on_pushButton_Save_new_professor_clicked()
{
    Professor ProfPage;
    ProfPage.set_title(ui->lineEdit_Prof_title->text());
    ProfPage.set_first_name(ui->lineEdit_Prof1stname->text());
    ProfPage.set_last_name(ui->lineEdit_Prof2ndname->text());
    ProfPage.set_age(ui->lineEdit_Profage->text());
    ProfPage.set_mobile(ui->lineEdit_Profmob->text());
    ProfPage.set_email(ui->lineEdit_Profmail->text());
    professors.push_back(ProfPage);
    ui->lineEdit_Prof_title->clear();
    ui->lineEdit_Prof1stname->clear();
    ui->lineEdit_Prof2ndname->clear();
    ui->lineEdit_Profage->clear();
    ui->lineEdit_Profmob->clear();
    ui->lineEdit_Profmail->clear();
    init();
}


void Dashboard::on_pushButton_Delete_professor_clicked()
{
    bool found = false;
    QString target_prof = ui->lineEdit_DeleteProf->text();
    for(auto it{professors.begin()}; it < professors.end(); ++it)
    {
        if(it->get_first_name() == target_prof)
        {
            professors.erase(it);
            found = true;
            break;
        }
    }
    if(!found)
        QMessageBox::critical(this, "Error", "Professor isn't found");
    ui->lineEdit_DeleteProf->clear();
    init();
}

void Dashboard::on_pushButton_Cancel_new_professor_clicked()
{
    ui->Professors_sidetab->setCurrentIndex(1);
    ui->lineEdit_Prof_title->clear();
    ui->lineEdit_Prof1stname->clear();
    ui->lineEdit_Prof2ndname->clear();
    ui->lineEdit_Profage->clear();
    ui->lineEdit_Profmob->clear();
    ui->lineEdit_Profmail->clear();
}


void Dashboard::on_lineEdit_search_class_textChanged(const QString &arg1)
{
    //ui->tableWidget_classes->clear();
    //ui->tableWidget_classes->setItem(0,0,exp.pattern());
    QString filter = arg1;
    QRegularExpression exp(filter,QRegularExpression::CaseInsensitiveOption);

    for( int i = 0; i < ui->tableWidget_classes->rowCount(); ++i )
    {
        bool match = false;
        for( int j = 0; j < ui->tableWidget_classes->columnCount(); ++j )
        {
            QTableWidgetItem *item = ui->tableWidget_classes->item( i, j );
            if( item->text().contains(exp) )
            {
                match = true;
                break;
            }
        }
        ui->tableWidget_classes->setRowHidden( i, !match );
    }

}


void Dashboard::on_lineEdit_search_professor_textChanged(const QString &arg1)
{
    //ui->tableWidget_students->clear();
    //ui->tableWidget_students->setItem(0,0,exp.pattern());
    QString filter = arg1;
    QRegularExpression exp(filter,QRegularExpression::CaseInsensitiveOption);

    for( int i = 0; i < ui->tableWidget_professors->rowCount(); ++i )
    {
        bool match = false;
        for( int j = 0; j < ui->tableWidget_professors->columnCount(); ++j )
        {
            QTableWidgetItem *item = ui->tableWidget_professors->item( i, j );
            if( item->text().contains(exp) )
            {
                match = true;
                break;
            }
        }
        ui->tableWidget_professors->setRowHidden( i, !match );
    }

}

void Dashboard::on_lineEdit_search_student_textChanged(const QString &arg1)
{
        //ui->tableWidget_professors->clear();
        //ui->tableWidget_professors->setItem(0,0,exp.pattern());
        QString filter = arg1;
        QRegularExpression exp(filter,QRegularExpression::CaseInsensitiveOption);

        for( int i = 0; i < ui->tableWidget_students->rowCount(); ++i )
        {
            bool match = false;
            for( int j = 0; j < ui->tableWidget_students->columnCount(); ++j )
            {
                QTableWidgetItem *item = ui->tableWidget_students->item( i, j );
                if( item->text().contains(exp) )
                {
                    match = true;
                    break;
                }
            }
            ui->tableWidget_students->setRowHidden( i, !match );
        }
}

void Dashboard::on_pushButton_save_course_to_student_clicked()
{
    QString student_first_name = ui->lineEdit_add_course_to_student_first->text();
    QString student_last_name = ui->lineEdit_add_course_to_student_second->text();
    int index = ui->comboBox_add_student_to_course->currentIndex();
    QString grade = ui->lineEdit_add_course_grade->text();
    bool found {false};
    for(Student student : students)
    {
        if(student.get_first_name() == student_first_name && student.get_last_name() == student_last_name)
        {
            courses[index].add_enrolled_student(student, grade.toDouble());
            student.add_an_enrolledin_class(courses[index], grade.toDouble());
            found = true;
            break;
        }
    }
    if(!found)
        QMessageBox::critical(this, "Error", "Student isn't found");
    ui->lineEdit_add_course_to_student_first->clear();
    ui->lineEdit_add_course_to_student_second->clear();
    ui->lineEdit_add_course_grade->clear();
    init();
}

void Dashboard::on_pushButto_exportClasses_clicked()
{
    QString m_path = QFileDialog::getOpenFileName(this, "Choose a csv file to export in", "All Files");
    if(m_path.isEmpty())
    {
        QMessageBox::critical(this, "Error", "Please, choose a file to export the data in it");
        return;
    }
    for(auto course : courses)
    {
        course.export_class_data(m_path);
    }
}


void Dashboard::on_pushButton_save_course_to_prof_clicked()
{
    QString prof_first_name = ui->lineEdit_add_course_to_prof_first->text();
    QString prof_last_name = ui->lineEdit_add_course_to_prof_second->text();
    int index = ui->comboBox_add_prof_to_course->currentIndex();
    bool found {false};
    for(Professor professor : professors)
    {
        if(professor.get_first_name() == prof_first_name && professor.get_last_name() == prof_last_name)
        {
            courses[index].add_professor(professor);
            professor.add_Aclass_prof_teaches(courses[index]);
            found = true;
            break;
        }
    }
    if(!found)
        QMessageBox::critical(this, "Error", "Student isn't found");
    ui->lineEdit_add_course_to_prof_first->clear();
    ui->lineEdit_add_course_to_prof_second->clear();
    init();
}


void Dashboard::on_pushButton_cancel_add_course_to_prof_clicked()
{
    ui->lineEdit_add_course_to_prof_first->clear();
    ui->lineEdit_add_course_to_prof_second->clear();
    ui->Professors_sidetab->setCurrentIndex(1);
}


void Dashboard::on_pushButton_cancel_add_course_to_student_clicked()
{
    ui->lineEdit_add_course_to_student_first->clear();
    ui->lineEdit_add_course_to_student_second->clear();
    ui->lineEdit_add_course_grade->clear();
    ui->Students_sidetab->setCurrentIndex(1);
}


void Dashboard::on_tableWidget_professors_cellClicked(int row, int column)
{
    ui->plainTextEdit_prof_first_name->setPlainText(professors[row].get_first_name());
    ui->plainTextEdit_prof_second_name->setPlainText(professors[row].get_last_name());
    ui->plainTextEdit_Prof_age->setPlainText(professors[row].get_age());
    ui->plainTextEdit_Prof_mobile->setPlainText(professors[row].get_mobile());
    ui->plainTextEdit_Prof_email->setPlainText(professors[row].get_email());

    int rowcount = ui->tableWidget_professors_courses->rowCount();
    if(professors[row].print_classes_prof_teaches().size() > rowcount)
        for(int i{rowcount}; i < professors[row].print_classes_prof_teaches().size(); ++i)
        {
            ui->tableWidget_Course_grade->insertRow(i);
        }
    for(int index{0}; index < professors[row].print_classes_prof_teaches().size(); ++index)
    {
        ui->tableWidget_professors_courses->setItem(index, 0, new QTableWidgetItem(professors[row].print_classes_prof_teaches()[index]));
    }
}


void Dashboard::on_pushButton_exportStudents_clicked()
{
    QString m_path = QFileDialog::getOpenFileName(this, "Choose a csv file to export in", "All Files");
    if(m_path.isEmpty())
    {
        QMessageBox::critical(this, "Error", "Please, choose a file to export the data in it");
        return;
    }
    for(auto student : students)
    {
        student.export_student_data(m_path);
    }
}


void Dashboard::on_pushButton_exportProfessors_clicked()
{
    QString m_path = QFileDialog::getOpenFileName(this, "Choose a csv file to export in", "All Files");
    if(m_path.isEmpty())
    {
        QMessageBox::critical(this, "Error", "Please, choose a file to export the data in it");
        return;
    }
    for(auto professor : professors)
    {
        professor.export_prof_data(m_path);
    }
}


void Dashboard::on_tableWidget_class_students_cellClicked(int row, int column)
{
    ui->tabWidget_dashboard->setCurrentIndex(1);
    QTableWidgetItem* target = ui->tableWidget_class_students->takeItem(row, column);
    QString name = target->text();
    int index{0};
    for(; index < students.size(); ++index)
    {
        if(students[index].get_concatinated_name() == name)
            break;
    }
    on_tableWidget_students_cellClicked(index,0);
}

