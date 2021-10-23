function roll(cardSet)
    pulls=0
    probabilityTable={}
    for i, rarity in ipairs(cardSet[1]) do
        probability = cardSet[2][i]
        for k=1, probability do
            table.insert(probabilityTable, rarity) -- Build the probability table (100 elements, one per percent)
        end
    end
    pull={}
    math.randomseed(os.time()) -- set a random seed for math.random, math.random produces the same value over and over if you don't
    table.insert(pull, probabilityTable[math.random(#probabilityTable)]) -- get a random element from available pulls and adds it to pulls list
    
end

function love.load()
    --loading the images for the cards
    SR=love.graphics.newImage('graves.jpg')
    R=love.graphics.newImage('vex.jpg')
    N=love.graphics.newImage('vexdawn.jpg')

    --setting the cardset
    cardSet = {{"SR","R","N"},
        {5, 50, 45}
    }
    roll(cardSet)
end
function love.keypressed(key)
    if key == "space" then
        roll(cardSet)
    end
end
function love.update()
    

end

function love.draw()
    love.graphics.draw(_G[pull[1]],0,100) -- _G is the way to reference the table of all variable names, super handy
end

