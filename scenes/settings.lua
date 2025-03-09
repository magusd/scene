local settings = {}

function settings.draw()
    love.graphics.print("The settings scene", 200, 300)
end

function settings.keypressed(key)
    if key == "return" or key == "space" or key == "escape" then
        settings._scene.set("menu")
    end
end

return settings
