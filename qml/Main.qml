import Felgo 3.0
import QtQuick 2.0
import "scenes"

GameWindow {
    id: gameWindow

    MenuScene {//游戏开始界面
        id: menuScene
        visible: false
        onStartPressed: {
            visible = false
//            gameWindow.state = "game"
//            gameScene.gameBgm.play()
            gameWindow.state = "cut"
            cutScene.visible=true
            cutScene.cutsceneBgm.play()
        }
    }

    GameScene {//游戏场景第1关
        id: gameScene
        visible: false
        onPause: {
            gameWindow.state = "pause"
        }
        onTimeOut: {
            gameWindow.state = "quit"
            gameScene.gameBgm.stop()
        }
        onReachTarget:
        {
            gameScene.gameBgm.stop()
            gameWindow.state = "win"
        }
    }

    GameScene2{//游戏场景第2关
        id:gameScene2
        visible: false
        money: gameScene.money
        onPause: {
            gameWindow.state = "pause2"
        }
        onTimeOut:
        {
            gameWindow.state = "quit2"
            gameScene2.gameBgm.stop()
        }
        onReachTarget:
        {
            gameScene2.gameBgm.stop()
            gameWindow.state = "win2"
        }
    }

    GameScene3{//游戏场景第3关
        id:gameScene3
        visible: false
        money: gameScene2.money
        onPause: {
            gameWindow.state = "pause3"
        }
        onTimeOut:
        {
            gameWindow.state = "quit3"
            gameScene3.gameBgm.stop()
        }
        onReachTarget:
        {
            gameScene3.gameBgm.stop()
            gameWindow.state = "win3"
        }
    }

    PauseScene {//第1关界面按下暂停按钮后显示的场景
        id: pauseScene
        visible: false

        onContinuePressed: {
            visible = false
            gameWindow.state = "game"
            gameScene.gameBgm.play()
        }
    }

    PauseScene2 {//第2关界面按下暂停按钮后显示的场景
        id: pauseScene2
        visible: false

        onContinuePressed: {
            visible = false
            gameWindow.state = "game2"
            gameScene2.gameBgm.play()
        }
    }

    PauseScene3 {//第3关界面按下暂停按钮后显示的场景
        id: pauseScene3
        visible: false

        onContinuePressed: {
            visible = false
            gameWindow.state = "game3"
            gameScene3.gameBgm.play()
        }
    }

    QuitScene{//第1关时间为0时但未达到目标分数时将触发的视图
        id:quitScene
        visible: false
        score: gameScene.money
    }

    QuitScene2{//第2关时间为0时但未达到目标分数时将触发的视图
        id:quitScene2
        visible: false
        score: gameScene2.money
    }

    QuitScene3{//第3关时间为0时但未达到目标分数时将触发的视图
        id:quitScene3
        visible: false
        score: gameScene3.money
    }

    WinScene{//时间为0时，已达到第1关目标分数时将触发的视图
        id:winScene
        visible: false
        score: gameScene.money
    }

    WinScene2{//时间为0时，已达到第2关目标分数时将触发的视图
        id:winScene2
        visible: false
        score: gameScene2.money
    }

    WinScene3{//时间为0时，已达到第3关目标分数时将触发的视图
        id:winScene3
        visible: false
        score: gameScene3.money
    }

    CutScene{ //主界面与第1关过渡界面
        id:cutScene
        visible: false
        onCutsceneTimeOut:
        {
            cutScene.cutsceneBgm.stop()
            cutScene.visible = false
            gameWindow.state = "game"
            gameScene.gameBgm.play()
            console.log("out")
        }
    }

    CutScene2{//第1关与第2关过渡界面
        id:cutScene2
        visible: false
        onCutscene2TimeOut: {
            cutScene2.visible = false
            cutScene2.cutsceneBgm.stop()
            gameWindow.state = "game2"
            gameScene2.gameBgm.play()
        }
    }

    CutScene3{//第2关与第3关过渡界面
        id:cutScene3
        visible: false
        onCutscene3TimeOut: {
            cutScene3.visible = false
            cutScene3.cutsceneBgm.stop()
            gameWindow.state = "game3"
            gameScene3.gameBgm.play()
        }
    }

    CutScene4{//第3关与第4关过渡界面
        id:cutScene4
        visible: false
    }

    state: "menu"
    states: [
        State {
            name: "menu"
            PropertyChanges { target: menuScene; visible: true }
        },
        State {
            name: "game"
            PropertyChanges { target: gameScene; visible: true; timeBegin: true ;}
        },
        State {
            name: "pause"
            PropertyChanges { target: pauseScene; visible: true; }
        },
        State {
            name: "quit"
            PropertyChanges { target: quitScene; visible: true }//gameover
        },
        State {
            name: "win"
            PropertyChanges { target: winScene; visible: true }//when player win the game 1
        },
        State {
            name: "cut"
            PropertyChanges { target: cutScene; visible: true ; cutscenetimeBegin: true}
        },
        State {
            name: "game2"
            PropertyChanges { target: gameScene2; visible: true; timeBegin: true }
        },
        State {
            name: "pause2"
            PropertyChanges { target: pauseScene2; visible: true; }
        },
        State {
            name: "quit2"
            PropertyChanges { target: quitScene2; visible: true }//gameover2
        },
        State {
            name: "cut2"
            PropertyChanges { target: cutScene2; visible: true ; cutscenetimeBegin: true}
        },
        State {
            name: "win2"
            PropertyChanges { target: winScene2; visible: true }//when player win the game 2
        },
        State {
            name: "game3"
            PropertyChanges { target: gameScene3; visible: true; timeBegin: true }
        },
        State {
            name: "pause3"
            PropertyChanges { target: pauseScene3; visible: true; }
        },
        State {
            name: "quit3"
            PropertyChanges { target: quitScene3; visible: true }//gameover3
        },
        State {
            name: "win3"
            PropertyChanges { target: winScene3; visible: true }//when player win the game 3
        },
        State {
            name: "cut3"
            PropertyChanges { target: cutScene3; visible: true ; cutscenetimeBegin: true}
        },
        State {
            name: "cut4"
            PropertyChanges { target: cutScene4; visible: true ;}
        }
    ]
}
