Edge = Core.class()

function Edge:init(node1, node2)
	self.node1 = node1
	self.node2 = node2
	self.property = {}
end

function Edge:addProperty(property)
	self.property = property
end