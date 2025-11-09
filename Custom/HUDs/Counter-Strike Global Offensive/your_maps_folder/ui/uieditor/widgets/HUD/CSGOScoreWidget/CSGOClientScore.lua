CoD.CSGOClientScore = InheritFrom( LUI.UIElement )
CoD.CSGOClientScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CSGOClientScore )
	self.id = "CSGOClientScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.PortraitImageBG = LUI.UIImage.new()
	self.PortraitImageBG:setLeftRight( true, false, 576, 611 )
	self.PortraitImageBG:setTopBottom( true, false, 1.5, 38 )
	self.PortraitImageBG:setImage( RegisterImage( "$white" ) )
	self.PortraitImageBG:setRGB( 0, 0, 0.11 )
	self.PortraitImageBG:setAlpha( 0.5 )
	self:addElement( self.PortraitImageBG )

	self.PortraitImage = LUI.UIImage.new()
	self.PortraitImage:setLeftRight( true, false, 576, 611 )
	self.PortraitImage:setTopBottom( true, false, 1.5, 38 )
	self.PortraitImage:setImage( RegisterImage( "csgo_player_none" ) )
	self.PortraitImage:linkToElementModel( self, "zombiePlayerIcon", true, function ( model )
		local zombiePlayerIcon = Engine.GetModelValue( model )

		if zombiePlayerIcon then
			if zombiePlayerIcon == "blacktransparent" then
				self.PortraitImage:setImage( RegisterImage( "csgo_player_none" ) )
			else
				self.PortraitImage:setImage( RegisterImage( zombiePlayerIcon ) )
			end
		end
	end )
	self:addElement( self.PortraitImage )

	self.PortraitImageFrame = LUI.UIImage.new()
	self.PortraitImageFrame:setLeftRight( true, false, 576, 611 )
	self.PortraitImageFrame:setTopBottom( true, false, 1.5, 38 )
	self.PortraitImageFrame:setImage( RegisterImage( "csgo_player_frame" ) )
	self.PortraitImageFrame:setRGB( 0.71, 0.83, 0.92 )
	self.PortraitImageFrame:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			self.PortraitImageFrame:setRGB( ZombieClientScoreboardGlowColor( clientNum ) )
		end
	end )
	self:addElement( self.PortraitImageFrame )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PortraitImageBG:close()
		element.PortraitImage:close()
		element.PortraitImageFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
