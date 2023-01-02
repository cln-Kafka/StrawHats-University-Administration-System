#include "hall.h"
#include "qdebug.h"
#include "class.h"

Hall::Hall(QObject *parent)
    : QObject{parent}
{
    Name = "";
}

Hall::Hall(QString name)
{
    this->Name = name;
}

Hall::~Hall()
{

}

std::pair<std::map<Class*, std::vector<QString>>::iterator, bool> Hall::search(Class* this_class)
{
    auto iterator = classes_that_takes_the_hall_and_its_time.find(this_class);
    if (iterator != this->classes_that_takes_the_hall_and_its_time.end())
        return std::make_pair(iterator, true);
    else
    {
        return std::make_pair(iterator, false);
    }
}

bool Hall::operator ==(const Hall &another_hall) const
{
    return this->Name == another_hall.Name;
}

bool Hall::operator <(const Hall &another_hall) const
{
    return this->Name < another_hall.Name;
}

Hall::Hall(const Hall &another_hall)
{
    this->Name = another_hall.Name;
    this->classes_that_takes_the_hall_and_its_time = another_hall.classes_that_takes_the_hall_and_its_time;
}

Hall &Hall::operator=(const Hall &another_hall)
{
    if(this == &another_hall)
        return *this;
    this->Name = another_hall.Name;
    this->classes_that_takes_the_hall_and_its_time = another_hall.classes_that_takes_the_hall_and_its_time;
    return *this;
}

void Hall::set_name(const QString &name)
{
    this->Name = name;
}

QString Hall::get_name()
{
    return Name;
}

void Hall::add_class(Class* this_class, QString time)
{
    if(classes_that_takes_the_hall_and_its_time.size() == 0)
    {
        std::vector<QString> times;
        times.push_back(time);
        std::pair<Class*, std::vector<QString>> my_pair = std::make_pair(this_class, times);
        classes_that_takes_the_hall_and_its_time.insert(my_pair);
        return;
    }
    auto found = search(this_class);
    if (found.second) //check if the user has entered the class with this time before
    {
        auto iterator = std::find(found.first->second.begin(), found.first->second.end(), time);
        if(iterator != found.first->second.end())
        {
            qDebug() << "this course already has taken the hall at this time\n";
            return;
        }
        else
        {
            found.first->second.push_back(time);
            return;
        }
    }

    else
    {
        for (auto &time_of_the_class : classes_that_takes_the_hall_and_its_time)
        {
            auto search = std::find(time_of_the_class.second.begin(), time_of_the_class.second.end(), time);
            if (search != time_of_the_class.second.end())//check that there is no class has taken the hall at this time
            {
                qDebug() << "Sorry,there is a class took the hall at this time\n";
            }
            else
            {
                std::vector<QString> times;
                times.push_back(time);
                std::pair<Class*, std::vector<QString>> my_pair = std::make_pair(this_class, times);
                classes_that_takes_the_hall_and_its_time.insert(my_pair);
            }
        }
    }
}

void Hall::delete_class(Class* this_class)
{
    auto found = search(this_class);
    if (found.second == true)
        classes_that_takes_the_hall_and_its_time.erase(found.first);
    else
        qDebug() << "this class hasn't taken the hall at any time\n";
}
