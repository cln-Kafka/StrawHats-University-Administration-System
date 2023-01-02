#include "login.h"

login::login(QObject *parent)
    : QObject{parent}
{

}

QString login::username()
{
    return m_username;
}

void login::setusername(QString newUsername)
{
    if (m_username == newUsername)
        return;
    m_username = newUsername;
    emit usernameChanged();
}

QString login::password()
{
    return m_password;
}

void login::setpassword(QString newPassword)
{
    if (m_password == newPassword)
        return;
    m_password = newPassword;
    emit passwordChanged();
}
