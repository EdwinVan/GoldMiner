import QtQuick 2.0
import Felgo 3.0

//  按钮

Image {
    property string str: ""
    id: name
    width: parent.width
    height: 0.3 * parent.height
    source: "../../assets/img/dialog-options.png"
    StyleText {
        id: t
        anchors.centerIn: parent
        text: str
    }
}
