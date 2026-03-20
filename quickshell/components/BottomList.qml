import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.widgets
import qs.widgets.networks
import qs.config


Rectangle{
  id: root

  color: Colours.secondary

  width: Spacing.components_width 
  height: layout.implicitHeight + (2 * Components.bottom_margin)

  anchors.horizontalCenter: parent.horizontalCenter

  radius : Borders.component_rounding

  ColumnLayout{
    id: layout

    width: Spacing.components_width

    spacing: Components.spacing

    anchors.verticalCenter: parent.verticalCenter

    Wifi{}
    Battery{}
    
  }
}
