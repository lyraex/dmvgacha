function tenroll(cardSet)
    probabilityTable={}
    for i, rarity in ipairs(cardSet[1]) do
        probability = cardSet[2][i]
        for k=1, probability do
            table.insert(probabilityTable, rarity) -- Build the probability table (100 elements, one per percent)
        end
    end
    for i=1,2 do
        pulls={}
        table.insert(pulls, #probabilityTable) -- get a random element from available pulls and adds it to pulls list
    end
end

function love.load()
    cardSet = {{"SR","R","N"},
        {5, 50, 45}
    }
    
    tenroll(cardSet)
end
function love.draw()
    love.graphics.print(pulls,0,100)
end

