######################################################################
# Automatically generated by qmake (3.0) Wed Mar 6 15:34:02 2013
######################################################################

TEMPLATE = app
TARGET = QmlApp
INCLUDEPATH += .
QT += qml quick sensors
QTPLUGIN += qtsensors_ios
CONFIG += release

QMAKE_INFO_PLIST = Info.Plist

# Input
SOURCES += main.cpp
RESOURCES += main.qrc
OTHER_FILES += main.qml Accelerometer.qml Snippet.qml dd13.qml


# Bundle in Qt import:
qmldir.files = $$(QTDIR)/qml
QMAKE_BUNDLE_DATA += qmldir

# Link to import plugins:
QTDIR = $$(QTDIR)
LIBS += -L$$QTDIR/qml/QtQuick.2 -lqtquick2plugin
LIBS += -L$$QTDIR/qml/QtSensors -ldeclarative_sensors
LIBS += -L$$QTDIR/qml/QtQuick/Window.2 -lwindowplugin
LIBS += -Wl,-force_load,$$QTDIR/lib/libQt5Quick.a

cache()
