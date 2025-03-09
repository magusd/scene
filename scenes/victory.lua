local victory = {}

function victory.draw()
    love.graphics.print("Yay, you win!", 200, 300)
end

function victory.keypressed(key)
    if key == "return" or key == "space" or key == "escape" then
        victory._scene.set("menu")
    end
end

return victory
