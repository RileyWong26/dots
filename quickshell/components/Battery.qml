import Quickshell.Services.UPower
import Quickshell
import QtQuick 
import QtQuick.Layouts

RowLayout { 
  id: batterySection
  // anchors
  // anchors.bottom: parent.bottom
  anchors.horizontalCenter: parent.horizontalCenter
  // Width & Height
  width: panel.width - 30
  height: 40
  spacing: 18
  // Battery Icon thing 
  Rectangle {
    id: batteryBorder

    anchors.verticalCenter: parent.verticalCenter
    border.color: "white"
    width: batterySection.width - 30
    height: batterySection.height - 30
    color: "transparent"
    // Fill the rectangle boi to show battery fullness
    Rectangle {
      id: batteryFill
      property var batteryPercent : UPower.displayDevice.percentage
      width: batteryBorder.width * batteryPercent
      height: batteryBorder.height * batteryPercent
    }
  }
  // Battery expressed as a percent text
  Rectangle{ 
    Text {
      id: batteryText

      anchors.verticalCenter: parent.verticalCenter
      // center the bar in its parent component (the window)
      // anchors.horizontalCenter: parent.horizontalCenter

      // font?
      font.family: notosans.name;
      font.pointSize: 10
      color: "white"
      text: UPower.displayDevice.percentage * 100 + "%"

    }
  } 
}
