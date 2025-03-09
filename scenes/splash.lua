local splash = {}
local now = nil
local seconds = 3 -- seconds to show the splash screen

function splash.load()
    now = love.timer.getTime()
end

function splash.update(dt)
    if love.timer.getTime() - now > seconds then
        splash._scene.set("menu")
    end
end

function splash.draw()
    love.graphics.circle("fill", 200, 200, 50)
end

function splash.keypressed(key)
    -- skip splash
    splash._scene.set("menu")
end

return splash
