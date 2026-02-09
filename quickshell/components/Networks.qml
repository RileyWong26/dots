import Quickshell.Networking
import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Widgets

ColumnLayout{
  spacing: 10
  anchors.horizontalCenter: parent.horizontalCenter

  PanelWindow{
    id: networkBox
    anchors.bottom: parent.bottom
    color:"white"

    visible: false
    MouseArea{
      anchors.fill: parent
      hoverEnabled: true
      onEntered: networkBox.visible = true
      onExited: networkBox.visible = false
    }
  }
  // wifi icon I guess
MouseArea{
      // anchors.fill: parent
      hoverEnabled: true
      width: 100
      height: 100
      onClicked: networkBox.visible = true
      propagateComposedEvents: true
      preventStealing: true
     Image{
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../icons/WifiWhite.svg"
      }
    }
 
  // Network Name
  Text{
    property var wifi : { 
      for (var i = 0; i < Networking.devices.values.length; i++){
         var currentDevice = Networking.devices.values[i]
        if  (currentDevice != undefined){
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
      return "Not currently connected"
    }
    id: nmtext
    text: wifi
    font.pointSize : 10
    color:   "white"  
  }
}
