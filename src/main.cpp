#include <QApplication>
#include <QQmlApplicationEngine>
#include <qqml.h>

#include "screenvalues.h"

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

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/qml/main.qml")));

    return app.exec();
}
