import Quickshell
import QtQuick 
import QtQuick.Controls
import QtQuick.Layouts

import "../utils/" as Utils


Rectangle { 

  id: audio_Section

  width: 65
  height: 65
  color: "transparent"

  Slider{
    width: parent.width
    
    value: 0.5

  }

  Utils.Pipewire{
    id: pipewire
  }

  anchors.horizontalCenter: parent.horizontalCenter
  Text{
    id: test
    
    anchors.horizontalCenter:parent.horizontalCenter
    
    color: "white"

    text: pipewire.audio.muted
    
  }


}
