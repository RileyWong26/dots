import Quickshell
import QtQuick 
import QtQuick.Layouts
import qs.utils
import qs.theme


Rectangle{ 
  id: batteryBox
  width: panel.width * 0.85
  height: 65
  color: Colours.secondary
  // Center
  anchors.horizontalCenter: parent.horizontalCenter
  // Border
  radius: 10
  ColumnLayout{ 
    id: batterySection
    // anchors
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    // Width & Height
    // width: panel.width - 30
    width: 70
    height: 70
    spacing: 10

    // Battery Icon thing 
    Rectangle {
      // The border
      id: batteryBorder

      anchors.horizontalCenter: parent.horizontalCenter
      border.color: Colours.accent
      width: batterySection.width - 30
      height: 10
      color: "transparent"
      // Fill the rectangle boi to show battery fullness
      Rectangle {
        id: batteryFill
        width: batteryBorder.width * Battery.capacity / 100
        height: batteryBorder.height * Battery.capacity / 100
        color: Colours.accent
      }
    }
    // Battery expressed as a percent text
    Rectangle{ 
      anchors.horizontalCenter: parent.horizontalCenter
      color: "transparent"
      width: 10
      height: 20
      Text {
        id: batteryText

        // center the bar in its parent component (the window)
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.top: parent.top
        // font?
        font.family: notosans.name;
        font.pointSize: 10
        color: Colours.text_primary
        text: Battery.capacity  + "%"

      }
    } 
  } 
}
