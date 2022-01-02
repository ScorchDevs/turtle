x_max = 4
z_max = 4
y_max = 62

slots = 16


function refuel()
    print("TRYING TO REFUEL")
    for i = 1, slots, 1 do
        turtle.select(i)
        turtle.refuel()
    end
    print("New fuel level: " .. turtle.getFuelLevel())
end

function goBack(amount)
    for i = 1, amount, 1 do
        turtle.back()
    end
end

function digUntilClear()
    while (turtle.detect()) do
        turtle.dig()
    end
end

for y = 1, y_max - 1, 1 do
    print("Fuel level: " .. turtle.getFuelLevel())
    turtle.digDown()
    turtle.down()
    for x = 1, x_max, 1 do
        turtle.turnRight()
        digUntilClear()
        turtle.forward()
        turtle.turnLeft()
        for z = 1, z_max - 1, 1 do
            digUntilClear()
            turtle.forward()
            while (turtle.getFuelLevel() < 10) do
                refuel()
            end
        end
        goBack(z_max - 1)
    end
    turtle.turnRight()
    goBack(x_max)
    turtle.turnLeft()
end
for y = 1, y_max, 1 do
    turtle.up()
end