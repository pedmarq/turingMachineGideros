Digraph = Core.class()

function Digraph:init(nNodes)
	self.nNodes = nNodes
	self.nodes = {}
	self.edges = {}
	for i=1, nNodes do
		self.nodes[i] = Node.new(i)
	end	
end

function Digraph:addEdge(node1, node2)
	local newEdge = Edge.new(node1, node2)
	table.insert(self.edges, newEdge)
	node1:addEdge(newEdge)
	node2:addEdge(newEdge)
end

function Digraph:fillEdges(transitions)
	for index, d in ipairs(transitions) do
		self:addEdge(self.nodes[d[1]], self.nodes[d[3]])
		self.edges[#self.edges]:addProperty({d[2], d[4], d[5]})
	end
end

function Digraph:debugGraph()
	table.foreach(self.nodes, function(k,v) print("Node " .. k) end)
	table.foreach(self.edges, function(k,v) 
			print("Edge " .. k .. 
			" States: " .. v.node1.number .. " to " .. v.node2.number,
			"Reads " .. v.property[1] .. " Writes " .. v.property[2] .. " Goes " .. v.property[3])
		end)
end