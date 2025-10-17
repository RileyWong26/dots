import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Widgets
import Quickshell.Services.UPower
import QtQuick.Layouts
// import QtDeviceUtilities.NetworkSettings

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
      Rectangle{
        id: background
        anchors.fill: parent
        // radius: 20
        color: '#2b2b2b'
        topRightRadius: 20
        bottomRightRadius: 20
        opacity: 0.5
      }
      Date{}
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
      
      }
    }
  
  
  // Load font
  FontLoader {
    id: notosans;
    source: "/usr/share/fonts/noto/NotoSans-BoldItalic.ttf"
  }
}
