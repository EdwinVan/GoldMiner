import Felgo 3.0
import QtQuick 2.0

EntityBase {
    signal contact()

    id: entity
    entityId: "entity"
    entityType: "case"

    BoxCollider {
        id: collider
        anchors.fill : parent
        bodyType: Body.Static
        fixture.onBeginContact: entity.contact()
    }
}
