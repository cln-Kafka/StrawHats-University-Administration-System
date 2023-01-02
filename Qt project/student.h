#ifndef STUDENT_H
#define STUDENT_H

#include <QObject>
#include "person.h"

class Class;
#include "class.h"

class Student : public Person
{
    Q_OBJECT
private:
    QString First_name;
    QString Last_name;
    QString Age;
    QString Email;
    QString Mobile;
    double Total_grade;
    std::map<Class, double> classes_enrolled_in;
public:
    explicit Student(Person *parent = nullptr);
    Student (const Student &another_student);
    Student(QString, QString, QString, QString, QString, double);
    bool operator <(const Student &another_student) const;
    bool operator ==(const Student &another_student) const;
    Student &operator=(const Student &another_student);
    ~Student();
public slots:
    void set_first_name(const QString &);
    void set_last_name(const QString &);
    void set_age(const QString &);
    void set_email(const QString &);
    void set_mobile(const QString &);
    void set_grade(const double &);
    const QString get_first_name();
    const QString get_last_name();
    const QString get_age();
    const QString get_email();
    const QString get_mobile();
    double get_grade();
    const QString get_concatinated_name(); //returns a concatinated name for the professor separated by a space
    void add_an_enrolledin_class(Class&, double);
    Class find_an_enrollediln_class(Class);
    void delete_enrolled_in_class(Class);
    void export_student_data(QString);
    std::vector<QString> print_classes_names();
    std::vector<double> print_student_grades();
signals:

};

#endif // STUDENT_H
