Object = require "classic"
require "autobatch"
json = require "json"
lume = require "lume"
log = require "log"


function roll(cardSet)
    pull=lume.weightedchoice({ [cardSet[1]]=5, [cardSet[2]]=45, [cardSet[3]]=50 })
end

function love.load()
    --loading the images for the cards
    SR=love.graphics.newImage('graves.jpg')
    R=love.graphics.newImage('vex.jpg')
    N=love.graphics.newImage('vexdawn.jpg')

    -- initially setting the cardset
    cardSet={"SR","R","N"}
    roll(cardSet)
end
function love.keypressed(key)
    if key == "space" then
        roll(cardSet)
    end
end
function love.update()  
    require("lovebird").update()
    print(pull)
end

function love.draw()
    love.graphics.draw(_G[pull],0,100) -- _G is the way to reference the table of all variable names, super handy
end

