pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton{

  id: root

  readonly property var nodes: Pipewire.nodes.values

  readonly property var sink: Pipewire.defaultAudioSink
  readonly property var source: Pipewire.defaultAudioSource

  readonly property real volume: sink?.audio?.volume ?? 0

  readonly property bool muted: sink?.audio?.muted

  function setVolume(newVolume: real) : void {
    if (sink?.ready && sink?.audio){
      sink.audio.muted = false;
      sink.audio.volume = newVolume
    }
  }

  // Track all nodes 
  PwObjectTracker{
    objects:  [...root.nodes]

  }
}
