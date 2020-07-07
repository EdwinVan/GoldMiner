import QtQuick 2.0
import Felgo 3.0

//  第1关游戏场景的背景

Item {
    id: item

    property alias bgtop: top
    signal launch()

    Image {
        id: top
        z: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 0.25 * parent.height

        source: "../../assets/img/game-background-top.png"
    }

    Image {
        id: bottom
        anchors.topMargin: -20
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: top.bottom
        anchors.bottom: parent.bottom

        source: "../../assets/img//game-background-bottom.jpg"

        MouseArea{
            anchors.fill: parent
            onPressed: {launch() //点击bottom部分时，发送信号
            }
        }
    }
}
