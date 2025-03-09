local game = {}

function game.draw()
    love.graphics.print("Press X to win, any other key to lose.", 200, 300)
end

function game.keypressed(key)
    if key == "x" then
        game._scene.set("victory")
    else
        game._scene.set("game_over")
    end
end

return game
