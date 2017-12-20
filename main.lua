local firebasePerformance = require "plugin.firebasePerformance"
firebasePerformance.init()

local widget = require("widget")

local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( 1,.5,0 )

local title = display.newText( {text = "Firebase Performance", fontSize = 20} )
title.width, title.height = 300, 168
title.x, title.y = display.contentCenterX, 168*.5
title:setFillColor(1,0,0)


local stopTrace
stopTrace = widget.newButton( {
  x = display.contentCenterX,
  y = display.contentCenterY-100,
  id = "stopTraceButton",
  labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
  label = "Stop Trace",
  onEvent = function ( e )
    if (e.phase == "ended") then
        firebasePerformance.stopTrace("test trace")
        print("trace stopped")
    end
  end
} )
local newTraceButton
newTraceButton = widget.newButton( {
  x = display.contentCenterX,
  y = display.contentCenterY,
  id = "newTraceButton",
  labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
  label = "New Trace",
  onEvent = function ( e )
    if (e.phase == "ended") then
        if (firebasePerformance.doesTraceExist("test trace") == true)then
            firebasePerformance.stopTrace("test trace")
            trace= nil
            print("trace stopped")
        end
        firebasePerformance.createTrace("test trace")
      print("trace started")
    end
  end
} )

local networkRequest
networkRequest = widget.newButton( {
    x = display.contentCenterX,
    y = display.contentCenterY+100,
    id = "networkRequest",
    labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
    label = "Network Request",
    onEvent = function ( e )
        if (e.phase == "ended") then
            network.request( "https://google.com", "GET", function (  )
        
            end )
        end
    end
} )
