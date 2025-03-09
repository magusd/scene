local menu = {}

local options = {}
local scenes = {}
local selected = 1

function menu.load()
    print("load")
    scenes["Start"] = "game"
    scenes["Config"] = "settings"
    scenes["Credits :)"] = "credits"
    scenes["Quit"] = "quit"

    options = { "Start", "Config", "Credits :)", "Quit" }
end

function menu.keypressed(key)
    if key == "up" and selected > 1 then
        selected = selected - 1
    end
    if key == "down" and selected < #options then
        selected = selected + 1
    end
    if key == "return" or key == "space" then
        menu._scene.set(scenes[options[selected]])
    end
end

function menu.draw()
    for i, menu in ipairs(options) do
        love.graphics.print(menu, 350, i * 100 + 100)
        if menu == options[selected] then
            love.graphics.rectangle("line", 350, i * 100 + 100, 100, 20)
        end
    end
end

return menu
