-- f6f177e5d34ad5ff8331c8b36d4d843e
-- This hash is used for caching, delete to decompile the file again

CoD.InGamePlayerListRow = InheritFrom( LUI.UIElement )
CoD.InGamePlayerListRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.InGamePlayerListRow )
	self.id = "InGamePlayerListRow"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 25 )
	
	local teamBackground = LUI.UIImage.new()
	teamBackground:setLeftRight( true, false, 0, 400 )
	teamBackground:setTopBottom( true, false, 0, 25 )
	teamBackground:setAlpha( 0.2 )
	self:addElement( teamBackground )
	self.teamBackground = teamBackground
	
	local rankBackground = LUI.UIImage.new()
	rankBackground:setLeftRight( true, false, 0, 50 )
	rankBackground:setTopBottom( true, false, 0, 25 )
	rankBackground:setRGB( 0, 0, 0 )
	rankBackground:setAlpha( 0.1 )
	self:addElement( rankBackground )
	self.rankBackground = rankBackground
	
	local rankText = LUI.UIText.new()
	rankText:setLeftRight( true, false, 5, 25 )
	rankText:setTopBottom( true, false, 0, 25 )
	rankText:setTTF( "fonts/default.ttf" )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rankText )
	self.rankText = rankText
	
	local rankImage = LUI.UIImage.new()
	rankImage:setLeftRight( true, false, 27, 47 )
	rankImage:setTopBottom( true, false, 2.5, 22.5 )
	self:addElement( rankImage )
	self.rankImage = rankImage
	
	local playerName = LUI.UIText.new()
	playerName:setLeftRight( true, false, 55, 280 )
	playerName:setTopBottom( true, false, 0, 25 )
	playerName:setTTF( "fonts/default.ttf" )
	playerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	playerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( playerName )
	self.playerName = playerName
	
	self.teamBackground:linkToElementModel( self, "teamBGColor", true, function ( model )
		local teamBGColor = Engine.GetModelValue( model )
		if teamBGColor then
			teamBackground:setRGB( teamBGColor )
		end
	end )
	self.rankText:linkToElementModel( self, "rankText", true, function ( model )
		local _rankText = Engine.GetModelValue( model )
		if _rankText then
			rankText:setText( Engine.Localize( _rankText ) )
		end
	end )
	self.rankImage:linkToElementModel( self, "rankIcon", true, function ( model )
		local rankIcon = Engine.GetModelValue( model )
		if rankIcon then
			rankImage:setImage( RegisterImage( rankIcon ) )
		end
	end )
	self.playerName:linkToElementModel( self, "playerNameColor", true, function ( model )
		local playerNameColor = Engine.GetModelValue( model )
		if playerNameColor then
			playerName:setRGB( playerNameColor )
		end
	end )
	self.playerName:linkToElementModel( self, "playerNameText", true, function ( model )
		local playerNameText = Engine.GetModelValue( model )
		if playerNameText then
			playerName:setText( playerNameText )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.teamBackground:close()
		element.rankText:close()
		element.rankImage:close()
		element.playerName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

