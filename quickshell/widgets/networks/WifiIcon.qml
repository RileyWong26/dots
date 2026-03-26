import Quickshell
import QtQuick
import QtQuick.Shapes
import qs.config
        ShapePath {
          id: path
            strokeColor: Colours.accent 
            strokeWidth:2 
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap
            joinStyle: ShapePath.RoundJoin

            property real scale: 1

            property real cx: width / 2
            property real cy: height / 2 
            property real r: Icons.wifi_radius
            property real arc_radius: 20 + 5

            property real alignment: (1 - scale) * r


            // angles
            property real angle: 0.85
            property real left_angle:  Math.PI * angle // -135 deg
            property real right_angle: Math.PI * (1 - angle) // -45 deg
            

            // computed points
            property real leftX:  ( cx + r * Math.cos(left_angle) ) + alignment
            property real leftY:  ( cy - r * Math.sin(left_angle) ) + alignment

            property real rightX: (  cx + r  * Math.cos(right_angle)  ) - alignment 
            property real rightY: ( cy - r * Math.sin(right_angle) ) + alignment 

            property real bottomX: cx 
            property real bottomY: cy + (20 / 2) 


            // --- Path ---
            startX: bottomX
            startY: bottomY 

            // left line
            PathLine {
                x: path.leftX
                y: path.leftY
            }

            // arc across the top
            PathArc {
                x: path.rightX
                y: path.rightY
                radiusX: path.arc_radius
                radiusY: path.arc_radius
            }

            // right line back down
            PathLine {
                x: path.bottomX
                y: path.bottomY
            }
        }
