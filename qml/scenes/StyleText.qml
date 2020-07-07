import QtQuick 2.0
import Felgo 3.0

// 带特定格式的文本

Text {
    color: "white"
    font{
        family: fontFamily.name
        pixelSize: 40
    }

    FontLoader {
        id: fontFamily
        source: "../../assets/font/Marker_Felt.ttf"
    }
}
