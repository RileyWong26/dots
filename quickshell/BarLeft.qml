import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Widgets
import Quickshell.Services.UPower
import QtQuick.Layouts

Scope {
  id: root

  property var time

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
      //What do you think???
      color: "transparent"
      
      // Rectangle for rounded borders, so fancy
      Rectangle {
        anchors.fill: parent
        // radius: 20
        color: "#acacac"
        topRightRadius: 20
        bottomRightRadius: 20
        opacity: 0.5

      }
      ColumnLayout{
        spacing: 20
        anchors.centerIn: parent

        Text {
          id: day
    
          // center the bar in its parent component (the window)
          // anchors.centerIn: parent
          anchors.horizontalCenter: parent.horizontalCenter

          // font?
          // font.family: "ComicSans"
          font.family: notosans.name;
          // font.family: "Roboto"
          font.pointSize: 12
          // font.family: "NotoSans"
          color: "white"
          opacity: 0.5
          text: root.time[0]
          // Make look vertical
          // rotation: -90
        } 
        Text {
          id: date
          
          // center the bar in its parent component (the window)
          // anchors.centerIn: parent
          anchors.horizontalCenter: parent.horizontalCenter

          // font?
          // font.family: "ComicSans"
          font.family: notosans.name;
          // font.family: "Roboto"
          font.pointSize: 10
          // font.family: "NotoSans"
          color: "white"
          opacity: 0.5
          text: root.time[1] + " " + root.time[3]
          // Make look vertical
          // rotation: -90
        } 

        Text {
          id: clock
    
          // center the bar in its parent component (the window)
          // anchors.centerIn: parent
          anchors.horizontalCenter: parent.horizontalCenter

          // font?
          // font.family: "ComicSans"
          font.family: notosans.name;
          // font.family: "Roboto"
          font.pointSize: 10
          // font.family: "NotoSans"
          color: "white"
          opacity: 0.5
          text: root.time[4]
          // Make look vertical
          // rotation: -90
        } 
      }
    }
  }
  Process {
      id: dateProc
      command: ["date"]

      running: true

      stdout: StdioCollector {
        onStreamFinished: root.time = this.text.split(" ")
      }
    }
  Timer {
    interval: 1000 // 1000ms = 1s

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
