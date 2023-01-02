#ifndef CLASS_H
#define CLASS_H

#include <iostream>
#include <QFile>
#include <QMessageBox>
#include <QString>
#include <string>
#include <string.h>
#include <QDebug>
#include <QObject>
#include <vector>
#include <map>
class Professor;
class Student;
class Hall;
#include "professor.h"
#include "student.h"
#include "hall.h"
class Class : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString Code READ get_code WRITE set_code NOTIFY codeChanged);

private:
    QString Name;
    QString Code;
    Hall Lecture_hall;
    QString Start_time;
    int lecture_time {2};
    std::vector<Professor> professors_for_class;
    std::map<Student, double> students_enrolled;
signals:

    void codeChanged();

public:
    explicit Class(QObject *parent = nullptr);
    Class(QString, QString, Hall, QString);
    Class (const Class & another_class);
    Class &operator=(const Class &another_class);
    bool operator <(const Class &another_class) const;
    bool operator ==(const Class &another_class) const;
    ~Class();

private slots:
    QString concatinate_time(); //return start time - end time example "1:00 - 3:00"
    std::pair<Student, bool> search_for_student(Student);
    std::pair<std::vector<Professor>::iterator, bool> search_for_professor(Professor);

public slots:
    void set_name(const QString &);
    void set_code(const QString &);
    void set_lecture_hall(const Hall &);
    void set_start_time(QString);
    const QString get_name();
    const QString get_code();
    const QString get_lecture_hall();
    const QString get_start_time();
    bool add_professor(Professor);
    bool delete_professor(Professor);
    bool add_enrolled_student(Student, double);
    bool delete_enrolled_student(Student);
    void export_class_data(QString);
    std::vector<QString> print_professors();
    std::vector<Student> Print_students_names();
    std::vector<double> Print_students_grades();
};

#endif // CLASS_H
