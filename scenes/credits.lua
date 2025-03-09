local credtis = {}

function credtis.draw()
    love.graphics.print("The credits scene", 200, 300)
end

function credtis.keypressed(key)
    if key == "return" or key == "space" or key == "escape" then
        credtis._scene.set("menu")
    end
end

return credtis
