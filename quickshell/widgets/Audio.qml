import Quickshell
import QtQuick 
import QtQuick.Controls
import QtQuick.Layouts
import qs.utils
import qs.config

WidgetBox{
  id: root

  property bool muted: Audio.muted
  property real volume: Audio.volume
  
  Canvas {
    id: canvas
    anchors.fill: parent

    onPaint: {
      // Initialize canvas
        var ctx = getContext("2d")
        ctx.clearRect(0, 0, width, height)

        // Customizing colours
        ctx.strokeStyle = Colours.accent 
        ctx.fillStyle = Colours.accent
        ctx.lineWidth = 2

        // Speaker base (rectangle)
        ctx.beginPath()
        ctx.moveTo(width * 0.15, height * 0.35)
        ctx.lineTo(width * 0.35, height * 0.35)
        ctx.lineTo(width * 0.55, height * 0.2)
        ctx.lineTo(width * 0.55, height * 0.8)
        ctx.lineTo(width * 0.35, height * 0.65)
        ctx.lineTo(width * 0.15, height * 0.65)
        ctx.closePath()
        ctx.fill()

        // Sound waves
        if (!root.muted && root.volume > 0) {
            var levels = Math.ceil(root.volume / 33)

            for (var i = 0; i < levels; i++) {
                ctx.beginPath()
                ctx.arc(width * 0.6, height / 2,
                        (i + 1) * 8,
                        -0.8, 0.8)
                ctx.stroke()
            }
        }

        // Mute X
        if (root.muted || root.volume === 0) {
            ctx.beginPath()
            ctx.moveTo(width * 0.65, height * 0.35)
            ctx.lineTo(width * 0.85, height * 0.65)
            ctx.moveTo(width * 0.85, height * 0.35)
            ctx.lineTo(width * 0.65, height * 0.65)
            ctx.stroke()
        }
    }
    }
    // Trigger icon changes on volume changes
    onMutedChanged: canvas.requestPaint()
    onVolumeChanged: canvas.requestPaint()
}
