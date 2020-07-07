import QtQuick 2.0
import Felgo 3.0

EntityBase {
    signal contact()

    id: entity
    entityId: "entity"
    entityType: "gold"

    Image {
        id: gold
        anchors.fill: parent
        source: "../../assets/img/gold.png"
    }

    BoxCollider {
        id: collider
        anchors.fill: parent
        bodyType: Body.Static
        fixture.onBeginContact: entity.contact()
    }
}
