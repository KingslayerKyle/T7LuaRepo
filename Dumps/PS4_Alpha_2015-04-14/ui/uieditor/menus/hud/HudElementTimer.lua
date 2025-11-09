local UpdateTimer = function ( self )
	self.Timer:setupEndTimer( self.time )
end

local UpdatePosition = function ( self )
	if self.x and self.y and self.height then
		self.Timer:setLeftRight( true, false, self.x, self.x + 100 )
		self.Timer:setTopBottom( true, false, self.y, self.y + self.height )
	end
end

local UpdateColor = function ( self )
	if self.red and self.green and self.blue then
		self:setRGB( self.red, self.green, self.blue )
	end
end

local PostLoadFunc = function ( self )
	local xModel = self:getModel( Engine.GetPrimaryController(), "x" )
	local yModel = self:getModel( Engine.GetPrimaryController(), "y" )
	local heightModel = self:getModel( Engine.GetPrimaryController(), "height" )
	local timeModel = self:getModel( Engine.GetPrimaryController(), "time" )
	local redModel = self:getModel( Engine.GetPrimaryController(), "red" )
	local greenModel = self:getModel( Engine.GetPrimaryController(), "green" )
	local blueModel = self:getModel( Engine.GetPrimaryController(), "blue" )
	self.red = 1
	self.green = 1
	self.blue = 1
	if xModel then
		self:subscribeToModel( xModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.x = modelValue
				UpdatePosition( self )
			end
		end )
	end
	if yModel then
		self:subscribeToModel( yModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.y = modelValue
				UpdatePosition( self )
			end
		end )
	end
	if heightModel then
		self:subscribeToModel( heightModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.height = modelValue
				UpdatePosition( self )
			end
		end )
	end
	if timeModel then
		self:subscribeToModel( timeModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.time = modelValue
				UpdateTimer( self )
			end
		end )
	end
	if redModel then
		self:subscribeToModel( redModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.red = modelValue
				UpdateColor( self )
			end
		end )
	end
	if greenModel then
		self:subscribeToModel( greenModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.green = modelValue
				UpdateColor( self )
			end
		end )
	end
	if blueModel then
		self:subscribeToModel( blueModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.blue = modelValue
				UpdateColor( self )
			end
		end )
	end
end

LUI.createMenu.HudElementTimer = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "HudElementTimer" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Timer = LUI.UITightText.new()
	Timer:setLeftRight( true, false, 317.45, 371.45 )
	Timer:setTopBottom( true, false, 324.11, 349.11 )
	Timer:setTTF( "fonts/default.ttf" )
	self:addElement( Timer )
	self.Timer = Timer
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

