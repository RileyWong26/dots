import Quickshell
import QtQuick 
import QtQuick.Controls
import QtQuick.Layouts
import qs.utils
import qs.theme


Rectangle { 

  id: audio_Section

  width: 65
  height: 65
  color: Colours.secondary 

  Slider{
    width: parent.width
    
    // value: Utils.Audio.volume
    value: Audio.volume

  }


  anchors.horizontalCenter: parent.horizontalCenter
  Text{
    id: test
    
    anchors.horizontalCenter:parent.horizontalCenter
    
    color: Colours.text_primary

    text: Audio.muted
    
  }


}
