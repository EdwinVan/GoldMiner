import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.12

import "../entities"

//  游戏场景第3关

Scene {
    id: scene
    property int money: 0 //你的金币
    property int targetmoney3: 4000 //第3关目标金币
    property int time: 60  //每局时间
    property real origin_x: miner.x
    property real origin_y: miner.y + 0.5*miner.height
    property alias timeBegin: timer.running
    property alias gameBgm: bgm

    signal pause()
    signal timeOut()//时间消耗完，未能达到目标金额，输出成绩，退出游戏
    signal reachTarget()//达到目标金额，开启下一关

    EntityManager {id:entityManager; entityContainer: scene}

    anchors.fill: parent

    PhysicsWorld {
      id: physicsWorld
//      debugDrawVisible: true // enable this for physics debugging启用它用于进行调试
    }

    GameBackground3 {
        id: bg
        anchors.fill: parent
        onLaunch: {    //点击bottom, miner静动态切换，以及出钩
            miner.running = !miner.running
            hookswing.running = !hookswing.running
            hookshot.running = true
            linemove.running = true
        }
    }

    StyleText {
        anchors{
            left: parent.left
            top: parent.top
            leftMargin: 20
            topMargin: 20
        }
        text: qsTr("Gold:  $") + money
    }

    StyleText {
        anchors{
            left: parent.left
            top: parent.top
            leftMargin: 20
            topMargin: 70
        }
        text: qsTr("Target:  $") + targetmoney3
    }

    StyleText {
        anchors{
            top: parent.top
            rightMargin: 20
            topMargin: 20
            right: pause.left
        }
        text: qsTr("Time: ") + time
    }

    Timer {
        id: timer
        interval: 1000
        repeat: true
        triggeredOnStart: true
        running: false
        onTriggered:{
            time--;
            if(time==0 && money<targetmoney3) {timeOut()}
            else if(time==0 && money>=targetmoney3){
                reachTarget()
            }
        }
    }

    Image {
        id: pause
        source: "../../assets/img/pause-0.png"
        anchors{
            top: parent.top
            right: parent.right
            rightMargin: 20
            topMargin: 20
        }
        MouseArea{
            anchors.fill: parent
            onClicked: scene.pause()
        }
    }

    Miner{
        id:miner

        width: 0.09 * parent.width
        height: 0.12 * parent.height
        y: 0.1 * parent.height
        anchors.horizontalCenter: parent.horizontalCenter

        onContact: {
            hookswing.running = true
            miner.running = false //hook回到miner位置，则miner不做拉绳动作
        }
    }

    Hook {
        id: hook
        width: 0.05 * parent.width
        height: 0.05 * parent.width
        speed: Math.sqrt(scene.width/2*scene.width/2 + (scene.height-origin_y)*(scene.height-origin_y))
        x: origin_x
        y: origin_y
        onContact: {
            hookbacktominer.running = true
        }
        transform: Rotation {
            id: rot
            origin.x: hook.width / 2
            origin.y: 0
            angle: 80
            SequentialAnimation on angle {
                id:hookswing //hook摆动
                NumberAnimation {
                    from: 90; to: -90
                    duration: 1500
                }
                NumberAnimation {
                    from: -90; to: 90
                    duration: 1500
                }
                loops: Animation.Infinite
            }
        }

        ParallelAnimation{
            id: hookshot //hook静止射出
            running: false
            NumberAnimation {
                target: hook
                property: "x";
                to: scene.width / 2 - Math.sin (Math.PI * rot.angle / 180) * hook.speed
                duration: 1500
            }
            NumberAnimation {
                target: hook
                property: "y";
                to: origin_y + Math.cos(Math.PI * rot.angle / 180) * hook.speed
                duration: 1500
            }
        }

        ParallelAnimation{//hook回到miner所在位置
            id: hookbacktominer
            running: false
            NumberAnimation {
                target: hook
                property: "x";
                to: origin_x
                duration: 2000
            }
            NumberAnimation {
                target: hook
                property: "y";
                to: origin_y
                duration: 2000
            }
        }
    }

    Gold {
        id: gold
        width: 100
        height: 100
        visible: true
        x: Math.random()*100+900
        y: Math.random()*100+677
        onContact: {
            goldtominer.running = true
            golddisappear.running = true
            linemoveback.running = true
            money+=500
        }

        ParallelAnimation{
            id: goldtominer//gold跟随hook回到miner位置
            running: false
            NumberAnimation {
                target: gold
                property: "x";
                to: origin_x
                duration: 2500
            }
            NumberAnimation {
                target: gold
                property: "y";
                to: origin_y
                duration: 2500
            }
        }

        ParallelAnimation{//hook回到miner位置后gold消失
            id: golddisappear
            running: false
            NumberAnimation {
                target: gold
                property: "visible";
                to: 0
                duration: 4000
            }
        }
    }

    Gold {
        id: gold2
        width: 50
        height: 50
        visible: true
        x: Math.random()*100+190
        y: Math.random()*100+630
        onContact: {
            goldtominer2.running = true
            golddisappear2.running = true
            linemoveback.running = true
            money+=100
        }

        ParallelAnimation{
            id: goldtominer2//gold2跟随hook回到miner位置
            running: false
            NumberAnimation {
                target: gold2
                property: "x";
                to: origin_x
                duration: 2500
            }
            NumberAnimation {
                target: gold2
                property: "y";
                to: origin_y
                duration: 2500
            }
        }

        ParallelAnimation{//hook回到miner位置后gold2消失
            id: golddisappear2
            running: false
            NumberAnimation {
                target: gold2
                property: "visible";
                to: 0
                duration: 4000
            }
        }
    }

    Gold {
        id: gold3
        width: 70
        height: 70
        visible: true
        x: Math.random()*100+54
        y: Math.random()*100+345
        onContact: {
            goldtominer3.running = true
            golddisappear3.running = true
            linemoveback.running = true
            money+=250
        }

        ParallelAnimation{
            id: goldtominer3//gold3跟随hook回到miner位置
            running: false
            NumberAnimation {
                target: gold3
                property: "x";
                to: origin_x
                duration: 2500
            }
            NumberAnimation {
                target: gold3
                property: "y";
                to: origin_y
                duration: 2500
            }
        }

        ParallelAnimation{//hook3回到miner位置后消失
            id: golddisappear3
            running: false
            NumberAnimation {
                target: gold3
                property: "visible";
                to: 0
                duration: 4000
            }
        }
    }

    Gold {
        id: gold4
        width: 70
        height: 70
        visible: true
        x: Math.random()*100+650
        y: Math.random()*100+500
        onContact: {
            goldtominer4.running = true
            golddisappear4.running = true
            linemoveback.running = true
            money+=250
        }

        ParallelAnimation{
            id: goldtominer4//gold4跟随hook回到miner位置
            running: false
            NumberAnimation {
                target: gold4
                property: "x";
                to: origin_x
                duration: 2500
            }
            NumberAnimation {
                target: gold4
                property: "y";
                to: origin_y
                duration: 2500
            }
        }

        ParallelAnimation{//hook回到miner位置后gold4消失
            id: golddisappear4
            running: false
            NumberAnimation {
                target: gold4
                property: "visible";
                to: 0
                duration: 4000
            }
        }
    }

    Gold {
        id: gold5
        width: 100
        height: 100
        visible: true
        x: Math.random()*100+800
        y: Math.random()*100+467
        onContact: {
            goldtominer5.running = true
            golddisappear5.running = true
            linemoveback.running = true
            money+=500
        }

        ParallelAnimation{
            id: goldtominer5//gold5跟随hook回到miner位置
            running: false
            NumberAnimation {
                target: gold5
                property: "x";
                to: origin_x
                duration: 2500
            }
            NumberAnimation {
                target: gold5
                property: "y";
                to: origin_y
                duration: 2500
            }
        }

        ParallelAnimation{//hook回到miner位置后gold5消失
            id: golddisappear5
            running: false
            NumberAnimation {
                target: gold5
                property: "visible";
                to: 0
                duration: 4000
            }
        }
    }

    Gold {
        id: gold6
        width: 50
        height: 50
        visible: true
        x: Math.random()*100+926
        y: Math.random()*100+456
        onContact: {
            goldtominer6.running = true
            golddisappear6.running = true
            linemoveback.running = true
            money+=50
        }

        ParallelAnimation{
            id: goldtominer6//gold6跟随hook回到miner位置
            running: false
            NumberAnimation {
                target: gold6
                property: "x";
                to: origin_x
                duration: 2500
            }
            NumberAnimation {
                target: gold6
                property: "y";
                to: origin_y
                duration: 2500
            }
        }

        ParallelAnimation{//hook回到miner位置后gold6消失
            id: golddisappear6
            running: false
            NumberAnimation {
                target: gold6
                property: "visible";
                to: 0
                duration: 4000
            }
        }
    }

    //hook碰到左右下三边框回到miner位置
    Case{//左边框
        id:boxcaseleft
        anchors.left: parent.left
        width: 1
        height: scene.height

        onContact: {
            hookbacktominer.running = true
            linemoveback.running = true
        }
    }

    Case{//右边框
        id:boxcaseright
        anchors.right: parent.right
        width: 1
        height: scene.height

        onContact: {
            hookbacktominer.running = true
            linemoveback.running = true
        }
    }

    Case{//下边框
        id:boxcasedown
        anchors.bottom: parent.bottom
        width: scene.width
        height: 1

        onContact: {
            hookbacktominer.running = true
            linemoveback.running = true
        }
    }

    //绳子
    Line{
        id:line
        x:origin_x+hook.width/2
        y:origin_y
        transform: Rotation {
            id: lineswing

            origin.x: line.width / 2
            origin.y: 0
            angle: rot.angle
            SequentialAnimation on angle {
                id:lineswingdo
                NumberAnimation {
                    from: 0; to: rot.angle
                    duration: 0
                }
            }
        }

        onContact: {
            linemoveback.running = true
        }

        ParallelAnimation{
            id: linemove//绳子伸长
            running: false
            NumberAnimation {
                target: line
                property: "height";
                to: Math.sqrt(
                        (Math.cos(Math.PI * rot.angle / 180) * hook.speed)*
                        (Math.cos(Math.PI * rot.angle / 180) * hook.speed)
                        +
                        (Math.sin (Math.PI * rot.angle / 180) * hook.speed)*
                        (Math.sin (Math.PI * rot.angle / 180) * hook.speed)
                        )
                duration: 1600
            }
        }

        ParallelAnimation{
            id: linemoveback//绳子缩短
            running: false
            NumberAnimation {
                target: line
                property: "height";
                to: 0
                duration: 2100
            }
        }
    }

    Stone {
        id: stone
        width: 50
        height: 50
        visible: true
        x: Math.random()*100+632
        y: Math.random()*100+378
        onContact: {
            stonetominer.running = true
            stonedisappear.running = true
            linemoveback.running = true
            money+=10
        }

        ParallelAnimation{
            id: stonetominer//stone跟随hook回到miner位置
            running: false
            NumberAnimation {
                target: stone
                property: "x";
                to: origin_x
                duration: 2500
            }
            NumberAnimation {
                target: stone
                property: "y";
                to: origin_y
                duration: 2500
            }
        }

        ParallelAnimation{//hook回到miner位置后stone消失
            id: stonedisappear
            running: false
            NumberAnimation {
                target: stone
                property: "visible";
                to: 0
                duration: 4000
            }
        }
    }

    Stone {
        id: stone2
        width: 50
        height: 50
        visible: true
        x: Math.random()*100+232
        y: Math.random()*100+350
        onContact: {
            stonetominer2.running = true
            stonedisappear2.running = true
            linemoveback.running = true
            money+=10
        }

        ParallelAnimation{
            id: stonetominer2//stone2跟随hook回到miner位置
            running: false
            NumberAnimation {
                target: stone2
                property: "x";
                to: origin_x
                duration: 2500
            }
            NumberAnimation {
                target: stone2
                property: "y";
                to: origin_y
                duration: 2500
            }
        }

        ParallelAnimation{//hook回到miner位置后stone2消失
            id: stonedisappear2
            running: false
            NumberAnimation {
                target: stone2
                property: "visible";
                to: 0
                duration: 4000
            }
        }
    }

    Stone {
        id: stone3
        width: 50
        height: 50
        visible: true
        x: Math.random()*100+1000
        y: Math.random()*100+685
        onContact: {
            stonetominer3.running = true
            stonedisappear3.running = true
            linemoveback.running = true
            money+=10
        }

        ParallelAnimation{
            id: stonetominer3//stone3跟随hook回到miner位置
            running: false
            NumberAnimation {
                target: stone3
                property: "x";
                to: origin_x
                duration: 2500
            }
            NumberAnimation {
                target: stone3
                property: "y";
                to: origin_y
                duration: 2500
            }
        }

        ParallelAnimation{//hook回到miner位置后stone3消失
            id: stonedisappear3
            running: false
            NumberAnimation {
                target: stone3
                property: "visible";
                to: 0
                duration: 4000
            }
        }
    }

    Audio { //游戏背景音乐
        id: bgm
        source: "../../assets/audio/level-bg.mp3"
        volume: 0.1
        loops: Audio.Infinite
    }
}
