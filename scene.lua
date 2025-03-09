--
-- scene
--
-- To upgrade/restore run:
-- curl -O https://raw.githubusercontent.com/magusd/scene/refs/heads/main/scene.lua
--
-- Example main.lua
-- local scene = require "scene"
--
-- function love.load()
--     scene.set("splash")
-- end

local scene = {}
local callbacks = {
    "audiodisconnected",
    "directorydropped",
    "displayrotated",
    "draw",
    "errhand",
    "errorhandler",
    "filedropped",
    "focus",
    "gamepadaxis",
    "gamepadpressed",
    "gamepadreleased",
    "joystickadded",
    "joystickaxis",
    "joystickhat",
    "joystickpressed",
    "joystickreleased",
    "joystickremoved",
    "joysticksensorupdated",
    "keypressed",
    "keyreleased",
    "load",
    "localechanged",
    "lowmemory",
    "mousefocus",
    "mousemoved",
    "mousepressed",
    "mousereleased",
    "quit",
    "resize",
    "run",
    "sensorupdated",
    "textedited",
    "textinput",
    "threaderror",
    "touchmoved",
    "touchpressed",
    "touchreleased",
    "update",
    "visible",
    "wheelmoved",
}


scene.current = nil

scene.scenesFolder = "scenes"

function scene.set(name)
    -- if a scene is loaded, unload it
    if scene.current ~= nil and scene.current._unload ~= nil and type(scene.current._unload) == "function" then
        scene.current._unload()
    end

    local path = scene.scenesFolder .. "/" .. name .. ".lua"
    local newScene = love.filesystem.load(path)
    if not newScene then
        print("scene not found, attempted to load: " .. path)
    end
    scene.current = newScene()
    if scene.current.load ~= nil then
        print("load", name)
        scene.current.load()
    end

    scene.current._scene = scene -- very important line, let's you change scenes from other scenes
    for i, callback in ipairs(callbacks) do
        if scene.current[callback] ~= nil and scene.current[callback] then
            love[callback] = scene.current[callback]
        else
            love[callback] = nil
        end
    end
end

return scene
