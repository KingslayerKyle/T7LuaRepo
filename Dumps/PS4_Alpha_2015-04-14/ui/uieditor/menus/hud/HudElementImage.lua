local UpdatePosition = function ( self )
	if self.x and self.y and self.width and self.height then
		self.Image:setLeftRight( true, false, self.x, self.x + self.width )
		self.Image:setTopBottom( true, false, self.y, self.y + self.height )
	end
end

local UpdateAlpha = function ( self )
	if self.alpha then
		self.Image:setAlpha( self.alpha )
	end
end

local UpdateMaterial = function ( self )
	if self.imageMaterialName then
		self.Image:setImage( RegisterMaterial( self.imageMaterialName ) )
	end
end

local UpdateColor = function ( self )
	if self.red and self.green and self.blue then
		self:setRGB( self.red, self.green, self.blue )
	end
end

local UpdateRotation = function ( self )
	if self.zRot then
		self.Image:setZRot( self.zRot )
	end
end

local PostLoadFunc = function ( self )
	local xModel = self:getModel( Engine.GetPrimaryController(), "x" )
	local yModel = self:getModel( Engine.GetPrimaryController(), "y" )
	local widthModel = self:getModel( Engine.GetPrimaryController(), "width" )
	local heightModel = self:getModel( Engine.GetPrimaryController(), "height" )
	local alphaModel = self:getModel( Engine.GetPrimaryController(), "alpha" )
	local materialModel = self:getModel( Engine.GetPrimaryController(), "material" )
	local fadeOverTimeModel = self:getModel( Engine.GetPrimaryController(), "fadeOverTime" )
	local redModel = self:getModel( Engine.GetPrimaryController(), "red" )
	local greenModel = self:getModel( Engine.GetPrimaryController(), "green" )
	local blueModel = self:getModel( Engine.GetPrimaryController(), "blue" )
	local zRotModel = self:getModel( Engine.GetPrimaryController(), "zRot" )
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
				self.imageMaterialName = modelValue
				UpdateMaterial( self )
			end
		end )
	end
	if fadeOverTimeModel then
		self:subscribeToModel( fadeOverTimeModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue and tonumber( modelValue ) then
				self.Image:setAlpha( 0 )
				self.Image:beginAnimation( "fadeOverTime", modelValue )
				self.Image:setAlpha( 1 )
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
	if zRotModel then
		self:subscribeToModel( zRotModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				self.zRot = modelValue
				UpdateRotation( self )
			end
		end )
	end
end

LUI.createMenu.HudElementImage = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "HudElementImage" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 576, 704 )
	Image:setTopBottom( true, false, 54, 182 )
	Image:setRGB( 1, 1, 1 )
	Image:setAlpha( 0 )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Image:setZRot( 0 )
	self:addElement( Image )
	self.Image = Image
	
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

