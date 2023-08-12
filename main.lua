WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

--[[
    run only at the startup once. to initialize the game.
]]

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

--[[
    called after update by love2d, used to draw anything on the screen or update it.
]]

function love.draw()
    love.graphics.printf(
        'Hello Pong!!!', 
        0, 
        WINDOW_HEIGHT/2 - 6, 
        WINDOW_WIDTH, 
        'center')
end