import QtQuick 2.0
import Felgo 3.0

EntityBase {
    property bool running: false
    signal contact()

    id: entity
    entityId: "entity"
    entityType: "miner"

    SpriteSequence {
      id: miner
      running: entity.running
//      width: 0.09 * parent.width
//      height: 0.12 * parent.height
//      y: 0.1 * parent.height
//      anchors.horizontalCenter: parent.horizontalCenter

      Sprite {
        name: "miner"
        frameCount: 3
        frameRate: 5
        frameWidth: 80
        frameHeight: 60
        source: "../../assets/img/miner.png"
      }
    }

    BoxCollider {
        id: collider
        width: miner.width
        height: miner.height
        bodyType: Body.Static
        fixture.onBeginContact: entity.contact()
    }
}
