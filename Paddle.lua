Paddle = Class{}

-- various functions to get the position for the paddle class and its object.

function Paddle:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dy = 0
end

function Paddle:update(dt)

    -- use math.max and math.min to clamp the paddle on the screen

    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)

    else
        self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)

    end
end

--[[ 
    render function to call in the love.draw in main file.
]]

function Paddle:render()
    
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

end