import Quickshell
import QtQuick
import QtQuick.Shapes
import qs.config
import qs.utils
import qs.widgets



WidgetBox{
  id: wifi
  // color: "white"
  property var h : Networks
   Shape {
     id: root
        anchors.fill: parent

        // Border / 3 bars
        WifiIcon{
          id: border
          fillColor: (Networks.signal_strength > 66) ? Colours.accent : "transparent"
        }
        // 2 bars
        WifiIcon{
          scale: 2/3
          fillColor: (Networks.signal_strength > 45) ? Colours.accent : "transparent"
          strokeColor: "transparent"
        }

        // 1 bar
        WifiIcon{
          scale: 1/3
          fillColor: (Networks.signal_strength > 20) ? Colours.accent : "transparent"
          strokeColor: "transparent"
        }

        // 1 bar
        WifiIcon{
          scale: 1/3.5
          fillColor: Networks.connected ? Colours.accent : "transparent"
          strokeColor: "transparent"
        }

        // Not connected line
        Shape{
          anchors.fill: root
          ShapePath{


          strokeColor: Networks.connected ? "transparent" : Colours.accent
          strokeWidth: 2

          startX: 0
          startY: 0
          
          PathLine{x: root.width; y: root.height * 0.9}

          }
        }
      }
}

