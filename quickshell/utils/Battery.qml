pragma Singleton

import Quickshell.Services.UPower
import QtQuick
import Quickshell

Singleton{
  id: root

  readonly property var battery: UPower.displayDevice
  readonly property real capacity: Math.round ( root.battery.percentage * 100) 
}
