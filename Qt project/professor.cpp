#include "professor.h"
#include "class.h"

Professor::Professor(Person *parent)
{
    First_name = "";
    Last_name = "";
    Age = "";
    Email = "";
    Mobile = "";
    Title = "";
}

Professor::Professor(QString first_name, QString last_name, QString age, QString email, QString mobile, QString title)
    : First_name(first_name), Last_name(last_name), Age(age), Email(email), Mobile(mobile), Title(title) {}

bool Professor::operator <(const Professor &another_prof) const
{
    return std::tie(First_name, Last_name, Age, Email, Mobile, Title, classes_prof_teaches) <
           std::tie(another_prof.First_name, another_prof.Last_name, another_prof.Age, another_prof.Email, another_prof.Mobile, another_prof.Title, classes_prof_teaches);
}

bool Professor::operator ==(const Professor &another_prof) const
{
    return std::tie(First_name, Last_name, Age, Email, Mobile, Title, classes_prof_teaches) ==
           std::tie(another_prof.First_name, another_prof.Last_name, another_prof.Age, another_prof.Email, another_prof.Mobile, another_prof.Title, classes_prof_teaches);
}

Professor::~Professor()
{
    First_name = "";
    Last_name = "";
    Age = "";
    Email = "";
    Mobile = "";
    Title = "";
}

void Professor::set_first_name(const QString &first_name)
{
    this->First_name = first_name;
}

void Professor::set_last_name(const QString &last_name)
{
    this->Last_name = last_name;
}

void Professor::set_age(const QString &age)
{
    this->Age = age;
}

void Professor::set_email(const QString &email)
{
    this->Email = email;
}

void Professor::set_mobile(const QString &mobile)
{
    this->Mobile = mobile;
}

void Professor::set_title(const QString &title)
{
    this->Title = title;
}

const QString Professor::get_first_name()
{
    return First_name;
}

const QString Professor::get_last_name()
{
    return Last_name;
}

const QString Professor::get_age()
{
    return Age;
}

const QString Professor::get_email()
{
    return Email;
}

const QString Professor::get_mobile()
{
   return Mobile;
}

const QString Professor::get_title()
{
    return Title;
}

QString Professor::get_concatinated_name()
{
    return (get_first_name() + " " +get_last_name());
}

void Professor::add_Aclass_prof_teaches(Class this_class)
{
    auto found = std::find(classes_prof_teaches.begin(), classes_prof_teaches.end(), this_class);
    if(found != classes_prof_teaches.end())// search if we added this course to this professor already
        qDebug() << "the professor already teaches this course\n";
    else
        classes_prof_teaches.push_back(this_class);
}

Class Professor::find_Aclass_prof_teaches(Class this_class)
{
    std::vector<Class>::iterator found = std::find(classes_prof_teaches.begin(), classes_prof_teaches.end(), this_class);
    if(found != classes_prof_teaches.end())
        return *found;
    else
        throw("Prof. doesn't teach this course\n");
}

void Professor::delete_Class_prof_teaches(Class this_class)
{
    auto found = std::find(classes_prof_teaches.begin(), classes_prof_teaches.end(), this_class);
    if(found != classes_prof_teaches.end())//search for the class if found, delete it, else error.
    {
        classes_prof_teaches.erase(found);
    }
    else
        qDebug() << "Professor doesn't teach this course\n";
}

void Professor::export_prof_data(QString filename)
{
    QFile file( filename );
    if ( file.open(QIODevice::ReadWrite | QIODevice::Append))
    {
        QTextStream stream( &file );
        stream << this->get_title() << ", " << this->get_concatinated_name() << "\nAge, ";
        stream << this->get_age() << "\nEmail, " << this->get_email() << "\nMobile, " << this->get_mobile() << "\nCourses, ";
        for(Class course : classes_prof_teaches)
            stream << course.get_name() << ", ";
    }
    file.close();
}

std::vector<QString> Professor::print_classes_prof_teaches()
{
    std::vector<QString> classes_names;
    for(auto course : classes_prof_teaches)
    {
        classes_names.push_back(course.get_name());
    }
    return classes_names;
}

Professor::Professor(const Professor &another_professor)
{
    this->First_name = another_professor.First_name;
    this->Last_name = another_professor.Last_name;
    this->Age = another_professor.Age;
    this->Email = another_professor.Email;
    this->Mobile = another_professor.Mobile;
    this->Title = another_professor.Title;
    this->classes_prof_teaches = another_professor.classes_prof_teaches;
}

Professor &Professor::operator=(const Professor &another_professor)
{
    if(this == &another_professor)
        return *this;
    First_name = another_professor.First_name;
    Last_name = another_professor.Last_name;
    Age = another_professor.Age;
    Email = another_professor.Email;
    Mobile = another_professor.Mobile;
    Title = another_professor.Title;
    classes_prof_teaches = another_professor.classes_prof_teaches;
    return *this;
}

