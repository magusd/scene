local gameOver = {}

function gameOver.draw()
    love.graphics.print("Game Over", 200, 300)
    love.graphics.print("RIPBOZO", 200, 400)
end

function gameOver.keypressed(key)
    if key == "return" or key == "space" or key == "escape" then
        gameOver._scene.set("menu")
    end
end

return gameOver
