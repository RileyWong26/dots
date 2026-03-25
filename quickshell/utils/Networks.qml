pragma Singleton

import Quickshell.Networking
import Quickshell
import Quickshell.Io
import QtQuick

Singleton{
    id: root

    readonly property var devices: Networking.devices

    readonly property string current_network: {
      for (var i = 0; i < devices.values.length; i++){
         var currentDevice = devices.values[i]
         if (currentDevice != undefined){
          //gcc check wifi and connected
          if (currentDevice.type == 1  ){
            // Find the current wifi network that is connected
            for (var j = 0; j < currentDevice.networks.values.length; j++){
              if (currentDevice.networks.values[j].connected){
                return currentDevice.networks.values[j].name
              }
            }
          } 
        }
      }
      return "None"
    };

    property bool connected: (current_network != "None")

    property int signal_strength: 0

  // Command to read the command's output
  Process {
        id: strength_proc 
        command: ["sh", "-c", "nmcli -f IN-USE,SSID,SIGNAL,BARS dev wifi | grep '*' | grep -o '[0-9]\\+'"]

        running: true

        stdout: StdioCollector {
          onStreamFinished: {
            root.signal_strength = root.change_strength(this.text);
          }

        }
  }

  // Create a timer
  Timer {
    interval: 1000 // 1000ms = 1s

    running: true

    repeat: true

    onTriggered: strength_proc.running = true
  }

  function change_strength(input: string){
    if (input != undefined){
        input = input.trim();
        root.signal_strength = (input.slice(-2));
    }
  }
}

