pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Io

Singleton{
  id: root

  property var date: ""

  property string day: findDay(date) 

  property string hours: findHours(date)
  property string minutes: findMinutes(date)



  function findHours(date): string{
    if (date)  {
      var hours = parseInt(date[3])
      var military = date[4]
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
      }   return String(hours)
      return "00"
    }
    else {
      ""
    }
  }

  function findMinutes(date): string{

    return date[3].split(":")[1]
  }

  function findDay(date){
    // Handle abreviated date
    switch ( date[0]){
      case "Mon":
        return "Monday";
      case "Tue":
        return "Tuesday";
      case "Wed":
        return "Wednesday";
      case "Thu":
        return "Thursday";
      case "Fri":
        return "Friday";
      case "Sat":
        return "Saturday";
      case "Sun" :
        return "Sunday";
      default:
        return "Monday";
    }
  }


  // Command to read the command's output
  Process {
        id: dateProc
        command: ["date"]

        running: true

        stdout: StdioCollector {
          onStreamFinished: {
            root.date = this.text.split(" ");
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
