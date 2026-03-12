pragma Singleton

import Quickshell.Bluetooth
import Quickshell


Singleton{
  id: root

  readonly property list <BluetoothDevice> devices : Bluetooth.devices.values

  readonly property var adapter: Blueooth.defaultAdapter

  function connect_to_device(index: int) : void {
    var device = list[index]

    if (device.blocked) {
        return
    }
    else {
      device.connect()
    }
  } 
}
