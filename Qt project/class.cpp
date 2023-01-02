#include "class.h"
#include "hall.h"

Class::Class(QObject *parent)
    : QObject{parent}
{

}

Class::Class(QString name, QString code, Hall hall, QString start_time)
    : Name(name), Code(code), Lecture_hall(hall), Start_time(start_time) {}

Class::Class(const Class &another_class)
{
    class QObject;
    this->Name = another_class.Name;
    this->Code = another_class.Code;
    this->Lecture_hall = another_class.Lecture_hall;
    this->Start_time = another_class.Start_time;
    this->professors_for_class = another_class.professors_for_class;
    this->students_enrolled = another_class.students_enrolled;
}

Class &Class::operator=(const Class &another_class)
{
    if(this == &another_class)
        return *this;

    this->Name = another_class.Name;
    this->Code = another_class.Code;
    this->Lecture_hall = another_class.Lecture_hall;
    this->lecture_time = another_class.lecture_time;
    this->Start_time = another_class.Start_time;
    this->professors_for_class = another_class.professors_for_class;
    this->students_enrolled = another_class.students_enrolled;

    return *this;
}

bool Class::operator <(const Class &another_class) const
{
    return std::tie(Name, Code, Lecture_hall, lecture_time, Start_time) <
           std::tie(another_class.Name, another_class.Code, another_class.Lecture_hall, another_class.lecture_time, another_class.Start_time);
}

bool Class::operator ==(const Class &another_class) const
{
    return std::tie(Name, Code, Lecture_hall, lecture_time, Start_time) ==
            std::tie(another_class.Name, another_class.Code, another_class.Lecture_hall, another_class.lecture_time, another_class.Start_time);
}

Class::~Class() {};
void Class::set_name(const QString &name)
{
    this->Name = name;
}
void Class::set_code(const QString &code)
{
    this->Code = code;
}
void Class::set_lecture_hall(const Hall &hall)
{
    Lecture_hall = hall;
}
QString Class::concatinate_time()
{
    std::string time = Start_time.toStdString();
    time[0] += 2;
    QString end_time = QString::fromStdString(time);
    return (Start_time + " - " + end_time);
}

std::pair<Student, bool> Class::search_for_student(Student student)
{
    std::map<Student, double>::iterator found = students_enrolled.find(student);
      if(found != students_enrolled.end())
          return std::make_pair(found->first, true);
      else
          return std::make_pair(students_enrolled.rbegin()->first, false);
}
void Class::set_start_time(QString time)
{
    Start_time = time;
    QString whole_time = concatinate_time();
    Lecture_hall.add_class(this, whole_time);
}
const QString Class::get_name()
{
    return Name;
}
const QString Class::get_code()
{
    return Code;
}
const QString Class::get_lecture_hall()
{
    return Lecture_hall.get_name();
}
const QString Class::get_start_time()
{
    return concatinate_time();
}

std::pair<std::vector<Professor>::iterator, bool> Class::search_for_professor(Professor professor)
{
    std::vector<Professor>::iterator found = std::find(professors_for_class.begin(), professors_for_class.end(), professor);
    if(found != professors_for_class.end())
        return std::make_pair(found, true);
    else
        return std::make_pair(found, false);
}
bool Class::add_professor(Professor professor)
{
    if(!search_for_professor(professor).second)
    {
        professors_for_class.push_back(professor);
        return true;
    }
    else
        return false;
}
bool Class::delete_professor(Professor professor)
{
    auto found = search_for_professor(professor);
    if(found.second)
    {
        professors_for_class.erase(found.first);
        return true;
    }
    else
        return false;
}
bool Class::add_enrolled_student(Student student, double grade = 0)
{
    std::map<Student, double>::iterator found = students_enrolled.find(student);
    if(students_enrolled.size() == 0)
    {
        students_enrolled.insert(std::make_pair(student, grade));
        return true;
    }
    else if(found != students_enrolled.end())
    {
        return false;
    }
    else
        students_enrolled.insert(std::make_pair(student, grade));
    return true;
}

bool Class::delete_enrolled_student(Student student)
{
    auto found = search_for_student(student);
    if(found.second)
    {
        students_enrolled.erase(student);
        return true;
    }
    else
        return false;
}

void Class::export_class_data(QString filename)
{
    QFile file( filename );
    if ( file.open(QIODevice::ReadWrite | QIODevice::Append) )
    {
        QTextStream stream( &file );
        stream << "Class ," << this->get_name() << "\nProfessors, ";
        for(Professor professor : professors_for_class)
            stream << professor.get_title() << " " << professor.get_concatinated_name() << ",";
        stream << "\nHall," << this->Lecture_hall.get_name() << "\n";
        for(auto &student : students_enrolled)
        {
            Student my_student = student.first;
            stream << my_student.get_concatinated_name() << "," << student.second << "\n";
        }
    }
    file.close();
}

std::vector<QString> Class::print_professors()
{
    std::vector<QString> prof_names;
    for(Professor professor : professors_for_class)
    {
        prof_names.push_back(professor.get_concatinated_name());
    }
    return prof_names;
}

std::vector<Student> Class::Print_students_names()
{
    std::vector<Student> students_names;
    for(auto student : students_enrolled)
    {
       students_names.push_back(student.first);
    }
    return students_names;
}

std::vector<double> Class::Print_students_grades()
{
    std::vector<double> students_grades;
    for(auto student : students_enrolled)
    {
       students_grades.push_back(student.second);
    }
    return students_grades;
}



