pragma Singleton

import Quickshell.Services.UPower
import QtQuick
import Quickshell

Singleton{
  id: root

  readonly property var battery: UPower.displayDevice

  // Capacities
  readonly property real capacity: Math.round ( battery.percentage * 100) 
  readonly property real capacity_percent: capacity / 100


  // Charging state
  readonly property var state: battery.state
  readonly property bool charging: ( state == UPowerDeviceState.Charging || state == UPowerDeviceState.FullyCharged )

}
