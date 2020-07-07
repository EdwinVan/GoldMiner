import QtQuick 2.0
import Felgo 3.0

//  第2关界面按下暂停按钮后显示的场景

Item {

    id: item
    anchors.fill: parent
    signal continuePressed()
    signal quitPressed()
    signal musicPressed()

    Image {
        id: bg
        anchors.fill: parent
        source: "../../assets/img/instruction-dialog-background.png"
    }

    Image {
        id: dialog
        width: parent.width / 4
        height: parent.height / 3
        anchors.centerIn: parent
        source: "../../assets/img/dialog-background.png"

        Column{
            anchors.fill: parent
            anchors.margins: parent.width / 20
            width: 0.9 * parent.width
            height: 0.9 * parent.height
            spacing: 0.05 * height

            Optins {//按钮“Continue”,继续游戏
                str: "Continue"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        gameWindow.state="game2"
                    }
                }
            }

            Optins {//按钮“Music”,关闭游戏背景音乐，但仍保留音效
                str: "Music"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        gameScene2.gameBgm.stop()
                    }
                }
            }

            Optins {//按钮“Quit”,关闭游戏
                str: "Quit"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {Qt.quit()}
                }
            }
        }
    }
}

