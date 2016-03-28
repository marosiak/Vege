TEMPLATE = app

QT += qml quick sql
CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

android {

}

DISTFILES += \
    material/TopBar.qml \
    material/Page.qml \
    material/FadeEffect.qml \
    material/DataBase.qml
