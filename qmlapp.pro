######################################################################
# Automatically generated by qmake (3.0) Wed Mar 6 15:34:02 2013
######################################################################

TEMPLATE = app
TARGET = QmlApp
INCLUDEPATH += .
QT += qml quick sensors
QTPLUGIN += qtsensors_ios
CONFIG += debug

#QMAKE_INFO_PLIST = Info.Plist

# Input
SOURCES += main.cpp
RESOURCES += main.qrc
OTHER_FILES += main.qml Accelerometer.qml Snippet.qml

HEADERS += \
    ioscamera.h

OBJECTIVE_SOURCES += \
    ioscamera.mm

cache()
