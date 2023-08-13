Ball = Class{}


function Ball:init(x, y, width, height)
    
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    -- these variables keep track of the velocity of the ball in x, y axises.
    self.dy = math.random(2) == 1 and 100 or -100
    self.dx = math.random(-50, 50)

end

--[[
    places the ball in the middle of the screen.
]]

function Ball:reset()

    self.x = VIRTUAL_WIDTH / 2 - 2
    self.y = VIRTUAL_HEIGHT / 2 - 2
    self.dy = math.random(2) == 1 and 100 or -100
    self.dx = math.random(-50, 50)

end

--[[
    apply velocity to the position of the ball.
]]

function Ball:update(dt)

    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

end

function Ball:render()

    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

end