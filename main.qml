import QtQuick 2.1
import QtQuick.Window 2.0
import QtSensors 5.1
import IOSCamera 1.0

Rectangle {
    id: mainWindow
    color: "white"

    Image {
        id: img
        source: "qrc:/qt.png"
        rotation: Screen.orientation == Qt.PortraitOrientation ? 0 : -90
        Behavior on rotation {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.OutBounce
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: camera.open()
        }

        property real speedX: 0
        property real speedY: 0
        property real friction: 0.05
        property real bounce: 0.6
        property real gravity: 0.2

        function move(readingX, readingY)
        {
            // adjust icon speed:
            speedX -= readingX * gravity;
            speedY += readingY * gravity

            // Calculate where the icon should be:
            x += (speedX > 0) ? Math.max(0, speedX - friction) : Math.min(0, speedX + friction);
            y += (speedY > 0) ? Math.max(0, speedY - friction) : Math.min(0, speedY + friction)

            // Bounce icon back in if outside screen:
            if (x < 0) {
                x = 0
                speedX = speedX * -1 * bounce
            } else  if (x > mainWindow.width - paintedWidth) {
                x = mainWindow.width - paintedWidth
                speedX = speedX * -1 * bounce
            }
            if (y < 0) {
                y = 0
                speedY = speedY * -1 * bounce
            }
            if (y > mainWindow.height - paintedHeight) {
                y = mainWindow.height - paintedHeight
                speedY = speedY * -1 * bounce
            }
        }

    }

    Accelerometer {
        id: sensor
        active: Qt.application.state === Qt.ApplicationActive
        onReadingChanged: img.move(reading.x, reading.y)
    }

    IOSCamera {
        id: camera
        onImagePathChanged: {
            img.source = imagePath
            img.width /= 4
            img.height /= 4
        }
    }
}
