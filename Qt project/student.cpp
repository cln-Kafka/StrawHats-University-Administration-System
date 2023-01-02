#include "student.h"
#include "class.h"

Student::Student(Person *parent)
{
    First_name = " ";
    Last_name = " ";
    Age = " ";
    Mobile = " ";
    Email = " ";
    Total_grade = 0;
}

Student::Student(QString first_name, QString last_name, QString age, QString email, QString mobile, double total_grade = 0)
    : First_name(first_name), Last_name(last_name), Age(age), Email(email), Mobile(mobile), Total_grade(total_grade) {}

bool Student::operator <(const Student &another_student) const
{
    return std::tie(First_name, Last_name, Age, Email, Mobile, Total_grade, classes_enrolled_in) <
           std::tie(another_student.First_name, another_student.Last_name, another_student.Age, another_student.Email, another_student.Mobile, another_student.Total_grade, another_student.classes_enrolled_in);
}

bool Student::operator ==(const Student &another_student) const
{
    return std::tie(First_name, Last_name, Age, Email, Mobile, Total_grade, classes_enrolled_in) ==
           std::tie(another_student.First_name, another_student.Last_name, another_student.Age, another_student.Email, another_student.Mobile, another_student.Total_grade, another_student.classes_enrolled_in);
}

Student::~Student()
{

}

void Student::set_first_name(const QString &first_name)
{
    this->First_name = first_name;
}

void Student::set_last_name(const QString &last_name)
{
    this->Last_name = last_name;
}

void Student::set_age(const QString &age)
{
    this->Age = age;
}

void Student::set_email(const QString &email)
{
    this->Email = email;
}

void Student::set_mobile(const QString &mobile)
{
    this->Mobile = mobile;
}

void Student::set_grade(const double &total_grade)
{
    this->Total_grade = total_grade;
}

const QString Student::get_first_name()
{
    return First_name;
}

const QString Student::get_last_name()
{
    return Last_name;
}

const QString Student::get_age()
{
    return Age;
}

const QString Student::get_email()
{
    return Email;
}

const QString Student::get_mobile()
{
    return Mobile;
}

double Student::get_grade()
{
    return Total_grade;
}

const QString Student::get_concatinated_name()
{
    return (First_name + " " + Last_name);
}

void Student::add_an_enrolledin_class(Class &this_class, double grade)
{
    auto found = classes_enrolled_in.find(this_class); //search if the student is already enrolled
    if(found != classes_enrolled_in.end())
        qDebug() << "this Student is already enrolled in this class\n";
    else
        classes_enrolled_in.insert(std::make_pair(this_class, grade));
}

Class Student::find_an_enrollediln_class(Class this_class)
{
    auto found = classes_enrolled_in.find(this_class);
    if(found != classes_enrolled_in.end())//search for an enrolled student.
        return found->first;
    else
        throw("this Student is not enrolled in this class\n");
}

void Student::delete_enrolled_in_class(Class this_class)
{
    auto found = classes_enrolled_in.find(this_class);
    if(found != classes_enrolled_in.end())//search for a student if found, delete it else error.
        classes_enrolled_in.erase(this_class);
    else
        throw("this Student is not enrolled in this class\n");
}

void Student::export_student_data(QString filename)
{
    QFile file( filename );
    if ( file.open(QIODevice::ReadWrite | QIODevice::Append) )
    {
        QTextStream stream( &file );
        stream << "Name, " << this->get_concatinated_name() << "\nAge, ";
        stream << this->get_age() << "\nEmail, " << this->get_email() << "\nMobile, " << this->get_mobile() << "\nCourses, ";
        for(auto course : classes_enrolled_in)
        {
            Class my_course = course.first;
            stream << my_course.get_name() << ", " << course.second << "\n";
        }
    }
    file.close();
}

std::vector<QString> Student::print_classes_names()
{
    std::vector<QString> classes_names;
    for(auto course : classes_enrolled_in)
    {
        Class my_course = course.first;
        classes_names.push_back(my_course.get_name());
    }
    return classes_names;
}

std::vector<double> Student::print_student_grades()
{
    std::vector<double> classes_grades;
    for(auto course : classes_enrolled_in)
    {
        classes_grades.push_back(course.second);
    }
    return classes_grades;
}

Student::Student(const Student &another_student)
{
    class Person;
    this->First_name = another_student.First_name;
    this->Last_name = another_student.Last_name;
    this->Age = another_student.Age;
    this->Mobile = another_student.Mobile;
    this->Email = another_student.Email;
    this->Total_grade = another_student.Total_grade;
    this->classes_enrolled_in = another_student.classes_enrolled_in;
}

Student &Student::operator=(const Student &another_student)
{
    if(this == &another_student)
        return *this;
    this->First_name = another_student.First_name;
    this->Last_name = another_student.Last_name;
    this->Age = another_student.Age;
    this->Email = another_student.Email;
    this->Mobile = another_student.Mobile;
    this->Total_grade = another_student.Total_grade;
    this->classes_enrolled_in = another_student.classes_enrolled_in;

    return *this;
}
