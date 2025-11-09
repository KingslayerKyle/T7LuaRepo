require( "ui.uieditor.widgets.CPLevels.Prologue.RandomFaces" )

local PostLoadFunc = function ( self, controller )
	local facesTable = {
		self.RandomFaces0,
		self.RandomFaces1,
		self.RandomFaces2,
		self.RandomFaces3
	}
	local updateFace = function ( faceElement, alpha, eventName )
		faceElement:setAlpha( alpha )
		faceElement:processEvent( {
			name = eventName
		} )
	end
	
	local updateAllFaces = function ( facesTable, numFaces, stateIndex )
		local stateName = nil
		if stateIndex == 0 then
			stateName = "scan_reset"
		elseif stateIndex == 1 then
			stateName = "scan_start"
		elseif stateIndex == 2 then
			stateName = "match_not_found"
		end
		if stateIndex == 3 then
			local foundIndex = math.random( 1, numFaces )
			for index = 1, numFaces, 1 do
				if foundIndex == index then
					facesTable[index]:processEvent( {
						name = "match_found"
					} )
				else
					facesTable[index]:processEvent( {
						name = "match_not_found"
					} )
				end
			end
		else
			for index = 1, numFaces, 1 do
				if stateName ~= "" then
					updateFace( facesTable[index], stateIndex, stateName )
				end
			end
		end
	end
	
	self.RandomFaces0:linkToElementModel( self, "scanStart1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			updateAllFaces( facesTable, 1, modelValue )
		end
	end )
	self.RandomFaces0:linkToElementModel( self, "scanStart2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			updateAllFaces( facesTable, 2, modelValue )
		end
	end )
	self.RandomFaces0:linkToElementModel( self, "scanStart3", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			updateAllFaces( facesTable, 3, modelValue )
		end
	end )
	self.RandomFaces0:linkToElementModel( self, "scanStart4", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			updateAllFaces( facesTable, 4, modelValue )
		end
	end )
end

LUI.createMenu.SecurityCamera = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SecurityCamera" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local RandomFaces0 = CoD.RandomFaces.new( self, controller )
	RandomFaces0:setLeftRight( true, false, 1016, 1216 )
	RandomFaces0:setTopBottom( true, false, 234, 297 )
	RandomFaces0:setRGB( 1, 1, 1 )
	RandomFaces0:setAlpha( 0 )
	self:addElement( RandomFaces0 )
	self.RandomFaces0 = RandomFaces0
	
	local RandomFaces1 = CoD.RandomFaces.new( self, controller )
	RandomFaces1:setLeftRight( true, false, 1016, 1216 )
	RandomFaces1:setTopBottom( true, false, 297, 360 )
	RandomFaces1:setRGB( 1, 1, 1 )
	RandomFaces1:setAlpha( 0 )
	self:addElement( RandomFaces1 )
	self.RandomFaces1 = RandomFaces1
	
	local RandomFaces2 = CoD.RandomFaces.new( self, controller )
	RandomFaces2:setLeftRight( true, false, 1016, 1216 )
	RandomFaces2:setTopBottom( true, false, 360, 423 )
	RandomFaces2:setRGB( 1, 1, 1 )
	RandomFaces2:setAlpha( 0 )
	self:addElement( RandomFaces2 )
	self.RandomFaces2 = RandomFaces2
	
	local RandomFaces3 = CoD.RandomFaces.new( self, controller )
	RandomFaces3:setLeftRight( true, false, 1016, 1216 )
	RandomFaces3:setTopBottom( true, false, 423, 486 )
	RandomFaces3:setRGB( 1, 1, 1 )
	RandomFaces3:setAlpha( 0 )
	self:addElement( RandomFaces3 )
	self.RandomFaces3 = RandomFaces3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				RandomFaces0:completeAnimation()
				self.RandomFaces0:setAlpha( 0 )
				self.clipFinished( RandomFaces0, {} )
				RandomFaces1:completeAnimation()
				self.RandomFaces1:setAlpha( 0 )
				self.clipFinished( RandomFaces1, {} )
				RandomFaces2:completeAnimation()
				self.RandomFaces2:setAlpha( 0 )
				self.clipFinished( RandomFaces2, {} )
				RandomFaces3:completeAnimation()
				self.RandomFaces3:setAlpha( 0 )
				self.clipFinished( RandomFaces3, {} )
			end,
			Show1 = function ()
				self:setupElementClipCounter( 1 )
				RandomFaces0:completeAnimation()
				self.RandomFaces0:setAlpha( 1 )
				self.clipFinished( RandomFaces0, {} )
			end,
			Show2 = function ()
				self:setupElementClipCounter( 2 )
				RandomFaces0:completeAnimation()
				self.RandomFaces0:setAlpha( 1 )
				self.clipFinished( RandomFaces0, {} )
				RandomFaces1:completeAnimation()
				self.RandomFaces1:setAlpha( 1 )
				self.clipFinished( RandomFaces1, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.RandomFaces0:close()
		self.RandomFaces1:close()
		self.RandomFaces2:close()
		self.RandomFaces3:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

