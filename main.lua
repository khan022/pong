--[[
    enter push library
]]

--print(package.path)


push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

--[[
    run only at the startup once. to initialize the game.
]]

function love.load()
    -- love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
    --     fullscreen = false,
    --     resizable = false,
    --     vsync = true
    -- }) basic window render version 0.0

    -- Filter changing to nearest

    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end


--[[
    Keyboard handling. calling love2d in each frame.
]]

function love.keypressed(key)
    --keys can be accessed by string name
    if key == 'escape' then
        --funtion to terminate the application
        love.event.quit()
    end
end

--[[
    called after update by love2d, used to draw anything on the screen or update it.
]]

function love.draw()
    -- begin rendering at virtual resolution
    push:apply('start')

    love.graphics.printf('Hello Pong!!!', 0, VIRTUAL_HEIGHT/2 - 6, VIRTUAL_WIDTH, 'center') 
    -- version 0.0

    -- end rendering at virtual resolution
    push:apply('end')
end