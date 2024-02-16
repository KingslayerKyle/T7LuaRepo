local f0_local0 = Rat
f0_local0.PrintElement = {}
f0_local0 = function ( self, curDepth, depth, indentString )
	local id = "Element"
	if self.id ~= nil then
		id = self.id
	end
	local nameText = "[" .. id .. "]"
	if self.name ~= nil then
		nameText = nameText .. " name='" .. self.name .. "'"
	end
	if self.debugName ~= nil then
		nameText = nameText .. " debugName='" .. self.debugName .. "'"
	end
	local itemText = self:getTextFromC()
	if itemText ~= nil then
		nameText = nameText .. " text='" .. itemText .. "'"
	end
	local materialName = self:getImageName()
	if materialName ~= "" and materialName ~= "white" then
		nameText = nameText .. " mat='" .. materialName .. "'"
	end
	if self:isInFocus() then
		nameText = nameText .. " FOCUS"
	end
	if self.m_inputDisabled then
		nameText = nameText .. " DISABLED"
	end
	if self:isFocusable() then
		nameText = nameText .. " FOCUSABLE"
	end
	if self.isUIList ~= nil then
		nameText = nameText .. " UIList"
	end
	if self.isGridLayout ~= nil then
		nameText = nameText .. " GridLayout"
	end
	if self.navigation ~= nil then
		nameText = nameText .. " nav="
		for nav, navItem in pairs( self.navigation ) do
			local f1_local3 = type( navItem )
			if f1_local3 == "table" or f1_local3 == "userdata" and navItem.id ~= nil then
				f1_local3 = REG12.id
			end
			if f1_local3 == nil then
				f1_local3 = "no id!"
			end
			nameText = nameText .. REG11 .. ":" .. f1_local3 .. ", "
		end
		nameText = nameText .. " "
	end
	DebugPrint( indentString .. nameText )
	local nextIndentString = indentString .. "	"
	local nextDepth = curDepth + 1
	if nextDepth < depth then
		local child = self:getFirstChild()
		if child ~= nil then
			DebugPrint( indentString .. "{" )
			while child do
				f0_local0( child, nextDepth, depth, nextIndentString )
				child = child:getNextSibling()
			end
			DebugPrint( indentString .. "}" )
		end
	end
end

Rat.PrintElement.PrintRoot = function ( rootName, _depth )
	local rootName = rootName
	local printAvailableRoots = false
	local depth = 3
	if _depth ~= nil then
		depth = _depth
	end
	if rootName == nil then
		printAvailableRoots = true
	elseif LUI.roots[rootName] == nil then
		DebugPrint( "Invalid Root " .. rootName )
		printAvailableRoots = true
	else
		DebugPrint( "Printing Root " .. rootName )
		f0_local0( LUI.roots[rootName], 0, depth, "" )
		if LUI.roots[rootName].flowManager ~= nil then
			LUI.roots[rootName].flowManager:printStack()
		end
	end
	if printAvailableRoots then
		DebugPrint( "Roots:" )
		for index, root in pairs( LUI.roots ) do
			DebugPrint( index )
		end
		DebugPrint( "" )
	end
end

