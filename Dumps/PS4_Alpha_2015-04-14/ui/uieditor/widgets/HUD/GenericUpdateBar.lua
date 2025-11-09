local PostLoadFunc = function ( self, controller, menu )
	self.setBarWidth = function ( self, frac )
		self.barImage:setShaderVector( 0, frac, 0, 0, 0 )
	end
	
	if not menu or not menu:getModel() then
		return 
	else
		local menuModel = menu:getModel()
		local fracModel = Engine.GetModel( menuModel, "frac" )
		if not fracModel then
			return 
		else
			self:subscribeToModel( fracModel, function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue then
					local duration = 0
					if Engine.GetModel( menuModel, "duration" ) and Engine.GetModelValue( Engine.GetModel( menuModel, "duration" ) ) then
						duration = Engine.GetModelValue( Engine.GetModel( menuModel, "duration" ) )
					end
					self.barImage:beginAnimation( "update", duration )
					self.barImage:setShaderVector( 0, modelValue, 0, 0, 0 )
				end
			end )
		end
	end
end

CoD.GenericUpdateBar = InheritFrom( LUI.UIElement )
CoD.GenericUpdateBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GenericUpdateBar )
	self.id = "GenericUpdateBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 467 )
	self:setTopBottom( true, false, 0, 49 )
	
	local barImage = LUI.UIImage.new()
	barImage:setLeftRight( true, true, 0, 0 )
	barImage:setTopBottom( true, true, 0, 0 )
	barImage:setRGB( 1, 1, 1 )
	barImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	barImage:setShaderVector( 0, 1, 0, 0, 0 )
	barImage:setShaderVector( 1, 0, 0, 0, 0 )
	barImage:setShaderVector( 2, 1, 0, 0, 0 )
	barImage:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( barImage )
	self.barImage = barImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

