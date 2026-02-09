import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
    
    ColumnLayout{
        spacing: 20
        // anchors.centerIn: parent
        // anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        id: timeLayout
        property var time: null
        // Day of the week text
        Text {
          id: day
    
          // center the bar in its parent component (the window)
          anchors.horizontalCenter: parent.horizontalCenter

          // font?
          font.family: notosans.name;
          font.pointSize: 12
          color: "white"
          text: root.time[0]
          // rotation: -90
        } 
        // Text featuring day of the week as a number 
        Text {
          id: date
          
          // center the bar in its parent component (the window)
          // anchors.centerIn: parent
          anchors.horizontalCenter: parent.horizontalCenter

          // font?
          font.family: notosans.name;
          font.pointSize: 10
          color: "white"
          text: root.time[1] + " " + root.time[2] + " " + root.time[3]
          // Make look vertical
          // rotation: -90
        } 
        // Time
        ColumnLayout { 
          id: hourminute
          spacing: 0
          anchors.horizontalCenter: parent.horizontalCenter
          // Hours
          Text {
            id: hours
      
            // Text
            font.family: notosans.name;
            font.pointSize: 20
            color: "white"
            property var hoursText:   {
              var hours = parseInt(root.time[4])
              var military = root.time[5]
              // Afternoon convert to military time
              if  (military == "PM"){
                if (hours != 12 ){
                  return String(hours + 12) 
                }
                return String(hours) 
              }
              else {
                // Add a zero so everything stays together
                if (hours < 10 ){ 
                  return "0" + String(hours)
                } 
                // return flat hour
                return String(hours)
              }
              return "00"
            }
            text: hoursText
          }
          // Minutes
          Text{
            id: minutes
            color: "white"
            font.pointSize: 20
            text: root.time[4].split(":")[1]
          }
        }
        // Set the timer process
        Process {
              id: dateProc
              command: ["date"]

              running: true

              stdout: StdioCollector {
                onStreamFinished: {
                  root.time = this.text.split(" ");
                }

              }
        }

        // Create a timer
        Timer {
          interval: 1000 // 1000ms = 1s

          running: true

          repeat: true

          onTriggered: dateProc.running = true
        }
}
