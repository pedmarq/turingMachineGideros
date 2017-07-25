--Arrow tip shape
local arrow="M100,70L130,100L100,100M130,100L130,70"
local a=Path2D.new()
a:setSvgPath("M",100,70,"L",130,100,"L",100,100,"M",130,100,"L",130,70)
a:setLineThickness(3)
a:setLineColor(0x404000)
stage:addChild(a)

local circle = Circle.new(300, 300, 100)
circle:setLineThickness(5) -- Outline width
circle:setFillColor(0xFFFF80,0.7) --Fill color
circle:setLineColor(0x404000) --Line color
stage:addChild(circle)

local digraph = Digraph.new(5)
digraph:addEdge(digraph.nodes[1], digraph.nodes[2])
digraph:addEdge(digraph.nodes[1], digraph.nodes[3])
digraph:addEdge(digraph.nodes[2], digraph.nodes[3])
digraph:addEdge(digraph.nodes[2], digraph.nodes[5])
digraph:addEdge(digraph.nodes[3], digraph.nodes[4])
digraph:addEdge(digraph.nodes[4], digraph.nodes[5])
digraph:debugGraph()

local states = {1, 2, 3, 4} 
local transitions = { 
			{1, "1", 2, "0", "L"},
			{1, "0", 1, "1", "R"}
		} 

local tm = TuringMachine.new(states, transitions, {" 011", "001 "})
tm:debugTape()
if tm:nextStep() then
	print(true)
else
	print(false)
end
tm:debugTape()
if tm:nextStep() then
	print(true)
else
	print(false)
end
tm:debugTape()
if tm:nextStep() then
	print(true)
else
	print(false)
end
tm:debugTape()
if tm:nextStep() then
	print(true)
else
	print(false)
end
tm:debugTape()
tm:prevHistory()
tm:debugTape()
tm:prevHistory()
tm:debugTape()
tm:prevHistory()
tm:debugTape()
