Ball = Class{}


function Ball:init(x, y, width, height)
    
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    -- these variables keep track of the velocity of the ball in x, y axises.
    self.dy = math.random(2) == 1 and -100 or 100
    self.dx = math.random(-50, 50)

end


--[[
    check wheather the ball and paddles are coliding or not
]]

function Ball:collides(paddle)
    -- first check that if the left edge of either is farther to the right than the right edge to the other
    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end

    -- then check the bottom edge of either is higher than the bottom edge of the other
    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end

    -- if any of these two conditions are not true, then they are overlapping
    return true

end

--[[
    places the ball in the middle of the screen.
]]

function Ball:reset()

    self.x = VIRTUAL_WIDTH / 2 - 2
    self.y = VIRTUAL_HEIGHT / 2 - 2
    self.dy = math.random(2) == 1 and -100 or 100
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