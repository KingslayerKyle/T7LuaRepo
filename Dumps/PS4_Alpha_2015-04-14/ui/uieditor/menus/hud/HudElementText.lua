local UpdatePosition = function ( self )
	if self.x and self.y and self.width and self.height then
		self.Text:setLeftRight( true, false, self.x, self.x + self.width )
		self.Text:setTopBottom( true, false, self.y, self.y + self.height )
	end
end

local UpdateAlpha = function ( self )
	if self.alpha then
		self.Text:setAlpha( self.alpha )
	end
end

local UpdateText = function ( self )
	if self.text then
		self.Text:setText( self.text )
	end
end

local UpdateAlignment = function ( self )
	if self.alignment then
		self.Text:setAlignment( self.alignment )
	end
end

local UpdateColor = function ( self )
	if self.red and self.green and self.blue then
		self:setRGB( self.red, self.green, self.blue )
	end
end

local PostLoadFunc = function ( self )
	self.width = 100
	self.height = 25
	local xModel = self:getModel( Engine.GetPrimaryController(), "x" )
	local yModel = self:getModel( Engine.GetPrimaryController(), "y" )
	local widthModel = self:getModel( Engine.GetPrimaryController(), "width" )
	local heightModel = self:getModel( Engine.GetPrimaryController(), "height" )
	local alphaModel = self:getModel( Engine.GetPrimaryController(), "alpha" )
	local materialModel = self:getModel( Engine.GetPrimaryController(), "text" )
	local alignmentModel = self:getModel( Engine.GetPrimaryController(), "alignment" )
	local fadeOverTimeModel = self:getModel( Engine.GetPrimaryController(), "fadeOverTime" )
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
	if widthModel then
		self:subscribeToModel( widthModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.width = modelValue
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
	if alphaModel then
		self:subscribeToModel( alphaModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.alpha = modelValue
				UpdateAlpha( self )
			end
		end )
	end
	if materialModel then
		self:subscribeToModel( materialModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.text = modelValue
				UpdateText( self )
			end
		end )
	end
	if alignmentModel then
		self:subscribeToModel( alignmentModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.alignment = modelValue
				UpdateAlignment( self )
			end
		end )
	end
	if fadeOverTimeModel then
		self:subscribeToModel( fadeOverTimeModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue and tonumber( modelValue ) then
				self.Text:setAlpha( 0 )
				self.Text:beginAnimation( "fadeOverTime", modelValue )
				self.Text:setAlpha( 1 )
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

LUI.createMenu.HudElementText = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "HudElementText" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, false, 294.14, 794.14 )
	Text:setTopBottom( true, false, 96, 121 )
	Text:setRGB( 1, 1, 1 )
	Text:setText( Engine.Localize( "" ) )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
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

