import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.12

//  第3关与第4关过渡界面

Scene {

    id: cutItem4
    property int score: 0
    property int cutscenetime: 4
    anchors.fill: parent
    signal cutscene3TimeOut()
    property alias cutsceneBgm: cutscenebgm

    Audio { //cutscene4音乐
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
            text: qsTr("4th")
            color: "black"
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.width / 20
        }

        StyleText {
            anchors.centerIn: parent
            text: qsTr("敬请期待...")
            color: "black"
        }

        Optins{
            id:quit
            str:"Quit"
            width: gamewin.width/3
            height: 1/3 * quit.width
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.width / 20

            MouseArea{
                anchors.fill :parent
                onClicked:  {Qt.quit()}
            }
        }
    }
}
