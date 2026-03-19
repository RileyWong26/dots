import Quickshell
import QtQuick
import QtQuick.Shapes

import qs.theme

Rectangle{ 
  id: root
  width: 65
  height: 65

  anchors.horizontalCenter: parent.horizontalCenter
  color: "transparent" 

  rotation: -90

  Canvas{
    width: root.width ;
    height: root.height 

    anchors.horizontalCenter:root.horizontalCenter

    onPaint:{
        var ctx = getContext("2d");
        ctx.reset();

        var centerX = width / 2;
        var centerY = height / 2;
        var radius = 15;

        // Start at 45° and end at 315° (leave gap at top)
        var startAngle = Math.PI * 0.3;   // 45°
        var endAngle = Math.PI * 1.7;     // 315°

        // 3/4 circle
        ctx.beginPath();
        ctx.arc(centerX, centerY, radius, startAngle, endAngle, false);
        ctx.lineWidth = 5;
        ctx.strokeStyle = Colours.accent;
        ctx.lineCap = "round";
        ctx.stroke();


        // Line
        ctx.beginPath();
        ctx.moveTo(root.width * 0.55, centerY);
        ctx.lineTo(root.width * 0.75, centerY);
        ctx.lineWidth = 5;
        ctx.strokeStyle = Colours.accent;
        ctx.lineCap = "round";
        ctx.stroke();
    }
  }
}
