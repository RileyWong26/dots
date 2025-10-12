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
      id: panel
      screen: modelData
      anchors {
        left: true
        top: true
        bottom: true
      }

      // implicitWidth: 50
      // width: 50
      //What do you think???
      color: "transparent"
      
      MouseArea{
        id: mousearea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
          // popout.visible = mousearea.containsMouse
          // popout.anchor.rect.x = 150
          animateOpacity.start()
        }
        onExited: {
          // popout.visible = mousearea.containsMouse
        }
      }
      NumberAnimation {
        id: animateOpacity
        target: popout
        properties: "anchor.rect.x"
        from: 100
        to: 150
        duration: 90
        // loops: Animation.Infinite
        easing {type: InOut}
   }
      // Rectangle for rounded borders, so fancy
      Rectangle {
        id: background
        anchors.fill: parent
        // radius: 20
        color: "#acacac"
        topRightRadius: 20
        bottomRightRadius: 20
        opacity: 0.5
        
      }
      PopupWindow{
          id: popout
          anchor.window: panel
          anchor.rect.x: panel.width
          anchor.rect.y: panel.height / 2 - 50
          color: "red"
          width: 100
          height: 100
          // visible: true
          visible: false
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
        HoverHandler{
          id: mouse
          acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
          cursorShape: Qt.PointingHandCursor
        }
      }
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
  // Load font
  FontLoader {
    id: notosans;
    source: "/usr/share/fonts/noto/NotoSans-BoldItalic.ttf"
  }
}
