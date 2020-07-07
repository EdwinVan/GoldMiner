import QtQuick 2.0
import Felgo 3.0
import QtMultimedia 5.12

EntityBase {
    signal contact()

    id: entity
    entityId: "entity"
    entityType: "hook"
    property real speed: 0
    Image {
        id: hook
        anchors.fill: parent
        source: "../../assets/img/hook.png"
    }

    CircleCollider {
        id: collider
        anchors.fill: parent
        fixture.onBeginContact: {
            console.log("peng")
            audio.play();
            entity.contact()
        }
    }

    Audio{
        id: audio
        source: "../../assets/audio/collide.mp3"
    }
}
