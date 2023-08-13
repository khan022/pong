--[[
    enter push library
]]

--print(package.path)


push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- paddle speed how the paddle moves

PADDLE_SPEED = 200

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

    -- changing the font to our chosen font
    smallFont = love.graphics.newFont('font.ttf', 8)

    -- getting the score font
    scoreFont = love.graphics.newFont('font.ttf', 32)

    love.graphics.setFont(smallFont)


    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    -- initializing scores
    player1Score = 0
    player2Score = 0

    -- paddle position changing. those moves up and down
    player1Y = 30
    player2Y = VIRTUAL_HEIGHT - 50

end


--[[ 
    updating the paddle position with dt time in love2d engine.
]]

function love.update(dt)
    -- player 1 movement
    if love.keyboard.isDown('w') then
        -- add negative paddle_speed to current y scaled by deltatime
        player1Y = player1Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') then
        -- add positive paddle_speed to current y scaled by deltatime
        player1Y = player1Y + PADDLE_SPEED * dt
    end

    -- player 2 movement
    if love.keyboard.isDown('up') then
        -- add negative paddle_speed to current y scaled by deltatime
        player2Y = player2Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('down') then
        -- add positive paddle_speed to current y scaled by deltatime
        player2Y = player2Y + PADDLE_SPEED * dt
    end
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

    -- clear the screen with a specific color
    love.graphics.clear(40/255, 45/255, 52/255, 50/255)
    
    -- love.graphics.printf('Hello Pong!!!', 0, VIRTUAL_HEIGHT/2 - 6, VIRTUAL_WIDTH, 'center') 
    -- version 0.0

    love.graphics.setFont(smallFont)
    love.graphics.printf('Hello Pong!!!', 0, 20, VIRTUAL_WIDTH, 'center')
    -- version 0.2

    -- rendering the scores in the left and right centers 

    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)

    -- render the left paddle
    -- love.graphics.rectangle('fill', 10, 30, 5, 20) version 0.2
    love.graphics.rectangle('fill', 10, player1Y, 5, 20)

    -- render the right paddle
    -- love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, player2Y, 5, 20)

    -- render the ball at center
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    -- end rendering at virtual resolution
    push:apply('end')
    
end