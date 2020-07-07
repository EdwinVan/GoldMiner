import QtQuick 2.0
import Felgo 3.0

EntityBase {
    signal contact()

    id: entity

    entityId: "entity"
    entityType: "line"
    property real speed: 0

    property real heiht: 0
    Rectangle {//绳子
        z:3
        width: 5
        height: entity.height
        visible: true
        color: "black"
    }
}
