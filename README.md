# Love Scene

Dead simple library to manage scenes in your game.

## Installation

1. Copy [scene.lua](./scene.lua) to your project.
2. Use the main.lua from this repo, see code below

```lua
local scene = require "scene"

function love.load()
    scene.set("splash")
end

```

## Making a scene

Scenes live under the `scenes` folder by default. Each scene is a lua file that must return a table with any of the [love2d callbacks](https://www.love2d.org/wiki/Category:Callbacks).

```lua
local splash = {}

function splash.draw() -- instead of love.draw, use your scene name
    love.graphics.print("Yay, you win!", 200, 300)
end

return splash

```

## Changing scenes 

Scene injects itself into every scene for your convenience.

To change scenes, use the `<currentScene>.scene.set` function. `<currentScene>` is the name of the current scene, for example, if you are in the splash scene, you can change to the menu scene with `splash._scene.set("menu")`.

Example:

```lua
function splash.keypressed(key)
    if key == "return" or key == "space" or key == "escape" then
        splash._scene.set("menu")
    end
end
```


## More advanced topics

### Loading
Every time you change scenes, we will call `_unload` on the current scene and `load` on the new scene.

So if you are experiencing bugs, try moving your code to the `load` function.

### Unloading

By default, if a scene has the `_unload` function, it will be called when that scene is changed.

Scenes are just tables that get hooked to love2d callbacks, so if you have special resources that need to be stopped, like a thread or a timer, you can stop them in the `_unload` function.
