import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Item{

  id: pipewire
  readonly property var audio : Pipewire.defaultAudioSink.audio

  // Track all nodes 
  PwObjectTracker{
    id: tracker
    objects: Pipewire.nodes.values

  }
}
