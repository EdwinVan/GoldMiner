import QtQuick 2.0
import Felgo 3.0

EntityBase {
    signal contact()

    id: entity
    entityId: "entity"
    entityType: "stone"

    Image {
        id: stone
        anchors.centerIn: collider
        source: "../../assets/img/stone.png"
    }

    BoxCollider {
        id: collider
        width: stone.width
        height: stone.height
        bodyType: Body.Static
        fixture.onBeginContact: entity.contact()
    }
}
