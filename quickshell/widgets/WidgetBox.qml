import Quickshell
import QtQuick
import qs.config


Rectangle{
  id: root

  width: Spacing.widgetbox_width
  height: Spacing.widgetbox_height

  anchors.horizontalCenter: parent.horizontalCenter

  color: Colours.secondary

  property Component widget; 
}
