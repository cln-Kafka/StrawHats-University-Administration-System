#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include "qicon.h"
#include <QDebug>
#include "login.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    app.setApplicationDisplayName(QString("StrawHats"));
    app.setWindowIcon(QIcon ("C:/Users/Kareem/Downloads/StrawHats/Resources/Images/hatIcon.ico"));

    qmlRegisterType <login> ( "SH", 1,0, "LoginObject" );

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
