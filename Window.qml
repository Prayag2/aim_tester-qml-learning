import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.core 2.0 as PlasmaCore 

Window {
    title: "KAim"
    minimumWidth: 700
    minimumHeight: 600
    visible: true
    color: PlasmaCore.Theme.backgroundColor

    Game {
        id: game
        anchors.fill: parent
        visible: false 
    }
    
    Column {
        id: menu
        anchors.centerIn: parent
        anchors.margins: 20
        spacing: 10
        signal clicked

        onClicked: {
            menu.visible=false
            game.visible=true
            game.gameStart()
        }

        PlasmaComponents3.Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Aim Tester!"
        }

        PlasmaComponents3.Button {
            text: "Start Test"
            onClicked: menu.clicked()
        }
    }
    
}
