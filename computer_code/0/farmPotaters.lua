size_x = 9
size_y = 9

os.loadAPI("potato_counter")
os.loadAPI("global_vals")
wait_time = 5

print("starting!")
while turtle.getFuelLevel() > 150 do
    global_vals.store("last_farmed", os.day())
    turtle.select(1)
    for x = 1, size_x, 1 do
        for y = 1, size_y, 1 do
            turtle.forward()
            turtle.digDown()
            turtle.digDown()
        end
        for y = 1, size_x, 1 do
            turtle.placeDown()
            turtle.back()
        end
        turtle.turnRight()
        turtle.forward()
        turtle.turnLeft()
    end
    turtle.turnLeft()
    for i = 1, size_x, 1 do
        turtle.forward()
    end
    for slot = 2, 16, 1 do
        turtle.select(slot)
        potato_counter.add(turtle.getItemCount(slot))
        turtle.drop()
    end
    turtle.turnRight()
    while os.day() - global_vals.getValue("last_farmed") < wait_time do
        term.clear()
        print("Total farmed by sparkle: " .. potato_counter.get())
        print("Days since last farm: " .. os.day() - global_vals.getValue("last_farmed") .. "/" .. wait_time)
        os.sleep(5)
    end
end
print("OUT OF FUEL. FEED ME BITCH")
