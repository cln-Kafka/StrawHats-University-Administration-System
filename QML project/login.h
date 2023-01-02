#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>

class login : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)

public:
    explicit login(QObject *parent = nullptr);

    QString username();

    QString password();

signals:

    void usernameChanged();

    void passwordChanged();

public slots:
    void setusername(const QString newUsername);
    void setpassword(const QString newPassword);

private:
    QString m_username;
    QString m_password;
};

#endif // LOGIN_H
