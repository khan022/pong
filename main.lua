function love.load()
    love.window.setTitle("Hello LÖVE")
    love.graphics.setNewFont(24)
end

function love.draw()
    love.graphics.printf("Welcome to LÖVE", 0, love.graphics.getHeight() / 2 , love.graphics.getWidth(), "center")
end