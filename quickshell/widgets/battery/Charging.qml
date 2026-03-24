import Quickshell
import QtQuick
import QtQuick.Shapes
import qs.config

Shape {
    id: root 
    width: parent.width
    height: parent.height 

    ShapePath {
        strokeColor: Colours.accent
        fillColor: Colours.secondary
        strokeWidth: 1

        property real width: root.width
        property real height: root.height

        // Starting point
        PathMove { x: 0.5 * width; y: 0 }

        // zig-zag body
        PathLine { x: 0.05 * width; y: 0.5 * height }
        PathLine { x: 0.35 * width; y: 0.5 * height }
        PathLine { x: 0.2 * width; y: height }   // bottom pointy
        PathLine { x: 0.8 * width; y: 0.3 * height }
        PathLine { x: 0.5 * width; y: 0.3 * height }

        // close top point
        PathLine { x: 0.5 * width; y: 0 }
    }
}
