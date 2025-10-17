import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
import Quickshell.Services.UPower

Rectangle{
    id: background
    anchors.fill: parent
    color: 'transparent'
    
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
          anchors.horizontalCenter: parent.horizontalCenter

          // font?
          font.family: notosans.name;
          font.pointSize: 10
          color: "white"
          opacity: 0.5
          text: root.time[4]
        } 
        Text {
          id: battery
    
          // center the bar in its parent component (the window)
          anchors.horizontalCenter: parent.horizontalCenter

          // font?
          font.family: notosans.name;
          font.pointSize: 10
          color: "white"
          opacity: 0.5
          text: UPower.displayDevice.percentage * 100 + "%"
          
        } 
        Text {
          id: hoverable
    
          // center the bar in its parent component (the window)
          anchors.horizontalCenter: parent.horizontalCenter

          // font?
          font.family: notosans.name;
          font.pointSize: 10
          color: "white"
          opacity: 0.5
          text: mouse.hovered ? "hi" : "hover me"
          
        } 
        Text {
          id: network
    
          // center the bar in its parent component (the window)
          anchors.horizontalCenter: parent.horizontalCenter

          // font?
          font.family: notosans.name;
          font.pointSize: 10
          color: "white"
          opacity: 0.5
          // text: NetWorkSettingsType.Wired
          
        } 
        HoverHandler{
          id: mouse
          acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
          cursorShape: Qt.PointingHandCursor
        }
      }
Process {
      id: dateProc
      command: ["date"]

      running: true

      stdout: StdioCollector {
        onStreamFinished: {
          root.time = this.text.split(" ");
        }

      }
}
  Timer {
    interval: 1000 // 1000ms = 1s

    running: true

    repeat: true

    onTriggered: dateProc.running = true
  }
}