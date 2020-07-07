import QtQuick 2.0
import Felgo 3.0

//  第1关时间为0时但未达到目标分数时将触发的视图

Scene {

    id: quiItem
    property int score: 0
    anchors.fill: parent
    Image {
        id: bg
        anchors.fill: parent
        source: "../../assets/img/cut-scene-background.jpg"
    }

    Image {
        id: gameback
        width: parent.width / 4
        height: parent.height / 3
        anchors.centerIn: parent
        source: "../../assets/img/dialog-background.png"
        StyleText {
            anchors.centerIn: parent
            text: qsTr("Scores: ") + gameScene.money
            color: "black"
        }

        StyleText {
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.width / 20
            text: qsTr("You Failed")
            color: "black"
        }


//        Optins{//返回主界面重新开始游戏
//            id:restart
//            str:"Menu"
//            width: gameback.width/3
//            height: 1/3 * restart.width
//            anchors.bottom: parent.bottom
//            anchors.left: parent.left
//            anchors.leftMargin: parent.width / 20
//            anchors.bottomMargin: parent.width / 20

//            MouseArea{
//                anchors.fill: parent
//                onClicked:  {
//                    gameWindow.state="menu"
//                }
//            }
//        }

        Optins{//按钮“Quit”,关闭游戏
            id:quit
            str:"Quit"
            width: gameback.width/3
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
