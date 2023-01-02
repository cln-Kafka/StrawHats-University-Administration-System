#ifndef HALL_H
#define HALL_H

#include <QObject>
#include <map>
#include <vector>
#include <QString>
#include <iostream>

class Class;

class Hall : public QObject
{
    Q_OBJECT
private:
    QString Name;
    std::map<Class*, std::vector<QString>> classes_that_takes_the_hall_and_its_time;
    std::pair<std::map<Class*, std::vector<QString>>::iterator, bool> search(Class*);
public:
    explicit Hall(QObject *parent = nullptr);
    Hall (const Hall & another_hall);
    Hall &operator=(const Hall &another_hall);
    bool operator ==(const Hall &another_hall) const;
    bool operator <(const Hall &another_hall) const;
    Hall(QString);
   ~Hall();

public slots:
       void set_name(const QString &);
       QString get_name();
       void add_class(Class*, QString);
       void delete_class(Class*);
signals:
};
#include "class.h"
#endif // HALL_H
