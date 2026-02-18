import QtQuick
import Quickshell
import QtQuick.Layouts
import "../components/" as Components

Scope {

  id: root

  property var time

  Variants {
    model: Quickshell.screens
    // The actual bar
    PanelWindow {
      required property var modelData
      id: panel
      screen: modelData
      // Anchors to sides of screen
      anchors {
        left: true
        top: true
        bottom: true
      }
      // Hover property
      property bool hovered: false
      // Width & Height
      height: screen.height
      width: hovered ? 75 : 0
      // BG color
      color: "transparent"
      // Animation on changes to width property
      Behavior on width{
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutCubic
        }
      }
      // Hover Area
      MouseArea{
        id: mousearea
        hoverEnabled: true
        height: panel.height
        width: 100
        onEntered: panel.hovered = true
        onExited: panel.hovered = false
        propagateComposedEvents: true
      }
      // Rectangle filling the bar for text 
      Rectangle{
        id: background
        color: 'transparent'
        topRightRadius: 20
        bottomRightRadius: 20
        anchors.fill: parent
        // Text / Date Component
        ColumnLayout{
          anchors.fill:parent
          spacing: 10
          Components.Date{}
          Components.Networks{}
          Components.Battery{}
        }
        // Keep the tab open 
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: panel.hovered = true
            onExited: panel.hovered = false
            propagateComposedEvents: true
        }
      }
    }
  }
}
