#ifndef PROFESSOR_H
#define PROFESSOR_H

#include <iostream>
#include <algorithm>
#include <vector>
#include <QDebug>
#include <QObject>
#include "person.h"
class Class;
#include "class.h"

class Professor : public Person
{
    Q_OBJECT
private:
    QString First_name;
    QString Last_name;
    QString Age;
    QString Email;
    QString Mobile;
    QString Title;
    std::vector<Class> classes_prof_teaches;

public:
    explicit Professor(Person *parent = nullptr);
    Professor (const Professor &another_professor);
    Professor &operator=(const Professor &another_professor);
    Professor(QString, QString, QString, QString, QString, QString);
    bool operator <(const Professor &another_prof) const;
    bool operator ==(const Professor &another_prof) const;
    ~Professor();
public slots:
    void set_first_name(const QString &);
    void set_last_name(const QString &);
    void set_age(const QString &);
    void set_email(const QString &);
    void set_mobile(const QString &);
    void set_title(const QString &);
    const QString get_first_name();
    const QString get_last_name();
    const QString get_age();
    const QString get_email();
    const QString get_mobile();
    const QString get_title();
    QString get_concatinated_name(); //returns a concatinated name for the professor separated by a space
    void add_Aclass_prof_teaches(Class);
    Class find_Aclass_prof_teaches(Class);
    void delete_Class_prof_teaches(Class);
    void export_prof_data(QString);
    std::vector<QString> print_classes_prof_teaches();
signals:

};

#endif // PROFESSOR_H
