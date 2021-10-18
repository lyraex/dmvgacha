function tenroll(cardSet)
    probabilityTable={}
    for i, rarity in ipairs(cardSet[1]) do
        for j, probability in ipairs(cardSet[2]) do
            for i=1,probability*100 do
                table.insert(probabilityTable, rarity) -- Build the probability table (100 elements, one per percent)
            end
        end
    end
    for i=1,10 do
        pulls={}
        table.insert(pulls, probabilityTable[math.random(#probabilityTable)]) -- get a random element from available pulls and adds it to pulls list
    end
end

function love.load()
    cardSet = {{"SR","R","N"},
        {0.05, 0.5, 0.45}
    }
    
    tenroll(cardSet)
end
function love.draw()
    love.graphics.print(pulls,100,100)
end

