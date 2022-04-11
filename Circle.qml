import QtQuick 2.15

Rectangle {
    height: width
    radius: width/2
    signal clicked
    signal outside

    property bool inCircle: {
        var rad = radius
        var x = mouseArea.mouseX;
        var y = mouseArea.mouseY;
        // using distance formula to calculate distance of cursor from center.
        var distance = Math.sqrt(Math.pow(x-rad, 2) + Math.pow(y-rad, 2))
        return distance < rad
    }

    // making it clickable
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: parent.inCircle ? parent.clicked() : parent.outside()
    }
}
