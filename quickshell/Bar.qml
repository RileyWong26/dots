import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Widgets

Scope {
  id: root

  property string time

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData
      anchors {
        left: true
        top: true
        bottom: true
      }

      implicitWidth: 50
      
      color: "#acacac"

      Text {
        id: clock
  
        // center the bar in its parent component (the window)
        anchors.centerIn: parent

        // font?
        // font.family: "ComicSans"
        font.family: notosans.name;
        // font.family: "Roboto"
        font.pointSize: 10
        // font.family: "NotoSans"
        text: root.time
      } 
      ClippingRectangle {
        color: "#000000"
      }
    }
  }
  Process {
      id: dateProc
      command: ["date"]

      running: true

      stdout: StdioCollector {
        onStreamFinished: root.time = this.text
      }
    }
  Timer {
    interval: 1000

    running: true

    repeat: true

    onTriggered: dateProc.running = true
  }
  // Load font
  FontLoader {
    id: notosans;
    source: "/usr/share/fonts/noto/NotoSans-BoldItalic.ttf"
  }
}
