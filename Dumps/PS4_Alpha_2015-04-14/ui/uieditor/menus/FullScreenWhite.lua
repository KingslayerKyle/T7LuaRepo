local PostLoadFunc = function ( self )
	local fadeOverTimeModel = self:getModel( Engine.GetPrimaryController(), "fadeOverTime" )
	if fadeOverTimeModel then
		self:subscribeToModel( fadeOverTimeModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			local startAlphaModel = self:getModel( Engine.GetPrimaryController(), "startAlpha" )
			local endAlphaModel = self:getModel( Engine.GetPrimaryController(), "endAlpha" )
			local startAlpha = 0
			local endAlpha = 0
			if startAlphaModel then
				startAlpha = Engine.GetModelValue( startAlphaModel )
			end
			if endAlphaModel then
				endAlpha = Engine.GetModelValue( endAlphaModel )
			end
			if modelValue then
				if startAlpha >= 0 then
					self.Fullscreen:setAlpha( startAlpha )
				end
				self.Fullscreen:beginAnimation( "fadeOverTime", modelValue )
				self.Fullscreen:setAlpha( endAlpha )
			end
		end )
	end
end

LUI.createMenu.FullScreenWhite = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FullScreenWhite" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( true, false, 0, 1280 )
	Fullscreen:setTopBottom( true, false, 0, 720 )
	Fullscreen:setImage( RegisterImage( "uie_default_white_255" ) )
	Fullscreen:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
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

