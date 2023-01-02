#ifndef PERSON_H
#define PERSON_H

#include <QObject>

class Person : public QObject
{
    Q_OBJECT
private:
    QString First_name;
    QString Last_name;
    QString Age;
    QString Email;
    QString Mobile;
public:
    explicit Person(QObject *parent = nullptr);
    ~Person();
public slots:
    virtual void set_first_name(const QString&) = 0;
    virtual void set_last_name(const QString &) = 0;
    virtual void set_age(const QString &) = 0;
    virtual void set_email(const QString &) = 0;
    virtual void set_mobile(const QString &) = 0;
    virtual const QString get_first_name() = 0;
    virtual const QString get_last_name() = 0;
    virtual const QString get_age() = 0;
    virtual const QString get_email() = 0;
    virtual const QString get_mobile() = 0;
signals:

};

#endif // PERSON_H
