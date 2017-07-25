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

function Digraph:debugGraph()
	table.foreach(self.nodes, function(k,v) print("Node " .. k) end)
	table.foreach(self.edges, function(k,v) print("Edge " .. k .. " Nodes: " .. v.node1.number .. " " .. v.node2.number) end)
end