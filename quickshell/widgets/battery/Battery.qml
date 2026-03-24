import Quickshell
import QtQuick
import qs.config
import qs.utils
import qs.widgets


WidgetBox{
  Rectangle{
    id: cap

    width: 5
    height: 3

    color: Colours.accent

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: border.top

  }

  Rectangle{ 
    id: border

    width: Spacing.widgetbox_width / 3
    height: Spacing.widgetbox_height * 0.6

    border.color: Colours.accent

    color: "transparent"

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter


    Rectangle{
      id: fill

      width: parent.width  
      height:  parent.height * Battery.capacity_percent 

      anchors.bottom: parent.bottom

      color: Colours.accent
    }


    // Conditioanlly load the charging icon
    Loader{
      active: Battery.charging
      sourceComponent: charging
    }
    
    // Charging Icon
    Component { 
      id: charging
      Charging{
        width: border.width
        height: border.height
      }
    }
  }
}
