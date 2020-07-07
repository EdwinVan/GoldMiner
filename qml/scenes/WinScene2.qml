import QtQuick 2.0
import Felgo 3.0

//  时间为0时，已达到第2关目标分数时将触发的视图

Scene {

    id: winItem
    property int score: 0
    anchors.fill: parent

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
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.width / 20
            text: qsTr("You Win")
            color: "black"
        }

        StyleText {
            anchors.centerIn: parent
            text: qsTr("Scores: ") + score
            color: "black"
        }

        Optins{//按钮“Next”
            id:win
            str:"Next"
            width: gamewin.width/3
            height: 1/3 * win.width
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 20
            anchors.bottomMargin: parent.width / 20

            MouseArea{
                anchors.fill: parent
                onClicked:  {
                    gameWindow.state = "cut3"
                    cutScene3.cutsceneBgm.play()
                }
            }
        }

        Optins{//按钮“Quit”
            id:quit
            str:"Quit"
            width: gamewin.width/3
            height: 1/3 * quit.width
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: parent.width / 20
            anchors.rightMargin: parent.width / 20

            MouseArea{
                anchors.fill :parent
                onClicked:  {Qt.quit()}
            }
        }
    }
}
