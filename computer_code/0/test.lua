
os.loadAPI("potato_counter")

turtle.turnLeft()
for slot = 2, 16, 1 do
    turtle.select(slot)
    potato_counter.add(turtle.getItemCount(slot))
    turtle.drop()
end
turtle.turnRight()
term.clear()
print("Total farmed by sparkle: " .. potato_counter.get())



turtle.turnLeft()
for slot = 2, 16, 1 do
    turtle.select(slot)
    potato_counter.add(turtle.getItemCount(slot))
    turtle.drop()
end
turtle.turnRight()
term.clear()
print("Total farmed by sparkle: " .. potato_counter.get())
