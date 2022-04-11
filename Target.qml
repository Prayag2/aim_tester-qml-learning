import QtQuick 2.15
import org.kde.plasma.core 2.0 as PlasmaCore

Circle {
    id: one
    color: PlasmaCore.Theme.negativeTextColor
    signal anyClicked
    signal oneClicked
    signal twoClicked
    signal threeClicked
    onClicked: {
        oneClicked()
        anyClicked()
    }

    Circle {
        anchors.centerIn: parent
        id: two
        width: 4*parent.width/6
        color: PlasmaCore.Theme.textColor
        onClicked: {
            one.twoClicked()
            one.anyClicked()
        }
        onOutside: parent.clicked()

        Circle {
            id: three
            width: 2*one.width/6
            anchors.centerIn: parent
            color: PlasmaCore.Theme.negativeTextColor
            onClicked: {
                one.threeClicked()
                one.anyClicked()
            }
            onOutside: parent.clicked()
            
        }
    }
}
