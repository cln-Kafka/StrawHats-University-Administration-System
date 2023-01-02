#include "login.h"
#include "./ui_login.h"

login::login(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::login)
{
    ui->setupUi(this);
    this->setWindowIcon(QIcon("C:/Qt/Projects/LoginNew/hatlcon.png"));
    this->setWindowTitle("StrawHats");
}

login::~login()
{
    delete ui;
}


void login::on_pushButton_login_clicked()
{
    QString username = ui->lineEdit_username->text();
    QString password = ui->lineEdit_password->text();
    if (username == "test" && password == "test"){
        ui->statusbar->showMessage("The username & password are correct.");
        hide();
        dashboard = new Dashboard(this);
        dashboard->show();
    } else {
       QMessageBox::critical(this, "Error", "Invalid user name or password");
    }
}

