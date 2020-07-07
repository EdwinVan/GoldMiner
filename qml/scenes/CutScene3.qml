import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.12

//  第2关与第3关过渡界面

Scene {

    id: cutItem3
    property int score: 0
    property int cutscenetime: 4
    anchors.fill: parent
    signal cutscene3TimeOut()
    property alias cutsceneBgm: cutscenebgm
    property alias cutscenetimeBegin: cutscenetimer.running

    Audio { //cutscene3音乐
        id: cutscenebgm
        source: "../../assets/audio/cut-scene.mp3"
        volume: 0.8
    }

    Image {
        id: bg
        anchors.fill: parent
        source: "../../assets/img/cut-scene-background.jpg"
    }

    Image {

        id: gamewin
        width: parent.width / 4
        height: parent.height / 3
        anchors.centerIn: parent
        source: "../../assets/img/dialog-background.png"
        StyleText {
            text: qsTr("3rd")
            color: "black"
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.width / 20
        }

        StyleText {//提示游戏目标分数
            anchors.centerIn: parent
            text: qsTr("Target: ") + gameScene3.targetmoney3
            color: "black"
        }
    }

    Timer {
        id: cutscenetimer
        interval: 1000
        repeat: true
        running: false
        triggeredOnStart: true
        onTriggered:{
            cutscenetime--;
            if(cutscenetime==0) {
                cutscene3TimeOut()
                console.log("out")
            }
        }
    }
}

