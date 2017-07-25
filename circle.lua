-- Circle class
Circle = Core.class(Path2D)

function Circle:init(positionX, positionY, radius)
    self.x = positionX
    self.y = positionY
    self.radius = radius
    self:setSvgPath("M", positionX, positionY, "m", -1*radius, 0, "a", radius, radius, 0, 1, 0, 2*radius, 0, "a", radius, radius, 0, 1, 0, -2*radius, 0,"z")
end
