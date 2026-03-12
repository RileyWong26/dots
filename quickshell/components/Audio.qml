import Quickshell
import QtQuick 
import QtQuick.Controls
import QtQuick.Layouts
import qs.utils


Rectangle { 

  id: audio_Section

  width: 65
  height: 65
  color: "transparent"

  Slider{
    width: parent.width
    
    // value: Utils.Audio.volume
    value: Audio.volume

  }


  anchors.horizontalCenter: parent.horizontalCenter
  Text{
    id: test
    
    anchors.horizontalCenter:parent.horizontalCenter
    
    color: "white"

    text: Audio.muted
    
  }


}
