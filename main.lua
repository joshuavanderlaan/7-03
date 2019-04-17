-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- april 17, 2019
--
-- by Joshua van der Laan
--
-- create a sprite tha has physics
--
-----------------------------------------------------------------------------------------

-- Gravity

local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 15 ) -- ( x, y )

local theGround = display.newImageRect( "/assets/sprites/landSquare.png", 300, 100)
theGround.x = display.contentCenterX
theGround.y = display.contentHeight
theGround.id = "the ground"
physics.addBody( theGround, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )
local theRightWall = display.newImageRect( "/assets/sprites/Wall.jpg", 100, 750)
theRightWall.x = display.contentCenterX + 175
theRightWall.y = display.contentHeight - 50
theRightWall.id = "the right wall"
physics.addBody( theRightWall, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )



local theCharacter = display.newImageRect( "/assets/sprites/character.png", 50, 125 )
theCharacter.x = display.contentCenterX
theCharacter.y = display.contentCenterY
theCharacter.id = "the character"
physics.addBody( theCharacter, "dynamic", { 

    density = 3.0, 

    friction = 0.5, 

    bounce = 0.3 

    } )



local dPad = display.newImage( "/assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 80
dPad.alpha = 0.50
dPad.id = "d-pad"



local upArrow = display.newImage( "/assets/sprites/upArrow.png" )
upArrow.x = 150
upArrow.y = display.contentHeight - 190
upArrow.id = "up arrow"

local downArrow = display.newImage( "/assets/sprites/downArrow.png" )
downArrow.x = 150
downArrow.y = display.contentHeight + 28
downArrow.id = "down arrow"

local leftArrow = display.newImage( "/assets/sprites/leftArrow.png" )
leftArrow.x = 40
leftArrow.y = display.contentHeight - 80
leftArrow.id = "left arrow"

local rightArrow = display.newImage( "/assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 80
rightArrow.id = "right arrow"

 

function upArrow:touch( event )

    if ( event.phase == "ended" ) then

        -- move the character up

        transition.moveBy( theCharacter, { 

            x = 0, -- move 0 in the x direction 

            y = -20, -- move up 50 pixels

            time = 100 -- move in a 1/10 of a second

            } )

    end
    return true
end



function downArrow:touch( event )

    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 

            x = 0, -- move 0 in the x direction 

            y = 20, -- move up 50 pixels

            time = 100 -- move in a 1/10 of a second

            } )

    end
    return true
end



function leftArrow:touch( event )

    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 

            x = -20, -- move 0 in the x direction 

            y = 0, -- move up 50 pixels

            time = 100 -- move in a 1/10 of a second

            } )

    end
    return true
end



function rightArrow:touch( event )

    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 

            x = 20, -- move 0 in the x direction 

            y = 0, -- move up 50 pixels

            time = 100 -- move in a 1/10 of a second

            } )

    end
    return true
end

upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
leftArrow:addEventListener( "touch", leftArrow )
rightArrow:addEventListener( "touch", rightArrow )