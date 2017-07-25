TuringMachine = Core.class()

function TuringMachine:init(states, moveFunctions, initialTape)
	self.q = states or {} 
	self.delta = moveFunctions or {}
	self.tape = initialTape or {" ", " "}
	self.currentState = self.q[1] or 0
	self.history = {
		{self.tape,
		self.currentState}
	}
	self.historyStep = #self.history
end

function TuringMachine:nextStep()
	for index, d in pairs(self.delta) do
		if d[1] == self.currentState and d[2] == self:readTape() then
			self:addToHistory()
			self.currentState = d[3]
			self:writeTape(d[4])
			if d[5] == "L" then
				self:moveLeft()
			else
				self:moveRight()
			end
			return true
		end
	end
	return false
end

function TuringMachine:thereIsNext()
	for index,transition in pairs(self.delta) do
		if transition[1] == self.currentState and transition[2] == self:readTape() then
			return true
		end
	end
	return false
end

function TuringMachine:readTape()
	return self.tape[2]:sub(1,1)
end

function TuringMachine:writeTape(charToWrite)
	if #self.tape[2] == 1 and charToWrite == " " then
		self.tape[2] = " "
	else
		self.tape[2] = charToWrite .. self.tape[2]:sub(2)
	end
end

function TuringMachine:moveLeft()
	charMoving = self.tape[1]:sub(-1)
	if #self.tape[1] == 1 then
		self.tape[1] = " "
	else
		self.tape[1] = self.tape[1]:sub(1,-2)
	end
	if #self.tape[2] == 1 and charMoving == " " then
		self.tape[2] = " "
	else
		self.tape[2] = charMoving .. self.tape[2]
	end
end

function TuringMachine:moveRight()
	charMoving = self.tape[2]:sub(1,1)
	if #self.tape[2] == 1 then
		self.tape[2] = " "
	else
		self.tape[2] = self.tape[2]:sub(2)
	end
	if #self.tape[1] == 1 and charMoving == " " then
		self.tape[1] = " "
	else
		self.tape[1] = self.tape[1] .. charMoving
	end
end

function TuringMachine:addToHistory()
	self.historyStep = self.historyStep + 1
	self.history[self.historyStep] = {
				self.tape,
				self.currentState
			}
end

function TuringMachine:prevHistory()
	if(self.historyStep > 1) then
		self.historyStep = self.historyStep - 1
	end
	self.tape = self.history[self.historyStep][1]
	self.currentState = self.history[self.historyStep][2]
end

function TuringMachine:nextHistory()
	if(self.historyStep < #self.history) then
		self.historyStep = self.historyStep + 1
	end
	self.tape = self.history[self.historyStep][1]
	self.currentState = self.history[self.historyStep][2]
end

function TuringMachine:debugTape()
	print("CurrentState = " .. self.currentState)
	print("History", "Step = " .. self.historyStep)
	for index, value in ipairs(self.history) do
		print("Tape: " .. value[1][1] .. " " .. value[1][2])
		print("State: " .. value[2])
	end
	print(self.tape[1] .. "[C]" .. self.tape[2])
end