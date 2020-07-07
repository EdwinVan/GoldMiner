import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.12

// 游戏开始界面

Scene {
    signal startPressed()
    anchors.fill: parent

    Audio { //背景音乐
        id: bgm
        source: "../../assets/audio/menu-bg.mp3"
        loops: Audio.Infinite
    }
    Component.onCompleted: bgm.play()

    Image {
        id: bg
        z: -1
        anchors.fill: parent
        source: "../../assets/img/menu-scene-background.jpg"
    }

    Image {
        id: miner
        z: 1
        anchors.fill: parent
        source: "../../assets/img/miner-menu.png"
    }

    Image { //起始画面中开始按钮
        id: startBt
        x: 0.22 * miner.width
        y: 0.25 * miner.height
        z: 0
        width: 0.16 * miner.width
        height: 0.16 * miner.width
        source: "../../assets/img/start-0.png"
        MouseArea {
            anchors.fill: parent

            hoverEnabled: true
            onEntered: { //悬停时，切换图片，产生一个动态效果
                startBt.source = "../../assets/img/start-1.png"
            }
            onExited: {
                startBt.source = "../../assets/img/start-0.png"
            }
            onReleased: {
                bgm.stop()
                startPressed()
            }
        }

        Image { // 光晕
            id: halo
            anchors.centerIn: parent
            width: 0.25 * miner.width
            height: 0.25 * miner.width
            z: -1
            scale: 1
            source: "../../assets/img/halo.png"

            SequentialAnimation on scale { //让光晕放大缩小，产生闪烁效果
                NumberAnimation {
                    from: 1; to: 0.8
                    duration: 1500
                }
                NumberAnimation {
                    from: 0.8; to: 1
                    duration: 1500
                }
                loops: Animation.Infinite
            }
        }
    }
}
