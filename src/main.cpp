#include <QApplication>
#include <QQmlApplicationEngine>
#include <qqml.h>

#include "screenvalues.h"
#include "notifications.h"

static QObject *notifications_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    return new Notifications();
}

static QObject *screen_values_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    return new ScreenValues();
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterSingletonType<ScreenValues>("com.iktwo.visitor", 1, 0, "ScreenValues", screen_values_provider);
    qmlRegisterSingletonType<Notifications>("com.iktwo.visitor", 1, 0, "Notifications", notifications_provider);

    qRegisterMetaType<Notifications::NotificationType>("Notifications::NotificationType");
    qRegisterMetaType<Notifications::NotificationDuration>("Notifications::NotificationDuration");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/qml/main.qml")));

    return app.exec();
}
