Node = Core.class()

function Node:init(number)
	self.number = number
	self.edges = {}
end

function Node:addEdge(edge)
	table.insert(self.edges, edge)
end