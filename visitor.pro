TEMPLATE = app

QT += qml quick widgets xml svg

android {
    QT += androidextras
}

HEADERS += $$files($$PWD/src/*.h)

SOURCES += $$files($$PWD/src/*.cpp)

RESOURCES += resources.qrc

include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/res/values/libs.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
