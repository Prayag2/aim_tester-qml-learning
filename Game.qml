import QtQuick 2.15
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents3

Item {
    id: root
    property int score: 0
    property int headerHeight: height*0.2
    property int clicks: 0
    property int count: 0
    property bool start: false
    property int animationDur: 100
    signal gameStart

    onGameStart: {
        timer.start()
    }
    Item {
        id: result
        anchors.fill: parent
        visible: false

        Column {
            anchors.centerIn: parent
            id: col
            spacing: 10
            PlasmaComponents3.Label {
                id: resultLabel
                text: "Averaget Time Per Target: " + Math.floor((count*10)/clicks) + "ms"
                anchors.horizontalCenter: parent.horizontalCenter
                
            }
            PlasmaComponents3.Button {
                text: "Start Again"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    result.visible=false 
                    root.count = 0
                    root.clicks = 0
                    root.score = 0
                    target.visible=true
                    timer.start()
                }
            }
        }
    }
        
    Timer {
        id: timer
        interval: 10
        repeat: true
        onTriggered: { 
            count+=1
            if (count==0) {
                root.visible= false
            }
        }
    }
    Rectangle {
        width: parent.width
        height: parent.headerHeight
        color: PlasmaCore.Theme.palette.light

        Column {
            spacing: 10
            anchors.centerIn: parent
            PlasmaComponents3.Label {
                text: "Score: " + root.score
                anchors.horizontalCenter: parent.horizontalCenter
            }
            PlasmaComponents3.Label {
                text: "Time Taken: " + Math.floor(root.count/100) + "s"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            PlasmaComponents3.Label {
                text: "Targets Clicked: " + clicks 
                anchors.horizontalCenter: parent.horizontalCenter
            }

        }
    }


    function get_x(width) {
        return Math.abs(Math.floor(Math.random()*root.width) - width)
    }
    function get_y(width) {
        return Math.abs(Math.floor(Math.random()*(root.height - root.headerHeight)) - width) + root.headerHeight
    }

    Target {
        id: target
        width: 100
        x: get_x(width)
        y: get_y(width)
        onAnyClicked: {
            x= get_x(width)
            y= get_y(width)
            root.clicks += 1
            if(root.clicks== 30) {
                target.visible=false 
                result.visible=true
                timer.stop()
            }
        }
        Behavior on x {
            NumberAnimation {duration: root.animationDur}
        }
        Behavior on y {
            NumberAnimation {duration: root.animationDur}
        }
        onOneClicked: {
                root.score += 10 
        }
        onTwoClicked: {
            root.score += 20
        }
        onThreeClicked: {
            root.score += 50
        }
    }
    MouseArea {
        id: mouseArea
        width: root.width
        height: root.height*0.8
        y: root.headerHeight
        cursorShape: Qt.CrossCursor
        acceptedButtons: Qt.NoButton
    }

}
